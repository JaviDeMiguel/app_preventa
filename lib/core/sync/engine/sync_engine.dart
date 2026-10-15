import 'dart:async';
import 'dart:developer' as developer;
import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/network/connectivity_extensions.dart';
import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/engine/erp_dispatcher.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/retry_policy.dart';
import 'package:app_preventa/core/sync/engine/sync_task_store.dart';
import 'package:app_preventa/core/sync/engine/task_transition.dart';
import 'package:app_preventa/core/sync/models/catalog_dtos.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/catalog_sync_state.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

const _logName = 'SyncEngine';

// FIX (Contrato API): recursos reales de FacturaScripts 2018+ (`articulos` no
// existe). Los impuestos y el stock por almacén se descargan aparte.
const _productsEndpoint = '/api/3/productos';
const _taxesEndpoint = '/api/3/impuestos';
const _stocksEndpoint = '/api/3/stocks';
const _catalogPageSize = 500;

/// Tope defensivo: si el ERP ignora `offset` devolvería siempre la misma página.
const _maxCatalogPages = 400;

/// Fallos de canal consecutivos (en tareas distintas) que abren el circuito.
const _channelFailuresToHalt = 2;

/// Catálogo de datos locales desacoplado
class ClientCatalog {
  final ClientEntity? client;
  final List<ProductEntity> products;

  const ClientCatalog({required this.client, required this.products});
}

final class CatalogPaginationException implements Exception {
  const CatalogPaginationException(this.endpoint);

  final String endpoint;

  @override
  String toString() =>
      'El catálogo $endpoint superó $_maxCatalogPages páginas: '
      'posible paginación ignorada por el ERP.';
}

/// Motor de Sincronización Bidireccional Offline-First
class SyncEngine {
  // [ECC: Inyección de Dependencias] Instancias requeridas por constructor
  SyncEngine({
    required Isar isar,
    required Dio dio,
    required Connectivity connectivity,
    RetryPolicy retryPolicy = const RetryPolicy(),
    required FacturaScriptsConfig Function() config,
    DateTime Function()? clock,
  })  : _isar = isar,
        _dio = dio,
        _connectivity = connectivity,
        _config = config,
        _store = SyncTaskStore(isar),
        _dispatcher = ErpDispatcher(dio),
        _retryPolicy = retryPolicy,
        _clock = clock ?? DateTime.now;

  final Isar _isar;
  final Dio _dio;
  final Connectivity _connectivity;
  final FacturaScriptsConfig Function() _config;
  final SyncTaskStore _store;
  final ErpDispatcher _dispatcher;
  final RetryPolicy _retryPolicy;
  final DateTime Function() _clock;

  static const _notConfiguredMessage =
      'Configure la URL (HTTPS) y el token del ERP en Ajustes.';
  static const _credentialsRejectedMessage =
      'El ERP rechazó las credenciales o la URL. Revíselas en Ajustes.';

  /// FIX (Baneo de IP): huella (URL + hash del token, nunca el token) de la
  /// configuración que el ERP rechazó. Mientras no cambie, NINGUNA ruta
  /// (cola, catálogo, botones de la UI) vuelve a enviar peticiones: cada
  /// intento con credenciales malas es una incidencia (5 en 10 min = baneo).
  String? _rejectedCredentials;

  /// Almacén del vehículo configurado (se lee en cada uso: cambia en caliente).
  String? get warehouseCode => _config().warehouseCode;

  /// `true` si la configuración vigente fue rechazada por el ERP.
  bool get credentialsRejected =>
      _rejectedCredentials == _fingerprint(_config());

  static String _fingerprint(FacturaScriptsConfig config) =>
      '${config.baseUrl}|${config.apiToken.hashCode}';

  /// Motivo por el que no se debe contactar con el ERP, o `null`.
  String? _blockedReason(FacturaScriptsConfig config) => switch (config) {
        FacturaScriptsConfig(isConfigured: false) => _notConfiguredMessage,
        _ when _rejectedCredentials == _fingerprint(config) =>
          _credentialsRejectedMessage,
        _ => null,
      };

