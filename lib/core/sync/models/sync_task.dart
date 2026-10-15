import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_task.freezed.dart';
part 'sync_task.g.dart';

/// Estados de una tarea de sincronización ascendente.
///
/// IMPORTANTE: Isar persiste este enum por ordinal (`@enumerated`).
/// Los nuevos valores SOLO pueden añadirse al final para no corromper datos existentes.
enum SyncStatus {
  pending,
  inProgress,
  completed,
  failed,
  fatalError,

  // FEAT: El ERP rechazó la operación por una regla de negocio (stock real
  // insuficiente, documento duplicado, entrega no verificable...). Requiere
  // revisión humana; nunca se reintenta automáticamente.
  conflict,
}

enum HttpMethod { get, post, put, delete }

enum DocumentType { pedido, albaran }

enum PaymentMethod { efectivo, tarjeta, transferencia, pendiente }

/// [ECC: Inmutabilidad absoluta] Modelo de Dominio con @freezed.
/// Representa una tarea atómica de sincronización ascendente hacia FacturaScripts v3.
@freezed
class SyncTask with _$SyncTask {
  const factory SyncTask({
    required String id,
    required String endpoint,
    required HttpMethod method,
    required Map<String, dynamic> payload,
    @Default(0) int retries,
    @Default(3) int maxRetries,
    @Default(SyncStatus.pending) SyncStatus status,
    required DateTime createdAt,
    DateTime? lastAttemptAt,
    // FEAT: Instante a partir del cual la tarea es elegible (Exponential Backoff).
    DateTime? nextAttemptAt,
    // FIX: true si el ERP pudo haber recibido la petición sin confirmarlo.
    @Default(false) bool deliveryUncertain,
    String? errorMessage,
  }) = _SyncTask;

  factory SyncTask.fromJson(Map<String, dynamic> json) =>
      _$SyncTaskFromJson(json);
}
