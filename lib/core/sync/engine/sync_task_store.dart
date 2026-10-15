import 'dart:convert';

import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/follow_up_tasks.dart';
import 'package:app_preventa/core/sync/engine/task_transition.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Acceso transaccional a la cola persistente. Las entidades Isar son mutables
/// por diseño del ORM: toda mutación queda confinada a este archivo y siempre
/// sobre una instancia RELEÍDA dentro de la transacción (evita lost updates).
final class SyncTaskStore {
  const SyncTaskStore(this._isar);

  final Isar _isar;

  /// FIX (Crash-safety): una tarea en `inProgress` al iniciar la pasada es
  /// huérfana (la app murió a mitad de envío). Se devuelve a `pending` marcada
  /// como dudosa para verificar en el ERP antes de reenviarla.
  ///
  /// Válido porque `SyncEngine` garantiza una única pasada por proceso. Si se
  /// añade un worker en otro isolate (workmanager), sustituir por un lease.
  Future<int> recoverOrphanedTasks() => _isar.writeTxn(() async {
        final orphans = await _isar.syncTaskCollections
            .filter()
            .statusEqualTo(SyncStatus.inProgress)
            .findAll();
        for (final task in orphans) {
          task
            ..status = SyncStatus.pending
            ..deliveryUncertain = true
            ..nextAttemptAt = null;
        }
        await _isar.syncTaskCollections.putAll(orphans);
        return orphans.length;
      });

  /// Solo IDs: no se cargan payloads (firmas SVG) de toda la cola en memoria.
  /// Orden FIFO por `createdAt` para que el alta de un cliente preceda a sus pedidos.
  Future<List<int>> dueTaskIds(DateTime now) => _isar.syncTaskCollections
      .filter()
      .statusEqualTo(SyncStatus.pending)
      .and()
      .group(
        (q) => q
            .nextAttemptAtIsNull()
            .or()
            .nextAttemptAtLessThan(now, include: true),
      )
      .sortByCreatedAt()
      .isarIdProperty()
      .findAll();

  /// Próximo vencimiento futuro de backoff, para programar el despertador.
  Future<DateTime?> nextDueAt(DateTime now) => _isar.syncTaskCollections
      .filter()
      .statusEqualTo(SyncStatus.pending)
      .nextAttemptAtGreaterThan(now)
      .nextAttemptAtProperty()
      .min();

  Future<SyncTaskCollection?> findById(int id) =>
      _isar.syncTaskCollections.get(id);

  /// Estado de la tarea de alta del cliente creado offline con [tempCode].
  Future<SyncStatus?> clientTaskStatus(String tempCode) =>
      _isar.syncTaskCollections
          .filter()
          .endpointEqualTo(ErpResource.clientes.createPath)
          .and()
          .payloadJsonContains(tempCode)
          .statusProperty()
          .findFirst();

  /// FIX (Doble envío): claim atómico compare-and-set. Isar serializa las
  /// transacciones de escritura, así que solo un llamador puede pasar de
  /// `pending` a `inProgress`.
  Future<bool> claim(int id, DateTime now) => _isar.writeTxn(() async {
        final task = await _isar.syncTaskCollections.get(id);
        if (task == null || task.status != SyncStatus.pending) return false;
        task
          ..status = SyncStatus.inProgress
          ..lastAttemptAt = now;
        await _isar.syncTaskCollections.put(task);
        return true;
      });

