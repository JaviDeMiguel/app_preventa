import 'dart:math';

/// FEAT: Exponential Backoff con "equal jitter".
///
/// delay(n) = c/2 + random(0..c/2), con c = min(maxDelay, baseDelay * 2^(n-1)).
/// La mitad fija evita reintentos inmediatos; la aleatoria evita que toda la
/// flota de comerciales golpee el ERP a la vez al volver la cobertura.
final class RetryPolicy {
  const RetryPolicy({
    this.baseDelay = const Duration(seconds: 10),
    this.maxDelay = const Duration(minutes: 30),
    this.channelCooldown = const Duration(minutes: 1),
    Random? random,
  }) : _random = random;

  static const _maxExponent = 20;
  static final Random _sharedRandom = Random();

  final Duration baseDelay;
  final Duration maxDelay;

  /// Espera tras un fallo de canal (sin red / token) que no consume reintento:
  /// aparta la tarea para que no bloquee la cola detrás de ella.
  final Duration channelCooldown;
  final Random? _random;

  /// [attempt] es el número de intentos fallidos ya consumidos (>= 1).
  /// Un `Retry-After` del servidor tiene prioridad sobre el cálculo local.
  Duration delayFor(int attempt, {Duration? retryAfter}) {
    if (retryAfter != null) {
      return retryAfter > maxDelay ? maxDelay : retryAfter;
    }

    final exponent = (attempt - 1).clamp(0, _maxExponent);
    final ceilingMs = min(
      baseDelay.inMilliseconds * pow(2, exponent),
      maxDelay.inMilliseconds,
    ).toInt();
    final halfMs = ceilingMs ~/ 2;

    return Duration(
      milliseconds: halfMs + (_random ?? _sharedRandom).nextInt(halfMs + 1),
    );
  }
}
