/// Prefijo de los códigos de cliente generados offline, pendientes de alta en el ERP.
const tempClientCodePrefix = 'TEMP-CLI-';

/// Prefijo de las claves de payload que son metadatos locales y NUNCA se
/// envían al ERP (p. ej. `_temp_codcliente`).
const localPayloadKeyPrefix = '_';

/// Clave local con el código temporal de un cliente creado offline.
const tempClientCodeKey = '${localPayloadKeyPrefix}temp_codcliente';

/// Reintentos de fallos de SERVIDOR (5xx/timeouts) antes de pasar a `failed`.
/// Con el backoff (10 s · 2^n) cubre ~20 min de caída del ERP. Los fallos de
/// red pura no consumen reintentos.
const defaultTaskMaxRetries = 8;

/// Recursos de FacturaScripts v3 que la cola ascendente sabe despachar y verificar.
///
/// FIX (Contrato API, verificado en el código fuente de FacturaScripts):
/// - Los recursos REST son el plural en minúsculas del modelo (`PedidoCliente`
///   → `pedidoclientes`); `pedidoscliente`/`albaranescliente` no existen (404).
/// - Un documento con líneas se crea con `crearPedidoCliente` /
///   `crearAlbaranCliente` (`Core/Controller/ApiCreateDocument.php`), que
///   guarda cabecera y líneas en una única transacción del ERP.
enum ErpResource {
  clientes(
    createPath: '/api/3/clientes',
    lookupPath: '/api/3/clientes',
    idFields: ['codcliente'],
    dedupeField: 'cifnif',
  ),
  pedidos(
    createPath: '/api/3/crearPedidoCliente',
    lookupPath: '/api/3/pedidoclientes',
    idFields: ['codigo', 'idpedido'],
    dedupeField: 'numero2',
  ),
  albaranes(
    createPath: '/api/3/crearAlbaranCliente',
    lookupPath: '/api/3/albaranclientes',
    idFields: ['codigo', 'idalbaran'],
    dedupeField: 'numero2',
  );

  const ErpResource({
    required this.createPath,
    required this.lookupPath,
    required this.idFields,
    required this.dedupeField,
  });

  /// Endpoint de creación (el `endpoint` persistido en la tarea).
  final String createPath;

  /// Endpoint REST de listado, usado para verificar entregas dudosas.
  final String lookupPath;

  /// Campos de la respuesta que identifican el registro creado, por prioridad.
  final List<String> idFields;

  /// Campo único generado en el dispositivo que permite consultar al ERP si un
  /// envío dudoso ya fue persistido (clave de idempotencia).
  final String dedupeField;

  static ErpResource? fromEndpoint(String endpoint) =>
      values.where((resource) => resource.createPath == endpoint).firstOrNull;
}