  final StreamController<CatalogSyncState> _catalogSyncController =
      StreamController<CatalogSyncState>.broadcast();
  CatalogSyncState _catalogState = const CatalogSyncState.idle();
  Future<void>? _catalogPull;

  Future<UpstreamRunResult>? _upstreamRun;
  bool _upstreamRerunRequested = false;

  /// Stream reactivo para observar el progreso de la sincronización de catálogo en la UI.
  Stream<CatalogSyncState> get catalogSyncStream =>
      _catalogSyncController.stream;

  /// FIX: El stream es broadcast sin replay; una pantalla que se suscribe tarde
  /// necesita el último estado como `initialData`.
  CatalogSyncState get currentCatalogState => _catalogState;

  /// Carga concurrente estructurada del catálogo local de un cliente.
  /// FIX: paginado. Antes cargaba TODOS los productos y los deserializaba en
  /// el Main Isolate (jank con catálogos de miles de artículos).
  Future<ClientCatalog> loadClientCatalog(
    String codcliente, {
    int productLimit = 200,
    int productOffset = 0,
  }) async {
    final (ClientEntity? client, List<ProductEntity> products) = await (
      _isar.clientEntitys.where().codclienteEqualTo(codcliente).findFirst(),
      _isar.productEntitys
          .where()
          .offset(productOffset)
          .limit(productLimit)
          .findAll(),
    ).wait;

    return ClientCatalog(client: client, products: products);
  }

  // ───────────────────────── Downstream ─────────────────────────

  /// Sincronización Descendente: catálogo de FacturaScripts v3 → Isar.
  /// FIX: single-flight; dos pulsaciones no lanzan dos descargas completas.
  ///
  /// FIX (Contrato API): siempre es una sincronización COMPLETA y paginada.
  /// La API de FacturaScripts no admite `updated_after` (se ignoraba, así que
  /// el "delta" ya era completo pero truncado a 1000 filas), `Cliente` no tiene
  /// marca de modificación y los movimientos de stock no tocan `Producto`.
  Future<void> pullDownstreamCatalog() {
    if (_catalogPull case final running?) return running;
    final pull = _pullDownstreamCatalog();
    _catalogPull = pull;
    // FIX: antes `_catalogPull = null` vivía en el `finally` interno; si la
    // descarga terminaba sin ningún `await` (ERP sin configurar) ese `finally`
    // se ejecutaba ANTES de esta asignación y quedaba cacheado un future ya
    // completado: el catálogo no volvía a descargarse hasta reiniciar la app.
    return pull.whenComplete(() {
      if (identical(_catalogPull, pull)) _catalogPull = null;
    });
  }

