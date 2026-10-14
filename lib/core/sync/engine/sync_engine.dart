import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../models/catalog_dtos.dart';
import '../models/sync_task.dart';
import '../models/sync_task_collection.dart';
import '../states/catalog_sync_state.dart';

/// Catálogo de datos locales desacoplado
class ClientCatalog {
  final ClientEntity? client;
  final List<ProductEntity> products;

  const ClientCatalog({required this.client, required this.products});
}

/// Motor de Sincronización Bidireccional Offline-First
class SyncEngine {
  // [ECC: Inyección de Dependencias] Instancias requeridas por constructor
  final Isar _isar;
  final Dio _dio;
  final Connectivity _connectivity;

  final StreamController<CatalogSyncState> _catalogSyncController =
      StreamController<CatalogSyncState>.broadcast();

  SyncEngine({
    required Isar isar,
    required Dio dio,
    required Connectivity connectivity,
  })  : _isar = isar,
        _dio = dio,
        _connectivity = connectivity;

  /// Stream reactivo para observar el progreso de la sincronización de catálogo en la UI.
  Stream<CatalogSyncState> get catalogSyncStream =>
      _catalogSyncController.stream;

  /// Carga concurrente estructurada del catálogo local de un cliente.
  /// [ECC: Concurrencia Estructurada & Records Dart 3]
  /// Paraleliza las lecturas a Isar y destructura directamente la tupla resultante.
  Future<ClientCatalog> loadClientCatalog(String codcliente) async {
    final (ClientEntity? client, List<ProductEntity> products) = await (
      _isar.clientEntitys.where().codclienteEqualTo(codcliente).findFirst(),
      _isar.productEntitys.where().findAll(),
    ).wait;

    return ClientCatalog(client: client, products: products);
  }

  /// Sincronización Descendente (Downstream Sync):
  /// Descarga incremental del catálogo de FacturaScripts v3 (Clientes y Artículos) hacia Isar.
  /// [ECC: Concurrencia Estructurada & Estados Jerárquicos]
  Future<void> pullDownstreamCatalog({bool forceFullSync = false}) async {
    // 1. Verificación de conectividad
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _catalogSyncController.add(
        const CatalogSyncState.failure(
          errorMessage: 'Sin conectividad para sincronizar con FacturaScripts.',
          canRetry: true,
        ),
      );
      return;
    }

    _catalogSyncController.add(
      const CatalogSyncState.inProgress(
        currentStep: 'Consultando metadatos y deltas de sincronización...',
        progress: 0.1,
      ),
    );

