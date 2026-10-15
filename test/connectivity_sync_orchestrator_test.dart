import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_preventa/core/sync/engine/connectivity_sync_orchestrator.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// Motor falso: cuenta pasadas y devuelve el resultado configurado.
final class FakeSyncEngine implements SyncEngine {
  int runs = 0;
  bool rejected = false;
  UpstreamRunResult Function() nextResult =
      () => const UpstreamRunResult.completed(stats: UpstreamRunStats());

  @override
  Future<UpstreamRunResult> processUpstreamQueue() async {
    runs++;
    return nextResult();
  }

  @override
  bool get credentialsRejected => rejected;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Conectividad controlable desde el test.
final class ControllableConnectivity implements Connectivity {
  ControllableConnectivity({bool online = true})
      : current = online ? _wifi : _none;

  static const _wifi = [ConnectivityResult.wifi];
  static const _none = [ConnectivityResult.none];

  List<ConnectivityResult> current;
  final _changes = StreamController<List<ConnectivityResult>>.broadcast();

  void setOnline(bool online) {
    current = online ? _wifi : _none;
    _changes.add(current);
  }

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async => current;

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged => _changes.stream;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const debounce = Duration(seconds: 3);
  const cooldown = Duration(minutes: 1);

  late FakeSyncEngine engine;
  late ControllableConnectivity connectivity;
  late ConnectivitySyncOrchestrator orchestrator;

  void setUpOrchestrator({bool online = true}) {
    engine = FakeSyncEngine();
    connectivity = ControllableConnectivity(online: online);
    orchestrator = ConnectivitySyncOrchestrator(
      syncEngine: engine,
      connectivity: connectivity,
      debounce: debounce,
      haltCooldown: cooldown,
    );
  }

  void start(FakeAsync async) {
    unawaited(orchestrator.startListening());
    async.flushMicrotasks();
  }

  test('con red al arrancar sincroniza inmediatamente una vez', () {
    fakeAsync((async) {
      setUpOrchestrator();
      start(async);
      async.elapse(Duration.zero);

      expect(engine.runs, 1);
      expect(orchestrator.isOnline, isTrue);
    });
  });

  test('startListening es idempotente (sin suscripciones duplicadas)', () {
    fakeAsync((async) {
      setUpOrchestrator(online: false);
      unawaited(orchestrator.startListening());
      unawaited(orchestrator.startListening());
      async.flushMicrotasks();

      connectivity.setOnline(true);
      async.elapse(debounce);

      expect(engine.runs, 1);
    });
  });

  test('debounce: micro-cortes de red producen UNA sola pasada', () {
    fakeAsync((async) {
      setUpOrchestrator(online: false);
      start(async);

      for (var i = 0; i < 4; i++) {
        connectivity.setOnline(true);
        async.elapse(const Duration(milliseconds: 500));
        connectivity.setOnline(false);
        async.elapse(const Duration(milliseconds: 500));
      }
      connectivity.setOnline(true);
      async.elapse(debounce - const Duration(milliseconds: 1));
      expect(engine.runs, 0, reason: 'aún dentro del debounce');

      async.elapse(const Duration(milliseconds: 1));
      expect(engine.runs, 1);
    });
  });

  test('perder la red cancela la sincronización pendiente', () {
    fakeAsync((async) {
      setUpOrchestrator(online: false);
      start(async);

      connectivity.setOnline(true);
      async.elapse(const Duration(seconds: 1));
      connectivity.setOnline(false);
      async.elapse(const Duration(minutes: 5));

      expect(engine.runs, 0);
      expect(orchestrator.isOnline, isFalse);
    });
  });

  test('programa el reintento según el backoff de la cola', () {
    fakeAsync((async) {
      setUpOrchestrator();
      var first = true;
      engine.nextResult = () {
        if (!first) {
          return const UpstreamRunResult.completed(stats: UpstreamRunStats());
        }
        first = false;
        return UpstreamRunResult.completed(
          stats: const UpstreamRunStats(),
          nextDueAt: DateTime.now().add(const Duration(seconds: 30)),
        );
      };
      start(async);
      async.elapse(Duration.zero);
      expect(engine.runs, 1);

      async.elapse(const Duration(seconds: 20));
      expect(engine.runs, 1, reason: 'antes del vencimiento no reintenta');

      async.elapse(const Duration(seconds: 15));
      expect(engine.runs, 2);
    });
  });

  test('tras cortar por fallo de red reintenta pasado el cooldown', () {
    fakeAsync((async) {
      setUpOrchestrator();
      engine.nextResult = () => const UpstreamRunResult.halted(
            reason: UpstreamHaltReason.network,
            message: 'ERP inalcanzable',
            stats: UpstreamRunStats(),
          );
      start(async);
      async.elapse(Duration.zero);
      expect(engine.runs, 1);

      async.elapse(cooldown - const Duration(seconds: 1));
      expect(engine.runs, 1);

      async.elapse(const Duration(seconds: 2));
      expect(engine.runs, 2);
    });
  });

  test('con credenciales rechazadas no hay tráfico hasta cambiarlas', () {
    fakeAsync((async) {
      setUpOrchestrator(online: false);
      start(async);
      engine.rejected = true;

      connectivity.setOnline(true);
      async.elapse(debounce);
      orchestrator.requestSync();
      orchestrator.didChangeAppLifecycleState(AppLifecycleState.resumed);
      async.elapse(const Duration(minutes: 10));
      expect(engine.runs, 0, reason: 'evita el baneo de IP del ERP');
      expect(orchestrator.credentialsRejected, isTrue);

      // El usuario guarda credenciales nuevas: el motor las desbloquea.
      engine.rejected = false;
      orchestrator.onCredentialsUpdated();
      async.elapse(debounce);
      expect(engine.runs, 1);
    });
  });

  test('un rechazo de credenciales no programa reintentos', () {
    fakeAsync((async) {
      setUpOrchestrator();
      engine.nextResult = () => const UpstreamRunResult.halted(
            reason: UpstreamHaltReason.unauthorized,
            message: '401',
            stats: UpstreamRunStats(),
          );
      start(async);
      async.elapse(const Duration(hours: 1));

      expect(engine.runs, 1);
    });
  });

  test('volver a primer plano relanza la cola (con debounce)', () {
    fakeAsync((async) {
      setUpOrchestrator();
      start(async);
      async.elapse(Duration.zero);
      expect(engine.runs, 1);

      orchestrator.didChangeAppLifecycleState(AppLifecycleState.resumed);
      async.elapse(debounce);

      expect(engine.runs, 2);
    });
  });

  test('dispose cancela los temporizadores pendientes', () {
    fakeAsync((async) {
      setUpOrchestrator(online: false);
      start(async);
      connectivity.setOnline(true);

      unawaited(orchestrator.dispose());
      async.flushMicrotasks();
      async.elapse(const Duration(minutes: 5));

      expect(engine.runs, 0);
    });
  });
}
