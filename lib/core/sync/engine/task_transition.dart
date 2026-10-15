import 'package:app_preventa/core/sync/engine/retry_policy.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// Nuevo estado persistible de una tarea tras un intento de envío (inmutable).
typedef TaskTransition = ({
  SyncStatus status,
  int retries,
  DateTime? nextAttemptAt,
  bool deliveryUncertain,
  String? errorMessage,
  String? erpId,
});

/// [ECC: Pattern Matching] Máquina de estados pura de la cola ascendente.
///
/// FIX respecto al motor anterior:
/// - Un envío correcto ya no incrementa `retries`.
/// - Los fallos de canal (sin red / token) NO consumen reintentos.
/// - Los fallos transitorios se reprograman con backoff en `nextAttemptAt`
///   en lugar de reintentarse en el siguiente disparo (martilleo del ERP).
/// - Se respeta `task.maxRetries` (antes había un `3` fijo en la consulta).
TaskTransition resolveTransition({
  required SyncTask task,
  required DispatchOutcome outcome,
  required DateTime now,
  required RetryPolicy policy,
}) =>
    switch (outcome) {
      DispatchDelivered(:final erpId) => (
          status: SyncStatus.completed,
          retries: task.retries,
          nextAttemptAt: null,
          deliveryUncertain: false,
          errorMessage: null,
          erpId: erpId,
        ),
      // FIX (cola bloqueada): un corte a mitad de envío pudo ser provocado por
      // ESTA tarea (p. ej. firma SVG enorme → proxy resetea). Consume intento
      // para que una tarea venenosa acabe en `failed` y no bloquee la cola.
      DispatchUnreachable(:final message, ambiguous: true) => _retryOrGiveUp(
          task: task,
          message: message,
          deliveryUncertain: true,
          retryAfter: null,
          now: now,
          policy: policy,
        ),
      // Fallo de canal puro: no consume intento, pero aparta la tarea un
      // `channelCooldown` para que las siguientes de la cola puedan avanzar.
      DispatchUnreachable(:final message) ||
      DispatchUnauthorized(:final message) =>
        (
          status: SyncStatus.pending,
          retries: task.retries,
          nextAttemptAt: now.add(policy.channelCooldown),
          deliveryUncertain: task.deliveryUncertain,
          errorMessage: message,
          erpId: null,
        ),
      DispatchTransient(:final message, :final ambiguous, :final retryAfter) =>
        _retryOrGiveUp(
          task: task,
          message: message,
          deliveryUncertain: ambiguous || task.deliveryUncertain,
          retryAfter: retryAfter,
          now: now,
          policy: policy,
        ),
      DispatchConflict(:final message) => (
          status: SyncStatus.conflict,
          retries: task.retries,
          nextAttemptAt: null,
          deliveryUncertain: task.deliveryUncertain,
          errorMessage: message,
          erpId: null,
        ),
      DispatchRejected(:final message) => (
          status: SyncStatus.fatalError,
          retries: task.retries,
          nextAttemptAt: null,
          deliveryUncertain: task.deliveryUncertain,
          errorMessage: message,
          erpId: null,
        ),
    };

TaskTransition _retryOrGiveUp({
  required SyncTask task,
  required String message,
  required bool deliveryUncertain,
  required Duration? retryAfter,
  required DateTime now,
  required RetryPolicy policy,
}) {
  final attempts = task.retries + 1;
  final exhausted = attempts >= task.maxRetries;

  return (
    status: exhausted ? SyncStatus.failed : SyncStatus.pending,
    retries: attempts,
    // FEAT: Exponential Backoff persistido; `failed` espera reencolado manual.
    nextAttemptAt: exhausted
        ? null
        : now.add(policy.delayFor(attempts, retryAfter: retryAfter)),
    deliveryUncertain: deliveryUncertain,
    errorMessage: exhausted
        ? 'Reintentos agotados ($attempts/${task.maxRetries}): $message'
        : message,
    erpId: null,
  );
}