    try {
      // 2. Consulta paralela de metadatos de sincronización previa
      final (
        SyncMetadataCollection? clientMeta,
        SyncMetadataCollection? productMeta
      ) = await (
        _isar.syncMetadataCollections
            .filter()
            .entityNameEqualTo('clientes')
            .findFirst(),
        _isar.syncMetadataCollections
            .filter()
            .entityNameEqualTo('articulos')
            .findFirst(),
      ).wait;

      _catalogSyncController.add(
        const CatalogSyncState.inProgress(
          currentStep: 'Descargando clientes y artículos concurrentemente...',
          progress: 0.3,
        ),
      );

      // 3. Concurrencia Estructurada: Descarga paralela de endpoints de FacturaScripts v3
      final (Response<dynamic> clientResp, Response<dynamic> productResp) =
          await (
        _fetchFacturaScriptsCatalog(
          endpoint: '/api/3/clientes',
          lastSyncAt: forceFullSync ? null : clientMeta?.lastSyncAt,
        ),
        _fetchFacturaScriptsCatalog(
          endpoint: '/api/3/articulos',
          lastSyncAt: forceFullSync ? null : productMeta?.lastSyncAt,
        ),
      ).wait;

      _catalogSyncController.add(
        const CatalogSyncState.inProgress(
          currentStep: 'Mapeando y persistiendo registros en base local...',
          progress: 0.7,
        ),
      );

      // 4. Mapeo strongly-typed a DTOs y entidades Isar
      final clientListRaw = clientResp.data is List
          ? clientResp.data as List
          : (clientResp.data as Map<String, dynamic>)['data'] as List? ?? [];

      final productListRaw = productResp.data is List
          ? productResp.data as List
          : (productResp.data as Map<String, dynamic>)['data'] as List? ?? [];

      final clientEntities = clientListRaw
          .map((item) =>
              FacturaScriptsClientDto.fromJson(item as Map<String, dynamic>)
                  .toEntity())
          .toList();

      final productEntities = productListRaw
          .map((item) =>
              FacturaScriptsProductDto.fromJson(item as Map<String, dynamic>)
                  .toEntity())
          .toList();

      final now = DateTime.now();

      final updatedClientMeta = (clientMeta ?? SyncMetadataCollection())
        ..entityName = 'clientes'
        ..lastSyncAt = now
        ..lastCount = clientEntities.length;

      final updatedProductMeta = (productMeta ?? SyncMetadataCollection())
        ..entityName = 'articulos'
        ..lastSyncAt = now
        ..lastCount = productEntities.length;

      // 5. Escritura atómica por lotes en Isar
      await _isar.writeTxn(() async {
        if (clientEntities.isNotEmpty) {
          await _isar.clientEntitys.putAll(clientEntities);
        }
        if (productEntities.isNotEmpty) {
          await _isar.productEntitys.putAll(productEntities);
        }
        await _isar.syncMetadataCollections.putAll([
          updatedClientMeta,
          updatedProductMeta,
        ]);
      });

      _catalogSyncController.add(
        CatalogSyncState.success(
          completedAt: now,
          clientsUpdated: clientEntities.length,
          productsUpdated: productEntities.length,
        ),
      );
    } on DioException catch (dioError) {
      // [ECC: Control de Flujo con Pattern Matching]
      final errorMessage = switch (dioError.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.connectionError =>
          'Tiempo de espera agotado al conectar con FacturaScripts.',
        DioExceptionType.badResponse =>
          'Error HTTP del servidor ERP (${dioError.response?.statusCode}).',
        _ => 'Error de comunicación: ${dioError.message}',
      };

      _catalogSyncController.add(
        CatalogSyncState.failure(
          errorMessage: errorMessage,
          canRetry: true,
        ),
      );
    } catch (e) {
      _catalogSyncController.add(
        CatalogSyncState.failure(
          errorMessage: 'Error inesperado durante la descarga: $e',
          canRetry: false,
        ),
      );
    }
  }

  /// Petición auxiliar a FacturaScripts con parámetros de paginación o fecha delta
  Future<Response<dynamic>> _fetchFacturaScriptsCatalog({
    required String endpoint,
    DateTime? lastSyncAt,
  }) {
    final queryParams = <String, dynamic>{
      'limit': 1000,
      if (lastSyncAt != null)
        'updated_after': lastSyncAt.toIso8601String().substring(0, 19),
    };

    return _dio.get<dynamic>(
      endpoint,
      queryParameters: queryParams,
      options: Options(headers: {'Accept': 'application/json'}),
    );
  }

  /// Procesa la cola ascendente (Upstream Queue) despachando tareas a FacturaScripts v3.
  /// [ECC: Control de Flujo con Pattern Matching]
  Future<void> processUpstreamQueue() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return;
    }

    final pendingTasks = await _isar.syncTaskCollections
        .filter()
        .statusEqualTo(SyncStatus.pending)
        .or()
        .group(
            (q) => q.statusEqualTo(SyncStatus.failed).and().retriesLessThan(3))
        .findAll();

    for (final taskEntity in pendingTasks) {
      final decodedPayload =
          jsonDecode(taskEntity.payloadJson) as Map<String, dynamic>;
      final task = taskEntity.toDomain(decodedPayload);

      await _isar.writeTxn(() async {
        taskEntity.status = SyncStatus.inProgress;
        taskEntity.lastAttemptAt = DateTime.now();
        await _isar.syncTaskCollections.put(taskEntity);
      });

      try {
        final response = await switch (task.method) {
          HttpMethod.post => _dio.post<dynamic>(
              task.endpoint,
              data: task.payload,
              options: Options(headers: {'Content-Type': 'application/json'}),
            ),
          HttpMethod.put => _dio.put<dynamic>(
              task.endpoint,
              data: task.payload,
              options: Options(headers: {'Content-Type': 'application/json'}),
            ),
          HttpMethod.get => _dio.get<dynamic>(task.endpoint),
          HttpMethod.delete => _dio.delete<dynamic>(task.endpoint),
        };

        final (newStatus, errorMsg) = switch (response.statusCode) {
          int code when code >= 200 && code < 300 => (
              SyncStatus.completed,
              null
            ),
          int code when code >= 400 && code < 500 => (
              SyncStatus.fatalError,
              'Error de validación en ERP: ${response.statusCode}'
            ),
          _ => (
              task.retries + 1 >= task.maxRetries
                  ? SyncStatus.failed
                  : SyncStatus.pending,
              'Error inesperado del servidor: ${response.statusCode}'
            ),
        };

        String? erpGeneratedId;
        if (response.data is Map<String, dynamic>) {
          final respData = response.data as Map<String, dynamic>;
          erpGeneratedId = respData['codcliente']?.toString() ??
              respData['idpedido']?.toString() ??
              respData['codigo']?.toString();
        }

        await _updateTaskState(taskEntity, newStatus, errorMsg,
            erpId: erpGeneratedId);
      } on DioException catch (dioError) {
        final (nextStatus, message) = switch (dioError.type) {
          DioExceptionType.connectionTimeout ||
          DioExceptionType.sendTimeout ||
          DioExceptionType.receiveTimeout ||
          DioExceptionType.connectionError =>
            (
              task.retries + 1 >= task.maxRetries
                  ? SyncStatus.failed
                  : SyncStatus.pending,
              'Fallo de conectividad con FacturaScripts: ${dioError.message}',
            ),
          DioExceptionType.badResponse => switch (
                dioError.response?.statusCode) {
              int code when code >= 400 && code < 500 => (
                  SyncStatus.fatalError,
                  'Petición rechazada por FacturaScripts (4xx): ${dioError.response?.data}',
                ),
              _ => (
                  task.retries + 1 >= task.maxRetries
                      ? SyncStatus.failed
                      : SyncStatus.pending,
                  'Error 5xx en FacturaScripts: ${dioError.response?.statusCode}',
                ),
            },
          _ => (
              SyncStatus.fatalError,
              'Excepción Dio irrecuperable: ${dioError.message}'
            ),
        };

        await _updateTaskState(taskEntity, nextStatus, message);
      } catch (e) {
        await _updateTaskState(
          taskEntity,
          SyncStatus.fatalError,
          'Error interno de ejecución: $e',
        );
      }
    }
  }

  Future<void> _updateTaskState(
    SyncTaskCollection entity,
    SyncStatus status,
    String? error, {
    String? erpId,
  }) async {
    await _isar.writeTxn(() async {
      entity.status = status;
      entity.retries += 1;
      entity.errorMessage = error;
      await _isar.syncTaskCollections.put(entity);

      // [ECC: Reconciliación de Clientes Creados Offline]
      if (entity.endpoint == '/api/3/clientes' &&
          status == SyncStatus.completed &&
          erpId != null) {
        final payload = jsonDecode(entity.payloadJson) as Map<String, dynamic>;
        final tempCode = payload['temp_codcliente'] as String?;
        if (tempCode != null) {
          final client = await _isar.clientEntitys
              .where()
              .codclienteEqualTo(tempCode)
              .findFirst();
          if (client != null) {
            client.codcliente = erpId;
            await _isar.clientEntitys.put(client);

            // Reconciliar pedidos vinculados al código temporal
            final linkedOrders = await _isar.orderEntitys
                .filter()
                .codclienteEqualTo(tempCode)
                .findAll();
            for (final order in linkedOrders) {
              order.codcliente = erpId;
              await _isar.orderEntitys.put(order);
            }
          }
        }
      }

      // [ECC: Single Source of Truth] Sincronizar estado del pedido local vinculado
      final linkedOrder = await _isar.orderEntitys
          .filter()
          .syncTaskIdEqualTo(entity.uuid)
          .findFirst();

      if (linkedOrder != null) {
        linkedOrder.syncStatus = status;
        if (erpId != null) {
          linkedOrder.erpId = erpId;
        }
        await _isar.orderEntitys.put(linkedOrder);
      }
    });
  }

  void dispose() {
    _catalogSyncController.close();
  }
}
