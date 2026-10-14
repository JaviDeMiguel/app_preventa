import 'package:isar/isar.dart';

import 'sync_task.dart';

part 'sync_task_collection.g.dart';

/// Entidad Isar para persistencia en disco de la cola de sincronización upstream.
@collection
class SyncTaskCollection {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String uuid;

  late String endpoint;

  @enumerated
  late HttpMethod method;

  late String payloadJson;

  @Index()
  late int retries;

  late int maxRetries;

  @enumerated
  @Index()
  late SyncStatus status;

  late DateTime createdAt;

  DateTime? lastAttemptAt;

  String? errorMessage;

  SyncTask toDomain(Map<String, dynamic> decodedPayload) => SyncTask(
        id: uuid,
        endpoint: endpoint,
        method: method,
        payload: decodedPayload,
        retries: retries,
        maxRetries: maxRetries,
        status: status,
        createdAt: createdAt,
        lastAttemptAt: lastAttemptAt,
        errorMessage: errorMessage,
      );
}

/// Entidad Isar para registro y control de sincronización delta/incremental.
@collection
class SyncMetadataCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String entityName; // 'clientes', 'articulos', 'stocks'

  late DateTime lastSyncAt;

  int lastCount = 0;
}

/// Entidad Isar para clientes descargados de FacturaScripts v3.
@collection
class ClientEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String codcliente;

  @Index(type: IndexType.value, caseSensitive: false)
  late String nombre;

  late String cifnif;

  String? telefono;

  String? email;

  String? direccion;

  String? codpostal;

  String? ciudad;

  double riesgomax = 0.0;

  double deuda = 0.0;

  String? codtarifa;

  bool recargo = false;

  DateTime? updatedAt;
}

/// Entidad Isar para catálogo de artículos y tarifas locales.
@collection
class ProductEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String referencia;

  @Index(type: IndexType.value, caseSensitive: false)
  late String descripcion;

  late double precio;

  late double iva;

  late int stockFisico;

  late int stockDisponible;

  late bool bloqueado;

  DateTime? updatedAt;
}

/// Línea de pedido incrustada en Isar
@embedded
class OrderLineEmbedded {
  String? referencia;
  String? descripcion;
  int cantidad = 1;
  double pvpunitario = 0.0;
  double dsc = 0.0;
  double iva = 21.0;
  double pvptotal = 0.0;
}

/// Entidad Isar para pedidos creados localmente (Single Source of Truth)
@collection
class OrderEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String localId;

  String? erpId; // Código devuelto por FacturaScripts (ej: 'PED-2026-0042')

  @Index()
  late String codcliente;

  late String nombreCliente;

  late DateTime fecha;

  late double totalNeto;

  late double totalIva;

  late double totalFinal;

  @enumerated
  @Index()
  late SyncStatus syncStatus;

  @enumerated
  late DocumentType documentType;

  @enumerated
  late PaymentMethod paymentMethod;

  bool isPaid = false;

  double paidAmount = 0.0;

  String? syncTaskId;

  String? firmaSvg;

  String? firmanteNombre;

  String? firmanteDni;

  List<OrderLineEmbedded> lineas = [];
}

/// Entidad Isar para persistencia de configuración local (URL y Token)
@collection
class AppSettingsEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key;

  late String value;
}