  Future<void> _pullDownstreamCatalog() async {
    final config = _config();
    try {
      if (_blockedReason(config) case final String reason) {
        _emit(CatalogSyncState.failure(errorMessage: reason, canRetry: false));
        return;
      }

      if (!(await _connectivity.checkConnectivity()).hasNetwork) {
        _emit(const CatalogSyncState.failure(
          errorMessage: 'Sin conectividad para sincronizar con FacturaScripts.',
          canRetry: true,
        ));
        return;
      }

      final startedAt = _clock();
      final warehouse = config.warehouseCode;
      // FIX (Sobreventa): foto de los albaranes pendientes ANTES de descargar.
      // Uno que se confirme en el ERP durante la descarga sigue reservado.
      final unsyncedBeforeDownload = await _unsyncedVanSales();
      _emitProgress('Validando acceso al ERP...', 0.1);

      // FIX (Baneo de IP): los impuestos (pocas filas) se descargan primero y
      // en serie como sonda de credenciales. Antes 4 descargas paralelas con
      // un token malo sumaban 4 incidencias de golpe.
      final taxRows =
          await _fetchAllPages(_taxesEndpoint, sortField: 'codimpuesto');

      _emitProgress('Descargando clientes, productos y stock...', 0.3);

      // [ECC: Concurrencia estructurada] 3 descargas paginadas en paralelo.
      final (
        List<Object?> clientRows,
        List<Object?> productRows,
        List<Object?>? stockRows,
      ) = await (
        _fetchAllPages(ErpResource.clientes.lookupPath,
            sortField: 'codcliente'),
        _fetchAllPages(_productsEndpoint, sortField: 'referencia'),
        switch (warehouse) {
          final String code when code.isNotEmpty => _fetchAllPages(
              _stocksEndpoint,
              sortField: 'referencia',
              filters: {'codalmacen': code},
            ),
          _ => Future<List<Object?>?>.value(),
        },
      ).wait;

      _emitProgress('Procesando registros en segundo plano...', 0.6);

      // FIX: Mapeo DTO → entidad (con join de impuestos y stock) fuera del
      // Main Isolate.
      final (:clients, :products) = await _mapCatalogInBackground((
        clients: clientRows,
        products: productRows,
        taxes: taxRows,
        stocks: stockRows,
      ));

      _emitProgress('Persistiendo registros en base local...', 0.8);

      await _isar.writeTxn(() async {
        await _rebaseOnUnsyncedVanSales(products, unsyncedBeforeDownload);
        await _pruneMissing(clients, products);
        await _isar.clientEntitys.putAll(clients);
        await _isar.productEntitys.putAll(products);
        await _isar.syncMetadataCollections.putAll([
          _metadata('clientes', startedAt, clients.length),
          _metadata('articulos', startedAt, products.length),
        ]);
      });

      _emit(CatalogSyncState.success(
        completedAt: _clock(),
        clientsUpdated: clients.length,
        productsUpdated: products.length,
      ));
    }
    // FIX: `(a, b).wait` lanza ParallelWaitError, NO DioException. El catch
    // anterior nunca veía los timeouts y los reportaba como no reintentables.
    on ParallelWaitError catch (error, stackTrace) {
      _failCatalogSync(config, _firstParallelError(error), stackTrace);
    } on IsarError catch (error, stackTrace) {
      _failCatalogSync(config, error, stackTrace);
    } on Exception catch (error, stackTrace) {
      _failCatalogSync(config, error, stackTrace);
    }
    // FIX: `Isolate.run` puede relanzar un Error (RangeError, RemoteError...).
    // Sin este catch el estado quedaba en `inProgress` para siempre. No se
    // silencia: se registra con stack y se publica como fallo no reintentable.
    on Object catch (error, stackTrace) {
      _failCatalogSync(config, error, stackTrace);
    }
  }

  Future<List<Object?>> _fetchAllPages(
    String endpoint, {
    required String sortField,
    Map<String, String> filters = const {},
  }) async {
    final rows = <Object?>[];
    for (var page = 0; page < _maxCatalogPages; page++) {
      final response = await _dio.get<dynamic>(
        endpoint,
        queryParameters: {
          'limit': _catalogPageSize,
          'offset': rows.length,
          // FIX: Orden estable; sin él la paginación por offset puede saltar o
          // repetir filas si el ERP reordena entre páginas.
          'sort[$sortField]': 'ASC',
          for (final MapEntry(:key, :value) in filters.entries)
            'filter[$key]': value,
        },
      );
      // Se para con una página VACÍA (no "< pageSize"): robusto frente a un
      // ERP que limite el tamaño de página por debajo de lo solicitado.
      final pageRows = _extractRows(response.data);
      if (pageRows.isEmpty) return List.unmodifiable(rows);
      rows.addAll(pageRows);
    }
    throw CatalogPaginationException(endpoint);
  }

  Future<List<OrderEntity>> _unsyncedVanSales() => _isar.orderEntitys
      .filter()
      .documentTypeEqualTo(DocumentType.albaran)
      .and()
      .not()
      .syncStatusEqualTo(SyncStatus.completed)
      .findAll();

