import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_preventa/core/sync/engine/dispatch_classifier.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/retry_policy.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/engine/sync_task_store.dart';
import 'package:app_preventa/core/sync/engine/task_transition.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

Response<dynamic> _response(
  int statusCode, {
  Object? data,
  Map<String, List<String>> headers = const {},
}) =>
    Response<dynamic>(
      requestOptions: RequestOptions(path: '/api/3/pedidoscliente'),
      statusCode: statusCode,
      data: data,
      headers: Headers.fromMap(headers),
    );

DioException _dioError(DioExceptionType type, {Response<dynamic>? response}) =>
    DioException(
      requestOptions: RequestOptions(path: '/api/3/pedidoscliente'),
      type: type,
      response: response,
    );

SyncTask _task({
  int retries = 0,
  int maxRetries = 3,
  bool deliveryUncertain = false,
  String endpoint = '/api/3/pedidoscliente',
  Map<String, dynamic> payload = const {'codcliente': 'CLI001'},
}) =>
    SyncTask(
      id: 'TASK-1',
      endpoint: endpoint,
      method: HttpMethod.post,
      payload: payload,
      retries: retries,
      maxRetries: maxRetries,
      deliveryUncertain: deliveryUncertain,
      createdAt: DateTime(2026, 10, 14),
    );

