import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_task.freezed.dart';
part 'sync_task.g.dart';

enum SyncStatus { pending, inProgress, completed, failed, fatalError }

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
    String? errorMessage,
  }) = _SyncTask;

  factory SyncTask.fromJson(Map<String, dynamic> json) =>
      _$SyncTaskFromJson(json);
}