  /// FIX: La descarga sobrescribía el stock decrementado por albaranes de
  /// autoventa aún no confirmados por el ERP → sobreventa desde la furgoneta.
  /// Se re-aplican los movimientos locales pendientes sobre el stock remoto.
  ///
  /// Se reserva la UNIÓN de los albaranes pendientes antes de descargar y
  /// ahora: los confirmados durante la descarga y los creados durante ella.
  /// En el peor caso se infravalora el stock (seguro), nunca se sobrevalora.
  Future<void> _rebaseOnUnsyncedVanSales(
    List<ProductEntity> products,
    List<OrderEntity> unsyncedBeforeDownload,
  ) async {
    if (products.isEmpty) return;

    final unsyncedNow = await _unsyncedVanSales();
    final reserved = reservedQuantitiesByReference({
      for (final order in [...unsyncedBeforeDownload, ...unsyncedNow])
        order.localId: order,
    }.values);

    // Entidades recién creadas por el isolate de mapeo: propiedad exclusiva.
    for (final product in products) {
      final quantity = reserved[product.referencia] ?? 0;
      product
        ..stockDisponible -= quantity
        ..stockFisico -= quantity;
    }
  }

  /// FIX (Catálogo obsoleto): solo se hacía `putAll`; los clientes dados de
  /// baja y los productos que ya no se venden seguían seleccionables offline
  /// y el ERP rechazaba después el pedido. Como la descarga es completa, lo
  /// que no llega se elimina (salvo clientes creados offline). Una descarga
  /// vacía no borra nada: protege frente a permisos o respuestas anómalas.
  Future<void> _pruneMissing(
    List<ClientEntity> clients,
    List<ProductEntity> products,
  ) async {
    if (clients.isNotEmpty) {
      final keep = {for (final client in clients) client.codcliente};
      final stale = [
        for (final code
            in await _isar.clientEntitys.where().codclienteProperty().findAll())
          if (!keep.contains(code) && !code.startsWith(tempClientCodePrefix))
            code,
      ];
      await _isar.clientEntitys.deleteAllByCodcliente(stale);
    }

    if (products.isNotEmpty) {
      final keep = {for (final product in products) product.referencia};
      final stale = [
        for (final reference in await _isar.productEntitys
            .where()
            .referenciaProperty()
            .findAll())
          if (!keep.contains(reference)) reference,
      ];
      await _isar.productEntitys.deleteAllByReferencia(stale);
    }
  }

  SyncMetadataCollection _metadata(String entity, DateTime at, int count) =>
      SyncMetadataCollection()
        ..entityName = entity
        ..lastSyncAt = at
        ..lastCount = count;

  void _failCatalogSync(
    FacturaScriptsConfig config,
    Object error,
    StackTrace stackTrace,
  ) {
    developer.log(
      'Fallo en sincronización descendente',
      name: _logName,
      error: error,
      stackTrace: stackTrace,
    );

    // FIX (Baneo de IP): un 401/403/3xx en el catálogo también bloquea la
    // cola (antes solo lo hacía la ruta ascendente).
    if (error case DioException(response: Response(:final int statusCode))
        when statusCode == 401 ||
            statusCode == 403 ||
            (statusCode >= 300 && statusCode < 400)) {
      _rejectedCredentials = _fingerprint(config);
    }

    // [ECC: Control de Flujo con Pattern Matching]
    _emit(switch (error) {
      DioException(
        type: DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.receiveTimeout ||
            DioExceptionType.connectionError
      ) =>
        const CatalogSyncState.failure(
          errorMessage:
              'Tiempo de espera agotado al conectar con FacturaScripts.',
          canRetry: true,
        ),
      DioException(response: Response(statusCode: 401 || 403)) =>
        const CatalogSyncState.failure(
          errorMessage: 'Token de la API inválido o sin permisos de lectura.',
          canRetry: false,
        ),
      DioException(response: Response(:final int statusCode))
          when statusCode >= 300 && statusCode < 400 =>
        const CatalogSyncState.failure(
          errorMessage: 'El ERP responde con una redirección: configure en '
              'Ajustes la URL final HTTPS.',
          canRetry: false,
        ),
      DioException(type: DioExceptionType.badResponse, :final response) =>
        CatalogSyncState.failure(
          errorMessage:
              'Error HTTP del servidor ERP (${response?.statusCode}).',
          canRetry: true,
        ),
      // `message` puede incluir la URI con filtros: solo se muestra el tipo.
      DioException(:final type) => CatalogSyncState.failure(
          errorMessage: 'Error de comunicación con el ERP (${type.name}).',
          canRetry: true,
        ),
      FormatException(:final message) => CatalogSyncState.failure(
          errorMessage: 'Respuesta del ERP con formato inesperado: $message',
          canRetry: false,
        ),
      _ => CatalogSyncState.failure(
          errorMessage: 'Error inesperado durante la descarga: $error',
          canRetry: false,
        ),
    });
  }