  /// Persiste la transición y sus efectos colaterales en UNA transacción.
  /// Devuelve cuántas tareas encadenadas se encolaron (dirección, firma...).
  Future<int> applyTransition(
    int id,
    TaskTransition transition, {
    required DateTime now,
    Map<String, Object?> erpRecord = const {},
  }) =>
      _isar.writeTxn(() async {
        final task = await _isar.syncTaskCollections.get(id);
        if (task == null) return 0;

        task
          ..status = transition.status
          ..retries = transition.retries
          ..nextAttemptAt = transition.nextAttemptAt
          ..deliveryUncertain = transition.deliveryUncertain
          ..errorMessage = transition.errorMessage;
        await _isar.syncTaskCollections.put(task);

        final resource = ErpResource.fromEndpoint(task.endpoint);
        if ((transition.status, transition.erpId, resource)
            case (
              SyncStatus.completed,
              final String erpId,
              ErpResource.clientes
            )) {
          await _reconcileTempClient(task, erpId);
        }

        final linkedOrder = await _mirrorOrderStatus(
            task.uuid, transition.status, transition.erpId);

        if (transition.status != SyncStatus.completed) return 0;
        return _enqueueFollowUps(
          task,
          erpRecord: erpRecord,
          linkedOrder: linkedOrder,
          now: now,
        );
      });

  /// FEAT: encola en la MISMA transacción las tareas que dependen de ids
  /// generados por el ERP. Si ya existían (uuid determinista) no se tocan.
  Future<int> _enqueueFollowUps(
    SyncTaskCollection delivered, {
    required Map<String, Object?> erpRecord,
    required OrderEntity? linkedOrder,
    required DateTime now,
  }) async {
    final planned = planFollowUpTasks(
      deliveredUuid: delivered.uuid,
      deliveredEndpoint: delivered.endpoint,
      deliveredPayload: _tryDecode(delivered.payloadJson) ?? const {},
      erpRecord: erpRecord,
      now: now,
      signatureSvg: linkedOrder?.firmaSvg,
      documentLocalId: linkedOrder?.localId,
    );
    final fresh = [
      for (final task in planned)
        if (await _isar.syncTaskCollections
                .where()
                .uuidEqualTo(task.uuid)
                .count() ==
            0)
          task,
    ];
    await _isar.syncTaskCollections.putAll(fresh);
    return fresh.length;
  }

  /// Estados que el comercial puede revisar desde el historial.
  static const reviewableStatuses = {
    SyncStatus.failed,
    SyncStatus.fatalError,
    SyncStatus.conflict,
  };

  /// FEAT (Revisión): reenvía un documento tras corregir la causa en el ERP.
  /// Conserva `deliveryUncertain`: si el envío anterior fue dudoso, se
  /// verificará en el ERP antes de reenviar (sin duplicados).
  Future<bool> retryTask(String uuid) => _isar.writeTxn(() async {
        final task = await _taskByUuid(uuid);
        if (task == null || !reviewableStatuses.contains(task.status)) {
          return false;
        }
        task
          ..status = SyncStatus.pending
          ..retries = 0
          ..nextAttemptAt = null
          ..errorMessage = null;
        await _isar.syncTaskCollections.put(task);
        await _mirrorOrderStatus(task.uuid, SyncStatus.pending, null);
        return true;
      });

  /// FEAT (Revisión): anula un documento que no llegará al ERP. Si es un
  /// albarán de autoventa, la mercancía no salió de la furgoneta: se repone
  /// el stock local y deja de reservarse en las próximas descargas.
  ///
  /// No se permite sobre tareas `inProgress` (podrían estar llegando al ERP)
  /// ni `completed` (ya existen en el ERP: se anulan allí).
  Future<bool> discardTask(String uuid) => _isar.writeTxn(() async {
        final task = await _taskByUuid(uuid);
        if (task == null ||
            !(reviewableStatuses.contains(task.status) ||
                task.status == SyncStatus.pending)) {
          return false;
        }
        task
          ..status = SyncStatus.discarded
          ..nextAttemptAt = null;
        await _isar.syncTaskCollections.put(task);

        final order =
            await _mirrorOrderStatus(task.uuid, SyncStatus.discarded, null);
        if (order case OrderEntity(documentType: DocumentType.albaran)) {
          await _restoreVanStock(order);
        }
        return true;
      });

