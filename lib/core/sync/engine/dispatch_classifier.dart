import 'package:dio/dio.dart';

import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// Los mensajes se guardan en Isar y se muestran en la UI: cortos y sin HTML.
const _maxStoredMessageLength = 160;
final _htmlTag = RegExp(r'<[^>]*>');
final _url = RegExp(r'https?://\S+');
final _whitespace = RegExp(r'\s+');

/// FIX: Clasificación pura y exhaustiva de respuestas HTTP del ERP.
///
/// Diferencias clave con el motor anterior:
/// - 401/403 ya no marcan el pedido como `fatalError` (era un token caducado).
/// - 408/429 son reintentables; 409/422 (y 400 por stock) son `conflict`.
/// - 5xx y timeouts de lectura se marcan como AMBIGUOS: el ERP pudo persistir
///   el documento, así que el reintento exige verificación previa.
DispatchOutcome classifyHttpResponse(
  Response<dynamic> response, {
  ErpResource? resource,
}) {
  final code = response.statusCode ?? 0;
  final message = erpMessageOf(response.data);
  final retryAfter = parseRetryAfter(response.headers);

  return switch (code) {
    >= 200 && < 300 => switch (extractErpId(response.data, resource)) {
        // FIX: Sin `codcliente` no se puede reconciliar el código temporal y
        // los pedidos del cliente quedarían bloqueados para siempre.
        null when resource == ErpResource.clientes =>
          const DispatchOutcome.conflict(
            message: 'Cliente creado en el ERP pero sin `codcliente` en la '
                'respuesta: reconcilie el código manualmente.',
          ),
        final erpId => DispatchOutcome.delivered(erpId: erpId),
      },
    // FIX (Seguridad): con `followRedirects: false` una 3xx llega aquí. Es un
    // problema de configuración de la URL (como un token malo): detiene la
    // cola hasta que se corrija en Ajustes, sin consumir reintentos.
    >= 300 && < 400 => DispatchOutcome.unauthorized(
        message: 'El ERP responde con una redirección (HTTP $code): '
            'configure en Ajustes la URL final HTTPS.',
      ),
    401 || 403 => DispatchOutcome.unauthorized(
        message: 'Token de la API rechazado por el ERP (HTTP $code).',
      ),
    408 || 425 || 429 => DispatchOutcome.transient(
        message: 'ERP saturado (HTTP $code): $message',
        ambiguous: false,
        retryAfter: retryAfter,
      ),
    409 || 422 => DispatchOutcome.conflict(
        message: 'Conflicto en ERP (HTTP $code): $message',
      ),
    // FEAT: FacturaScripts suele devolver 400 genérico ante errores de negocio.
    400 when _mentionsStock(message) => DispatchOutcome.conflict(
        message: 'Stock insuficiente en ERP: $message',
      ),
    >= 400 && < 500 => DispatchOutcome.rejected(
        message: 'Petición rechazada por el ERP (HTTP $code): $message',
      ),
    _ => DispatchOutcome.transient(
        message: 'Error del servidor ERP (HTTP $code): $message',
        ambiguous: true,
        retryAfter: retryAfter,
      ),
  };
}

/// FIX: Distingue "nunca salió del dispositivo" de "pudo llegar al ERP".
DispatchOutcome classifyDioException(
  DioException error, {
  ErpResource? resource,
}) =>
    switch (error) {
      DioException(
        type: DioExceptionType.connectionTimeout ||
            DioExceptionType.badCertificate
      ) =>
        DispatchOutcome.unreachable(
          message: 'ERP inalcanzable (${error.type.name}).',
        ),
      // El socket puede caer después de enviar el cuerpo: no hay garantías.
      DioException(type: DioExceptionType.connectionError) =>
        // `error.message` incluye la URI con filtros (p. ej. cifnif): no se
        // persiste.
        const DispatchOutcome.unreachable(
          message: 'Conexión interrumpida con el ERP.',
          ambiguous: true,
        ),
      DioException(
        type: DioExceptionType.sendTimeout || DioExceptionType.receiveTimeout
      ) =>
        DispatchOutcome.transient(
          message: 'Timeout esperando al ERP (${error.type.name}).',
          ambiguous: true,
        ),
      DioException(type: DioExceptionType.badResponse, :final response?) =>
        classifyHttpResponse(response, resource: resource),
      _ => DispatchOutcome.transient(
          message: 'Error de comunicación no clasificado (${error.type.name}).',
          ambiguous: true,
        ),
    };

/// Extrae el identificador del registro creado según el recurso.
/// Acepta tanto `{...campos}` como el sobre `{"data": {...campos}}`.
String? extractErpId(Object? body, ErpResource? resource) => switch (body) {
      // `crear*` responde {"doc": {...}, "lines": [...]}; el REST {"ok", "data"}.
      {'doc': final Map<String, dynamic> inner} ||
      {'data': final Map<String, dynamic> inner} =>
        extractErpId(inner, resource),
      final Map<String, dynamic> fields when resource != null => resource
          .idFields
          .map((field) => fields[field])
          .nonNulls
          .firstOrNull
          ?.toString(),
      _ => null,
    };

/// Mensaje legible del ERP, saneado (sin HTML ni URLs) y truncado.
/// FIX (Seguridad): antes se persistía el cuerpo completo (o `toString()` de
/// un JSON con datos de clientes) en Isar y se mostraba en la UI.
String erpMessageOf(Object? body) {
  final raw = switch (body) {
    {'message': final String message} => message,
    {'error': final String message} => message,
    final String text when text.trim().isNotEmpty => text,
    null => 'sin cuerpo de respuesta',
    _ => 'respuesta sin mensaje de error',
  };
  final clean = raw
      .replaceAll(_htmlTag, ' ')
      .replaceAll(_url, '[url]')
      .replaceAll(_whitespace, ' ')
      .trim();
  return clean.length > _maxStoredMessageLength
      ? '${clean.substring(0, _maxStoredMessageLength)}…'
      : clean;
}

Duration? parseRetryAfter(Headers headers) =>
    switch (int.tryParse(headers['retry-after']?.firstOrNull ?? '')) {
      final int seconds when seconds >= 0 => Duration(seconds: seconds),
      _ => null,
    };

bool _mentionsStock(String message) => message.toLowerCase().contains('stock');