  void _emitProgress(String step, double progress) => _emit(
        CatalogSyncState.inProgress(currentStep: step, progress: progress),
      );

  void _emit(CatalogSyncState state) {
    // FIX: add() tras dispose() lanzaba StateError con una descarga en vuelo.
    if (_catalogSyncController.isClosed) return;
    _catalogState = state;
    _catalogSyncController.add(state);
  }

  // ───────────────────────── Upstream ─────────────────────────

  /// Procesa la cola ascendente hacia FacturaScripts v3.
  ///
  /// FIX (Duplicados): single-flight. Antes, guardar un pedido + un cambio de
  /// red lanzaban dos pasadas concurrentes que leían las mismas tareas
  /// `pending` y las enviaban DOS veces. Ahora las llamadas concurrentes se
  /// coalescen en una única pasada (con re-ejecución si llegó trabajo nuevo).
  ///
  /// Nunca lanza: los errores se registran y se devuelven como
  /// [UpstreamHalted] para que los `unawaited(...)` no generen errores huérfanos.
  Future<UpstreamRunResult> processUpstreamQueue() {
    if (_upstreamRun case final running?) {
      _upstreamRerunRequested = true;
      return running;
    }
    return _upstreamRun = _drainUpstreamQueue();
  }

  /// Reencola las tareas `failed` (reintentos agotados) y lanza una pasada.
  Future<UpstreamRunResult> retryFailedTasks() async {
    try {
      final requeued = await _store.requeueFailed();
      developer.log('$requeued tareas reencoladas manualmente.',
          name: _logName);
    } on IsarError catch (error, stackTrace) {
      return _internalFailure(error, stackTrace);
    }
    return processUpstreamQueue();
  }

  Future<UpstreamRunResult> _drainUpstreamQueue() async {
    try {
      UpstreamRunResult result;
      do {
        _upstreamRerunRequested = false;
        result = await _runUpstreamOnce();
      } while (_upstreamRerunRequested && result is UpstreamCompleted);
      return result;
    } on IsarError catch (error, stackTrace) {
      return _internalFailure(error, stackTrace);
    } on Exception catch (error, stackTrace) {
      return _internalFailure(error, stackTrace);
    } finally {
      _upstreamRun = null;
    }
  }

