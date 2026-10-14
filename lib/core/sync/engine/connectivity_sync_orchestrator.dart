import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:app_preventa/core/sync/engine/sync_engine.dart';

/// [ECC: Inyección de Dependencias]
/// Orquestador reactivo que monitoriza la red y dispara sincronizaciones automáticas al recuperar cobertura.
class ConnectivitySyncOrchestrator {
  final SyncEngine _syncEngine;
  final Connectivity _connectivity;

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  bool _isOnline = false;

  final StreamController<bool> _connectivityStateController =
      StreamController<bool>.broadcast();

  ConnectivitySyncOrchestrator({
    required SyncEngine syncEngine,
    required Connectivity connectivity,
  })  : _syncEngine = syncEngine,
        _connectivity = connectivity;

  bool get isOnline => _isOnline;

  Stream<bool> get onConnectivityChange => _connectivityStateController.stream;

  /// Inicia la escucha reactiva de cambios de interfaz de red
  Future<void> startListening() async {
    // 1. Estado inicial
    final initialResults = await _connectivity.checkConnectivity();
    _isOnline = !initialResults.contains(ConnectivityResult.none);
    _connectivityStateController.add(_isOnline);

    if (_isOnline) {
      // Disparo inicial oportunista
      _syncEngine.processUpstreamQueue();
    }

    // 2. Suscripción a transiciones de conectividad
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) async {
        final currentlyOnline = !results.contains(ConnectivityResult.none);

        if (currentlyOnline != _isOnline) {
          _isOnline = currentlyOnline;
          _connectivityStateController.add(_isOnline);

          // Si recuperamos conexión, procesar inmediatamente la cola ascendente pendiente
          if (_isOnline) {
            await _syncEngine.processUpstreamQueue();
          }
        }
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
    _connectivityStateController.close();
  }
}