void main() {
  final now = DateTime(2026, 10, 14, 12);
  final policy = RetryPolicy(random: Random(42));

  group('RetryPolicy (Exponential Backoff con jitter)', () {
    test('el retardo crece exponencialmente dentro de [techo/2, techo]', () {
      for (final (attempt, ceilingSeconds) in [(1, 10), (2, 20), (3, 40)]) {
        final delay = policy.delayFor(attempt);
        expect(
            delay.inMilliseconds, greaterThanOrEqualTo(ceilingSeconds * 500));
        expect(delay.inMilliseconds, lessThanOrEqualTo(ceilingSeconds * 1000));
      }
    });

    test('nunca supera maxDelay aunque el número de intentos sea enorme', () {
      expect(
        policy.delayFor(500),
        lessThanOrEqualTo(const Duration(minutes: 30)),
      );
    });

    test('respeta Retry-After del servidor, acotado a maxDelay', () {
      expect(
        policy.delayFor(1, retryAfter: const Duration(seconds: 7)),
        const Duration(seconds: 7),
      );
      expect(
        policy.delayFor(1, retryAfter: const Duration(hours: 5)),
        const Duration(minutes: 30),
      );
    });
  });

  group('classifyHttpResponse', () {
    test('regresión: en pedidos el erpId es `codigo`, no `codcliente`', () {
      final outcome = classifyHttpResponse(
        _response(201, data: {'codcliente': 'CLI001', 'codigo': 'PED2026A1'}),
        resource: ErpResource.pedidos,
      );
      expect(
        outcome,
        isA<DispatchDelivered>()
            .having((o) => o.erpId, 'erpId', 'PED2026A1')
            .having((o) => o.record['codigo'], 'record.codigo', 'PED2026A1'),
      );
    });

    test('alta de cliente sin codcliente en la respuesta es conflicto', () {
      expect(
        classifyHttpResponse(
          _response(201, data: {'nombre': 'Bar Nuevo'}),
          resource: ErpResource.clientes,
        ),
        isA<DispatchConflict>(),
      );
    });

    test('extrae el id dentro del sobre {"data": {...}}', () {
      expect(
        extractErpId({
          'data': {'codcliente': 'C42'},
        }, ErpResource.clientes),
        'C42',
      );
    });

    test('401/403 es token inválido, no un rechazo fatal del pedido', () {
      expect(classifyHttpResponse(_response(401)), isA<DispatchUnauthorized>());
      expect(classifyHttpResponse(_response(403)), isA<DispatchUnauthorized>());
    });

    test('429 es transitorio, no ambiguo y honra Retry-After', () {
      final outcome = classifyHttpResponse(
        _response(429, headers: {
          'retry-after': ['30'],
        }),
      );
      expect(
        outcome,
        isA<DispatchTransient>()
            .having((o) => o.ambiguous, 'ambiguous', isFalse)
            .having(
              (o) => o.retryAfter,
              'retryAfter',
              const Duration(seconds: 30),
            ),
      );
    });

    test('422 y 400 por stock son conflicto; otros 4xx son rechazo', () {
      expect(classifyHttpResponse(_response(422)), isA<DispatchConflict>());
      expect(
        classifyHttpResponse(
          _response(400, data: {'message': 'Sin STOCK suficiente para REF-01'}),
        ),
        isA<DispatchConflict>(),
      );
      expect(
        classifyHttpResponse(_response(400, data: {'message': 'CIF inválido'})),
        isA<DispatchRejected>(),
      );
    });

    test('5xx es transitorio y AMBIGUO (el ERP pudo persistirlo)', () {
      expect(
        classifyHttpResponse(_response(503)),
        isA<DispatchTransient>().having((o) => o.ambiguous, 'ambiguous', true),
      );
    });

    test('trunca mensajes HTML enormes antes de persistirlos', () {
      expect(erpMessageOf('x' * 5000).length, lessThanOrEqualTo(301));
    });
  });

  group('classifyDioException', () {
    test('connectionTimeout: inalcanzable y entrega NO realizada', () {
      expect(
        classifyDioException(_dioError(DioExceptionType.connectionTimeout)),
        isA<DispatchUnreachable>()
            .having((o) => o.ambiguous, 'ambiguous', isFalse),
      );
    });

    test('connectionError: inalcanzable pero ambiguo', () {
      expect(
        classifyDioException(_dioError(DioExceptionType.connectionError)),
        isA<DispatchUnreachable>()
            .having((o) => o.ambiguous, 'ambiguous', true),
      );
    });

    test('receiveTimeout: transitorio ambiguo (el clásico pedido duplicado)',
        () {
      expect(
        classifyDioException(_dioError(DioExceptionType.receiveTimeout)),
        isA<DispatchTransient>().having((o) => o.ambiguous, 'ambiguous', true),
      );
    });

    test('badResponse delega en la clasificación HTTP', () {
      expect(
        classifyDioException(
          _dioError(DioExceptionType.badResponse, response: _response(409)),
        ),
        isA<DispatchConflict>(),
      );
    });
  });

  group('resolveTransition (máquina de estados de la cola)', () {
    TaskTransition resolve(SyncTask task, DispatchOutcome outcome) =>
        resolveTransition(
          task: task,
          outcome: outcome,
          now: now,
          policy: policy,
        );

    test('un envío correcto NO incrementa retries y limpia la incertidumbre',
        () {
      final t = resolve(
        _task(retries: 1, deliveryUncertain: true),
        const DispatchOutcome.delivered(erpId: 'PED1'),
      );
      expect(t.status, SyncStatus.completed);
      expect(t.retries, 1);
      expect(t.deliveryUncertain, isFalse);
      expect(t.erpId, 'PED1');
    });

    test('transitorio: consume intento y programa backoff en el futuro', () {
      final t = resolve(
        _task(),
        const DispatchOutcome.transient(message: '503', ambiguous: true),
      );
      expect(t.status, SyncStatus.pending);
      expect(t.retries, 1);
      expect(t.nextAttemptAt?.isAfter(now), isTrue);
      expect(t.deliveryUncertain, isTrue);
    });

    test('transitorio con intentos agotados pasa a failed sin reprogramar', () {
      final t = resolve(
        _task(retries: 2, maxRetries: 3),
        const DispatchOutcome.transient(message: '503', ambiguous: false),
      );
      expect(t.status, SyncStatus.failed);
      expect(t.retries, 3);
      expect(t.nextAttemptAt, isNull);
    });

    test('sin red o sin token NO consume reintentos', () {
      for (final outcome in const [
        DispatchOutcome.unreachable(message: 'offline'),
        DispatchOutcome.unauthorized(message: '401'),
      ]) {
        final t = resolve(_task(retries: 2), outcome);
        expect(t.status, SyncStatus.pending);
        expect(t.retries, 2);
      }
    });

    test('fallo de canal puro aparta la tarea un cooldown (no bloquea la cola)',
        () {
      final t = resolve(
        _task(),
        const DispatchOutcome.unauthorized(message: '403'),
      );
      expect(t.nextAttemptAt, now.add(policy.channelCooldown));
    });

    test('corte AMBIGUO consume intento: una tarea venenosa acaba en failed',
        () {
      final t = resolve(
        _task(retries: 2, maxRetries: 3),
        const DispatchOutcome.unreachable(message: 'reset', ambiguous: true),
      );
      expect(t.status, SyncStatus.failed);
      expect(t.deliveryUncertain, isTrue);
    });

    test('la incertidumbre previa no se pierde por un fallo de red claro', () {
      final t = resolve(
        _task(deliveryUncertain: true),
        const DispatchOutcome.unreachable(message: 'offline'),
      );
      expect(t.deliveryUncertain, isTrue);
    });

    test('conflicto y rechazo son estados terminales distintos', () {
      expect(
        resolve(_task(), const DispatchOutcome.conflict(message: 'stock'))
            .status,
        SyncStatus.conflict,
      );
      expect(
        resolve(_task(), const DispatchOutcome.rejected(message: '400')).status,
        SyncStatus.fatalError,
      );
    });
  });

  group('UpstreamRunStats', () {
    test('acumula de forma inmutable cada tipo de resultado', () {
      const initial = UpstreamRunStats();
      final stats = initial
          .record(const TaskStep.attempted(DispatchOutcome.delivered()))
          .record(const TaskStep.deferred(reason: 'TEMP-CLI-1'))
          .record(
            const TaskStep.attempted(
              DispatchOutcome.transient(message: '503', ambiguous: true),
            ),
          )
          .record(
            const TaskStep.attempted(DispatchOutcome.conflict(message: 'x')),
          )
          .record(const TaskStep.skipped());

      expect(initial, const UpstreamRunStats());
      expect(
        stats,
        const UpstreamRunStats(
          delivered: 1,
          deferred: 1,
          rescheduled: 1,
          conflicts: 1,
        ),
      );
    });
  });

  group('Dependencias de clientes creados offline', () {
    test('un pedido de un cliente temporal queda bloqueado', () {
      expect(
        unresolvedClientDependency(
          _task(payload: {'codcliente': '${tempClientCodePrefix}100'}),
        ),
        '${tempClientCodePrefix}100',
      );
    });

    test('ni el alta del propio cliente ni un cliente real se bloquean', () {
      expect(
        unresolvedClientDependency(
          _task(
            endpoint: ErpResource.clientes.createPath,
            payload: {'codcliente': '${tempClientCodePrefix}100'},
          ),
        ),
        isNull,
      );
      expect(unresolvedClientDependency(_task()), isNull);
    });

    test('replaceClientCode reescribe el payload encolado sin mutarlo', () {
      final original = jsonEncode({'codcliente': 'TEMP-CLI-1', 'total': 10});
      final rewritten =
          replaceClientCode(original, from: 'TEMP-CLI-1', to: 'C0099');

      expect(jsonDecode(rewritten), {'codcliente': 'C0099', 'total': 10});
      expect(jsonDecode(original), {'codcliente': 'TEMP-CLI-1', 'total': 10});
    });

    test('replaceClientCode deja intactos payloads ajenos o corruptos', () {
      expect(
        replaceClientCode('{"codcliente":"C1"}', from: 'TEMP-CLI-1', to: 'X'),
        '{"codcliente":"C1"}',
      );
      expect(replaceClientCode('{roto', from: 'a', to: 'b'), '{roto');
      expect(tryDecodePayload('[1,2]'), isNull);
    });
  });

  group('Rebase de stock de autoventa', () {
    test('suma las unidades de albaranes pendientes por referencia', () {
      OrderLineEmbedded line(String ref, int qty) => OrderLineEmbedded()
        ..referencia = ref
        ..cantidad = qty;

      final orders = [
        OrderEntity()..lineas = [line('REF-01', 2), line('REF-02', 1)],
        OrderEntity()..lineas = [line('REF-01', 3)],
      ];

      expect(
        reservedQuantitiesByReference(orders),
        {'REF-01': 5, 'REF-02': 1},
      );
    });
  });
}