  Future<void> _restoreVanStock(OrderEntity order) async {
    for (final line in order.lineas) {
      if (line.referencia case final String reference) {
        final product = await _isar.productEntitys
            .where()
            .referenciaEqualTo(reference)
            .findFirst();
        if (product == null) continue;
        product
          ..stockDisponible += line.cantidad
          ..stockFisico += line.cantidad;
        await _isar.productEntitys.put(product);
      }
    }
  }

  Future<SyncTaskCollection?> _taskByUuid(String uuid) =>
      _isar.syncTaskCollections.where().uuidEqualTo(uuid).findFirst();

  /// Reencola manualmente las tareas `failed` (reintentos agotados).
  Future<int> requeueFailed() => _isar.writeTxn(() async {
        final failed = await _isar.syncTaskCollections
            .filter()
            .statusEqualTo(SyncStatus.failed)
            .findAll();
        for (final task in failed) {
          task
            ..status = SyncStatus.pending
            ..retries = 0
            ..nextAttemptAt = null;
          await _mirrorOrderStatus(task.uuid, SyncStatus.pending, null);
        }
        await _isar.syncTaskCollections.putAll(failed);
        return failed.length;
      });

  Future<void> _reconcileTempClient(
    SyncTaskCollection clientTask,
    String erpId,
  ) async {
    final tempCode = switch (_tryDecode(clientTask.payloadJson)) {
      {tempClientCodeKey: final String code} => code,
      _ => null,
    };
    if (tempCode == null) return;

    final client = await _isar.clientEntitys
        .where()
        .codclienteEqualTo(tempCode)
        .findFirst();
    if (client != null) {
      client.codcliente = erpId;
      await _isar.clientEntitys.put(client);
    }

    final linkedOrders =
        await _isar.orderEntitys.filter().codclienteEqualTo(tempCode).findAll();
    for (final order in linkedOrders) {
      order.codcliente = erpId;
    }
    await _isar.orderEntitys.putAll(linkedOrders);

    // FIX: Antes solo se actualizaba OrderEntity; el payload ENCOLADO seguía
    // llevando el código temporal y el ERP rechazaba el pedido (4xx → fatal).
    final dependentTasks = await _isar.syncTaskCollections
        .filter()
        .payloadJsonContains(tempCode)
        .and()
        .not()
        .uuidEqualTo(clientTask.uuid)
        .and()
        .not()
        .statusEqualTo(SyncStatus.completed)
        .findAll();
    for (final task in dependentTasks) {
      task.payloadJson =
          replaceClientCode(task.payloadJson, from: tempCode, to: erpId);
    }
    await _isar.syncTaskCollections.putAll(dependentTasks);
  }

  Future<OrderEntity?> _mirrorOrderStatus(
    String taskUuid,
    SyncStatus status,
    String? erpId,
  ) async {
    final linkedOrder = await _isar.orderEntitys
        .filter()
        .syncTaskIdEqualTo(taskUuid)
        .findFirst();
    if (linkedOrder == null) return null;

    linkedOrder.syncStatus = status;
    if (erpId != null) {
      linkedOrder.erpId = erpId;
    }
    await _isar.orderEntitys.put(linkedOrder);
    return linkedOrder;
  }
}

/// Sustituye `codcliente` en un payload JSON devolviendo un JSON nuevo.
String replaceClientCode(
  String payloadJson, {
  required String from,
  required String to,
}) =>
    switch (_tryDecode(payloadJson)) {
      final Map<String, dynamic> payload when payload['codcliente'] == from =>
        jsonEncode({...payload, 'codcliente': to}),
      _ => payloadJson,
    };

/// Decodifica un payload persistido sin lanzar: `null` si está corrupto.
Map<String, dynamic>? tryDecodePayload(String json) => _tryDecode(json);

Map<String, dynamic>? _tryDecode(String json) {
  try {
    return switch (jsonDecode(json)) {
      final Map<String, dynamic> map => map,
      _ => null,
    };
  } on FormatException {
    return null;
  }
}