  Future<UpstreamRunResult> _runUpstreamOnce() async {
    // La huella se fija al INICIO: si el usuario guarda credenciales nuevas
    // durante la pasada, un rechazo tardío solo bloquea las antiguas.
    final config = _config();

    // FIX (Baneo de IP): sin credenciales válidas ni siquiera se intenta. Al
    // vivir en el motor, cubre también las llamadas directas desde la UI.
    if (_blockedReason(config) case final String reason) {
      return UpstreamRunResult.halted(
        reason: UpstreamHaltReason.unauthorized,
        message: reason,
        stats: const UpstreamRunStats(),
      );
    }

    if (!(await _connectivity.checkConnectivity()).hasNetwork) {
      return const UpstreamRunResult.offline();
    }

    final recovered = await _store.recoverOrphanedTasks();
    if (recovered > 0) {
      developer.log(
        '$recovered tareas huérfanas recuperadas como entrega dudosa.',
        name: _logName,
      );
    }

    // FIX (lost wakeup): `nextDueAt` se calcula respecto al INICIO de la
    // pasada; las tareas que vencen durante ella también reciben despertador.
    final passStartedAt = _clock();
    var stats = const UpstreamRunStats();
    var consecutiveChannelFailures = 0;

    for (final id in await _store.dueTaskIds(passStartedAt)) {
      final step = await _processTask(id);
      stats = stats.record(step);

      // FIX (Baneo de IP): credenciales/URL rechazadas → se corta YA. Cada
      // petición extra con el mismo token sería otra incidencia en el ERP.
      if (step
          case TaskAttempted(outcome: DispatchUnauthorized(:final message))) {
        _rejectedCredentials = _fingerprint(config);
        return UpstreamRunResult.halted(
          reason: UpstreamHaltReason.unauthorized,
          message: message,
          stats: stats,
          nextDueAt: await _store.nextDueAt(passStartedAt),
        );
      }

      final networkFailure = switch (step) {
        TaskAttempted(outcome: DispatchUnreachable(:final message)) => message,
        _ => null,
      };
      consecutiveChannelFailures =
          networkFailure == null ? 0 : consecutiveChannelFailures + 1;

      // FIX: Circuit breaker. Antes, con el ERP caído, CADA tarea consumía un
      // reintento en la misma pasada. Se exigen 2 fallos en tareas DISTINTAS
      // para que una única tarea problemática no detenga toda la cola.
      if ((networkFailure, consecutiveChannelFailures)
          case (final String message, >= _channelFailuresToHalt)) {
        return UpstreamRunResult.halted(
          reason: UpstreamHaltReason.network,
          message: message,
          stats: stats,
          nextDueAt: await _store.nextDueAt(passStartedAt),
        );
      }
    }

    return UpstreamRunResult.completed(
      stats: stats,
      nextDueAt: await _store.nextDueAt(passStartedAt),
    );
  }

  Future<TaskStep> _processTask(int id) async {
    final entity = await _store.findById(id);
    if (entity == null || entity.status != SyncStatus.pending) {
      return const TaskStep.skipped();
    }

    // FIX (Poison message): antes `jsonDecode` estaba fuera del try; un payload
    // corrupto lanzaba en cada pasada y bloqueaba TODA la cola.
    final payload = tryDecodePayload(entity.payloadJson);
    if (payload == null) {
      return _settle(
        id,
        entity.toDomain(const {}),
        const DispatchOutcome.rejected(
          message: 'Payload local corrupto: no es un objeto JSON.',
        ),
      );
    }
    final task = entity.toDomain(payload);

    // FIX: Un pedido de un cliente creado offline no se envía hasta que el
    // cliente tenga código real (antes el ERP lo rechazaba → fatalError).
    if (unresolvedClientDependency(task) case final String tempCode) {
      // FIX (bloqueo silencioso): si el alta del cliente terminó sin código
      // real, el pedido nunca podrá enviarse; se escala a `conflict` visible.
      return switch (await _store.clientTaskStatus(tempCode)) {
        SyncStatus.pending ||
        SyncStatus.inProgress ||
        SyncStatus.failed =>
          TaskStep.deferred(
            reason: 'Esperando el alta en el ERP del cliente $tempCode.',
          ),
        SyncStatus.completed ||
        SyncStatus.fatalError ||
        SyncStatus.conflict ||
        null =>
          await _settle(
            id,
            task,
            DispatchOutcome.conflict(
              message: 'El cliente $tempCode no pudo darse de alta en el '
                  'ERP; revise el cliente antes de reenviar el documento.',
            ),
          ),
      };
    }

    if (!await _store.claim(id, _clock())) return const TaskStep.skipped();

    final (deliveredTask, outcome) = await _deliver(task);
    return _settle(id, deliveredTask, outcome);
  }

