import 'package:dio/dio.dart';

import 'package:app_preventa/core/sync/engine/dispatch_classifier.dart';
import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// Capa HTTP de la cola ascendente. Nunca lanza `DioException`: todo fallo se
/// traduce a un [DispatchOutcome] tipado.
final class ErpDispatcher {
  const ErpDispatcher(this._dio);

  final Dio _dio;

  static final _formOptions =
      Options(contentType: Headers.formUrlEncodedContentType);

  Future<DispatchOutcome> send(SyncTask task) async {
    final resource = ErpResource.fromEndpoint(task.endpoint);
    try {
      // El token lo inyecta el interceptor; el cuerpo va como formulario.
      final response = await switch (task.method) {
        HttpMethod.post => _dio.post<dynamic>(
            task.endpoint,
            data: encodeFormFields(task.payload),
            options: _formOptions,
          ),
        HttpMethod.put => _dio.put<dynamic>(
            task.endpoint,
            data: encodeFormFields(task.payload),
            options: _formOptions,
          ),
        HttpMethod.get => _dio.get<dynamic>(task.endpoint),
        HttpMethod.delete => _dio.delete<dynamic>(task.endpoint),
      };
      return classifyHttpResponse(response, resource: resource);
    } on DioException catch (error) {
      return classifyDioException(error, resource: resource);
    }
  }

  /// FIX (Idempotencia): antes de reenviar una entrega dudosa se consulta al
  /// ERP por la clave generada en el dispositivo (`numero2` / `cifnif`).
  ///
  /// Devuelve:
  /// - `null` → el ERP no la tiene: es seguro reenviar.
  /// - [DispatchDelivered] → ya existía: se marca completada sin duplicar.
  /// - Otro outcome → no se pudo verificar; la tarea sigue marcada como dudosa.
  Future<DispatchOutcome?> verifyDelivery(SyncTask task) async {
    final resource = ErpResource.fromEndpoint(task.endpoint);

    return switch ((resource, task.payload[resource?.dedupeField])) {
      (final ErpResource resource, final String key) when key.isNotEmpty =>
        await _lookup(resource, key),
      _ => const DispatchOutcome.conflict(
          message: 'Entrega dudosa sin clave de idempotencia: '
              'verifique manualmente en el ERP antes de reenviar.',
        ),
    };
  }

  Future<DispatchOutcome?> _lookup(ErpResource resource, String key) async {
    try {
      final response = await _dio.get<dynamic>(
        resource.lookupPath,
        queryParameters: {'filter[${resource.dedupeField}]': key, 'limit': 1},
      );

      final rows = switch (response.data) {
        final List<dynamic> rows => rows,
        {'data': final List<dynamic> rows} => rows,
        _ => null,
      };

      return switch (rows) {
        null => const DispatchOutcome.transient(
            message: 'Respuesta de verificación no reconocida.',
            ambiguous: true,
          ),
        [] => null,
        [final Map<String, dynamic> row, ...]
            when '${row[resource.dedupeField]}' == key =>
          DispatchOutcome.delivered(erpId: extractErpId(row, resource)),
        // Si el ERP ignoró el filtro devolverá filas ajenas: no es fiable
        // decidir automáticamente, así que se escala a revisión humana.
        _ => const DispatchOutcome.conflict(
            message:
                'El ERP no aplicó el filtro de verificación de duplicados.',
          ),
      };
    } on DioException catch (error) {
      return switch (classifyDioException(error, resource: resource)) {
        DispatchRejected(:final message) ||
        DispatchConflict(:final message) =>
          DispatchOutcome.conflict(
            message: 'No se pudo verificar la entrega previa: $message',
          ),
        final outcome => outcome,
      };
    }
  }
}
