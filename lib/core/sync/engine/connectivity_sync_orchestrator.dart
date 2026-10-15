import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

import 'package:app_preventa/core/network/connectivity_extensions.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// [ECC: Inyección de Dependencias]
/// Orquestador reactivo que monitoriza la red y dispara sincronizaciones automáticas al recuperar cobertura.
class ConnectivitySyncOrchestrator with WidgetsBindingObserver {
  ConnectivitySyncOrchestrator({
    required SyncEngine syncEngine,
    required Connectivity connectivity,
    Duration debounce = const Duration(seconds: 3),
    Duration haltCooldown = const Duration(minutes: 1),
  })  : _syncEngine = syncEngine,
        _connectivity = connectivity,
        _debounce = debounce,
        _haltCooldown = haltCooldown;

  final SyncEngine _syncEngine;
  final Connectivity _connectivity;
  final Duration _debounce;
  final Duration _haltCooldown;

  final StreamController<bool> _connectivityStateController =
      StreamController<bool>.broadcast();

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _debounceTimer;
  Timer? _retryTimer;
  bool _isOnline = false;
  bool _started = false;
  bool _disposed = false;

  /// `true` si el ERP rechazó el token: la UI debe pedir revisar Ajustes.
  /// La fuente de verdad es el motor (también protege las llamadas directas).
  bool get credentialsRejected => _syncEngine.credentialsRejected;

  bool get isOnline => _isOnline;

  Stream<bool> get onConnectivityChange => _connectivityStateController.stream;

  /// Inicia la escucha reactiva de cambios de interfaz de red.
  Future<void> startListening() async {
    // FIX: Idempotente. Una segunda llamada sobrescribía `_subscription` sin
    // cancelarla (fuga de suscripción + disparos duplicados).
    // El flag se fija ANTES del primer await para cerrar la carrera entre dos
    // llamadas concurrentes.
    if (_started || _disposed) return;
    _started = true;

    _setOnline((await _connectivity.checkConnectivity()).hasNetwork);

    _subscription = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
      // FIX: Antes no había onError: un fallo del plugin quedaba sin tratar.
      onError: (Object error, StackTrace stackTrace) => developer.log(
        'Error en el stream de conectividad',
        name: 'SyncOrchestrator',
        error: error,
        stackTrace: stackTrace,
      ),
    );

    // FEAT: Al volver del background la cola puede tener backoffs vencidos.
    WidgetsBinding.instance.addObserver(this);

    if (_isOnline) _scheduleSync(Duration.zero);
  }

  /// Solicita una pasada (resume de la app, guardado de un documento...).
  void requestSync() {
    // FIX (Baneo de IP): FacturaScripts bloquea la IP tras 5 intentos con
    // token inválido en 10 min. Con credenciales rechazadas no se reintenta.
    if (_isOnline && !credentialsRejected) _scheduleSync(_debounce);
  }

  /// Tras guardar credenciales nuevas: su huella difiere de la rechazada, así
  /// que el motor ya no las bloquea; basta con relanzar la cola.
  void onCredentialsUpdated() => requestSync();

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final online = results.hasNetwork;
    if (online == _isOnline) return;
    _setOnline(online);

    // FEAT: Debounce. En micro-cortes (túneles, cambio 4G↔WiFi) la red oscila
    // varias veces por segundo; solo se sincroniza si se estabiliza.
    if (online) {
      _scheduleSync(_debounce);
    } else {
      _cancelTimers();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) requestSync();
  }

  void _setOnline(bool online) {
    _isOnline = online;
    if (!_connectivityStateController.isClosed) {
      _connectivityStateController.add(online);
    }
  }

  void _scheduleSync(Duration delay) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, () => unawaited(_runSync()));
  }

  Future<void> _runSync() async {
    // Cubre también los disparos por red recuperada y por timer de backoff.
    if (credentialsRejected) return;

    // processUpstreamQueue nunca lanza: devuelve un resultado tipado.
    final result = await _syncEngine.processUpstreamQueue();
    // Si la red cayó durante la pasada, el listener ya canceló los timers.
    if (_disposed || !_isOnline) return;

    // [ECC: Pattern Matching] El resultado decide cuándo volver a intentarlo.
    final retryIn = switch (result) {
      UpstreamOffline() => null, // El listener de red reactivará la cola.
      UpstreamCompleted(:final nextDueAt) => _delayUntil(nextDueAt),
      // Requiere acción del usuario (Ajustes → token): no martillear el ERP.
      UpstreamHalted(reason: UpstreamHaltReason.unauthorized) => null,
      // connectivity_plus informa "wifi" aunque no haya Internet (portal cautivo).
      UpstreamHalted(
        reason: UpstreamHaltReason.network || UpstreamHaltReason.internalError
      ) =>
        _haltCooldown,
    };

    _retryTimer?.cancel();
    _retryTimer = switch (retryIn) {
      final delay? => Timer(delay, () => _scheduleSync(Duration.zero)),
      null => null,
    };
  }

  /// Retardo hasta [dueAt] con un suelo que impide bucles de re-ejecución
  /// inmediata (p. ej. `Retry-After: 0` repetido).
  Duration? _delayUntil(DateTime? dueAt) => switch (dueAt) {
        final at? =>
          _maxDuration(at.difference(DateTime.now()), _minRetryDelay),
        null => null,
      };

  static const _minRetryDelay = Duration(seconds: 2);

  static Duration _maxDuration(Duration a, Duration b) => a > b ? a : b;

  void _cancelTimers() {
    _debounceTimer?.cancel();
    _retryTimer?.cancel();
    _debounceTimer = null;
    _retryTimer = null;
  }

  /// FIX: Antes no se cancelaban timers ni se esperaba el `cancel()` de la
  /// suscripción, y el controller podía recibir eventos ya cerrado.
  Future<void> dispose() async {
    _disposed = true;
    _cancelTimers();
    WidgetsBinding.instance.removeObserver(this);
    await _subscription?.cancel();
    _subscription = null;
    await _connectivityStateController.close();
  }
}
