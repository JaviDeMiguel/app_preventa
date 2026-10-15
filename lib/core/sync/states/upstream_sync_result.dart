import 'package:freezed_annotation/freezed_annotation.dart';

part 'upstream_sync_result.freezed.dart';

/// [ECC: Sealed + Freezed] Resultado tipado de un único envío al ERP.
/// Sustituye a las tuplas `(SyncStatus, String?)` dispersas del motor anterior.
@freezed
sealed class DispatchOutcome with _$DispatchOutcome {
  /// El ERP confirmó la operación (o la verificación encontró el registro).
  /// [record] son los campos del registro creado (ids numéricos, contacto por
  /// defecto...) para encadenar tareas posteriores. Solo vive en memoria.
  const factory DispatchOutcome.delivered({
    String? erpId,
    @Default(<String, Object?>{}) Map<String, Object?> record,
  }) = DispatchDelivered;

  /// Fallo del canal (sin red, TLS, DNS). No consume reintentos y abre el
  /// circuito. `ambiguous` indica que el socket pudo caer tras enviar el cuerpo.
  const factory DispatchOutcome.unreachable({
    required String message,
    @Default(false) bool ambiguous,
  }) = DispatchUnreachable;

  /// Fallo temporal del servidor (5xx, timeouts, 429). Consume un reintento y
  /// se reprograma con backoff. `ambiguous` = el ERP pudo haberla procesado.
  const factory DispatchOutcome.transient({
    required String message,
    required bool ambiguous,
    Duration? retryAfter,
  }) = DispatchTransient;

  /// Token de la API inválido/caducado: problema de configuración, no del pedido.
  const factory DispatchOutcome.unauthorized({required String message}) =
      DispatchUnauthorized;

  /// Regla de negocio del ERP (stock, duplicado...): requiere revisión humana.
  const factory DispatchOutcome.conflict({required String message}) =
      DispatchConflict;

  /// Petición inválida de forma permanente (4xx de validación, payload corrupto).
  const factory DispatchOutcome.rejected({required String message}) =
      DispatchRejected;
}

/// Lo que ocurrió con una tarea concreta durante una pasada de la cola.
@freezed
sealed class TaskStep with _$TaskStep {
  /// Ya no estaba pendiente al reclamarla.
  const factory TaskStep.skipped() = TaskSkipped;

  /// Bloqueada por una dependencia (p. ej. cliente creado offline sin alta en ERP).
  const factory TaskStep.deferred({required String reason}) = TaskDeferred;

  const factory TaskStep.attempted(DispatchOutcome outcome) = TaskAttempted;
}

/// Contadores inmutables de una pasada de la cola ascendente.
@freezed
abstract class UpstreamRunStats with _$UpstreamRunStats {
  const UpstreamRunStats._();

  const factory UpstreamRunStats({
    @Default(0) int delivered,
    @Default(0) int rescheduled,
    @Default(0) int deferred,
    @Default(0) int conflicts,
    @Default(0) int rejected,
  }) = _UpstreamRunStats;

  UpstreamRunStats record(TaskStep step) => switch (step) {
        TaskSkipped() => this,
        TaskDeferred() => copyWith(deferred: deferred + 1),
        TaskAttempted(outcome: DispatchDelivered()) =>
          copyWith(delivered: delivered + 1),
        TaskAttempted(outcome: DispatchConflict()) =>
          copyWith(conflicts: conflicts + 1),
        TaskAttempted(outcome: DispatchRejected()) =>
          copyWith(rejected: rejected + 1),
        TaskAttempted(
          outcome: DispatchTransient() ||
              DispatchUnreachable() ||
              DispatchUnauthorized()
        ) =>
          copyWith(rescheduled: rescheduled + 1),
      };
}

enum UpstreamHaltReason { network, unauthorized, internalError }

/// Resultado de `SyncEngine.processUpstreamQueue()`, consumible con pattern matching.
@freezed
sealed class UpstreamRunResult with _$UpstreamRunResult {
  const factory UpstreamRunResult.offline() = UpstreamOffline;

  const factory UpstreamRunResult.completed({
    required UpstreamRunStats stats,
    DateTime? nextDueAt,
  }) = UpstreamCompleted;

  /// FIX: Circuit breaker. La pasada se detuvo para no quemar reintentos de
  /// todas las tareas contra un ERP inalcanzable o un token inválido.
  const factory UpstreamRunResult.halted({
    required UpstreamHaltReason reason,
    required String message,
    required UpstreamRunStats stats,
    DateTime? nextDueAt,
  }) = UpstreamHalted;
}