  /// FIX (Idempotencia): una entrega dudosa se verifica en el ERP antes de
  /// reenviarse. Así un crash o un receiveTimeout no duplican el pedido.
  Future<(SyncTask, DispatchOutcome)> _deliver(SyncTask task) async {
    if (!task.deliveryUncertain) return (task, await _dispatcher.send(task));

    return switch (await _dispatcher.verifyDelivery(task)) {
      null => (
          task.copyWith(deliveryUncertain: false),
          await _dispatcher.send(task),
        ),
      final outcome => (task, outcome),
    };
  }

  Future<TaskStep> _settle(
    int id,
    SyncTask task,
    DispatchOutcome outcome,
  ) async {
    await _store.applyTransition(
      id,
      resolveTransition(
        task: task,
        outcome: outcome,
        now: _clock(),
        policy: _retryPolicy,
      ),
    );
    return TaskStep.attempted(outcome);
  }

  UpstreamRunResult _internalFailure(Object error, StackTrace stackTrace) {
    developer.log(
      'Fallo interno procesando la cola ascendente',
      name: _logName,
      error: error,
      stackTrace: stackTrace,
    );
    return UpstreamRunResult.halted(
      reason: UpstreamHaltReason.internalError,
      message: '$error',
      stats: const UpstreamRunStats(),
    );
  }

  Future<void> dispose() => _catalogSyncController.close();
}

/// Código temporal de cliente del que depende la tarea, o `null` si no depende.
String? unresolvedClientDependency(SyncTask task) => switch (task.payload) {
      {'codcliente': final String code}
          when code.startsWith(tempClientCodePrefix) &&
              task.endpoint != ErpResource.clientes.createPath =>
        code,
      _ => null,
    };

/// Unidades vendidas en albaranes aún no confirmados por el ERP, por referencia.
Map<String, int> reservedQuantitiesByReference(Iterable<OrderEntity> orders) {
  final reserved = <String, int>{};
  for (final line in orders.expand((order) => order.lineas)) {
    if (line.referencia case final String reference) {
      reserved.update(
        reference,
        (quantity) => quantity + line.cantidad,
        ifAbsent: () => line.cantidad,
      );
    }
  }
  return Map.unmodifiable(reserved);
}

/// Primer error real de un `(…).wait` sobre records de 2 o 4 futuros.
Object _firstParallelError(ParallelWaitError<dynamic, dynamic> error) {
  final asyncErrors = switch (error.errors) {
    (final Object? a, final Object? b) => [a, b],
    (final Object? a, final Object? b, final Object? c) => [a, b, c],
    (final Object? a, final Object? b, final Object? c, final Object? d) => [
        a,
        b,
        c,
        d,
      ],
    _ => const <Object?>[],
  };
  return asyncErrors.whereType<AsyncError>().firstOrNull?.error ?? error;
}

List<Object?> _extractRows(Object? body) => switch (body) {
      final List<Object?> rows => rows,
      {'data': final List<Object?> rows} => rows,
      // FIX: antes un Map sin `data` se trataba como lista vacía y se avanzaba
      // `lastSyncAt` igualmente (fallo silencioso).
      _ => throw FormatException(
          'Se esperaba una lista de registros y llegó ${body.runtimeType}.',
        ),
    };

/// Top-level a propósito: la closure de `Isolate.run` solo captura las filas,
/// nunca `this` (que arrastraría Isar/Dio, no transferibles entre isolates).
Future<MappedCatalog> _mapCatalogInBackground(RawCatalog raw) =>
    Isolate.run(() => mapCatalog(raw));
