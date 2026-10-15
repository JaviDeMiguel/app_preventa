import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/retry_policy.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/catalog_sync_state.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

import 'support/isar_test_support.dart';

// ───────────────────────── Dobles de prueba ─────────────────────────

typedef ErpHandler = FutureOr<ResponseBody> Function(RecordedRequest request);

final class RecordedRequest {
  RecordedRequest(this.options, this.body);

  final RequestOptions options;
  final String body;

  String get method => options.method;
  String get path => options.path;
  Map<String, String> get form =>
      body.isEmpty ? const {} : Uri.splitQueryString(body);
}

/// ERP FacturaScripts simulado a nivel de transporte (sin red real).
final class FakeErpAdapter implements HttpClientAdapter {
  FakeErpAdapter(this.handler);

  ErpHandler handler;
  final requests = <RecordedRequest>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final bytes = requestStream == null
        ? const <int>[]
        : await requestStream.expand((chunk) => chunk).toList();
    final request = RecordedRequest(options, utf8.decode(bytes));
    requests.add(request);
    return handler(request);
  }

  Iterable<RecordedRequest> get writes =>
      requests.where((r) => r.method == 'POST' || r.method == 'PUT');

  @override
  void close({bool force = false}) {}
}

final class FakeConnectivity implements Connectivity {
  List<ConnectivityResult> results = const [ConnectivityResult.wifi];

  @override
  Future<List<ConnectivityResult>> checkConnectivity() async => results;

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      const Stream.empty();
}

ResponseBody jsonResponse(Object? body, {int status = 200}) =>
    ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

Never failWith(RecordedRequest request, DioExceptionType type) =>
    throw DioException(requestOptions: request.options, type: type);

// ───────────────────────── Fixtures ─────────────────────────

const _configured = FacturaScriptsConfig(
  baseUrl: 'https://erp.test',
  apiToken: 'k',
  warehouseCode: 'FURGO1',
);

SyncTaskCollection _task(
  ErpResource resource,
  Map<String, Object?> payload, {
  required String uuid,
  required DateTime createdAt,
  SyncStatus status = SyncStatus.pending,
}) =>
    SyncTaskCollection()
      ..uuid = uuid
      ..endpoint = resource.createPath
      ..method = HttpMethod.post
      ..payloadJson = jsonEncode(payload)
      ..retries = 0
      ..maxRetries = defaultTaskMaxRetries
      ..status = status
      ..createdAt = createdAt;

Map<String, Object?> _orderPayload(String localId,
        {String codcliente = 'C1'}) =>
    buildSalesDocumentPayload(
      codcliente: codcliente,
      localDocumentId: localId,
      issuedAt: DateTime(2026, 10, 15, 10),
      lines: const [
        (
          referencia: 'REF-01',
          descripcion: 'Cerveza',
          cantidad: 2,
          pvpunitario: 1.5,
          dtopor: 0,
        ),
      ],
    );

OrderEntity _order(String localId, String taskUuid,
        {String codcliente = 'C1'}) =>
    OrderEntity()
      ..localId = localId
      ..codcliente = codcliente
      ..nombreCliente = 'Bar'
      ..fecha = DateTime(2026, 10, 15)
      ..totalNeto = 3
      ..totalIva = 0.63
      ..totalFinal = 3.63
      ..syncStatus = SyncStatus.pending
      ..documentType = DocumentType.pedido
      ..paymentMethod = PaymentMethod.pendiente
      ..syncTaskId = taskUuid;

void main() {
  late Directory tempDir;
  late Isar isar;
  late FakeErpAdapter erp;
  late FakeConnectivity connectivity;
  late SyncEngine engine;
  late DateTime now;
  late FacturaScriptsConfig config;

  setUpAll(initIsarCoreForTests);

  setUp(() async {
    (isar, tempDir) = await openTestIsar();
    now = DateTime(2026, 10, 15, 12);
    config = _configured;
    erp = FakeErpAdapter((r) => jsonResponse({'doc': <String, Object?>{}}));
    connectivity = FakeConnectivity();
    final dio = FacturaScriptsApiClient.create(
      const FacturaScriptsConfig(baseUrl: 'https://erp.test', apiToken: 'k'),
    )..httpClientAdapter = erp;
    engine = SyncEngine(
      isar: isar,
      dio: dio,
      connectivity: connectivity,
      retryPolicy: RetryPolicy(random: Random(1)),
      clock: () => now,
      config: () => config,
    );
  });

  tearDown(() async {
    await engine.dispose();
    await closeTestIsar(isar, tempDir);
  });

  Future<void> seed(List<SyncTaskCollection> tasks,
      [List<OrderEntity> orders = const []]) {
    return isar.writeTxn(() async {
      await isar.syncTaskCollections.putAll(tasks);
      await isar.orderEntitys.putAll(orders);
    });
  }

  Future<SyncTaskCollection> taskByUuid(String uuid) async =>
      (await isar.syncTaskCollections.filter().uuidEqualTo(uuid).findFirst())!;

  group('ERP sin configurar', () {
    test('no hace NINGUNA petición (evita el baneo de IP)', () async {
      config = const FacturaScriptsConfig(baseUrl: '', apiToken: '');
      await seed([
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now),
      ]);

      final upstream = await engine.processUpstreamQueue();
      await engine.pullDownstreamCatalog();

      expect(
        upstream,
        isA<UpstreamHalted>().having(
          (r) => r.reason,
          'reason',
          UpstreamHaltReason.unauthorized,
        ),
      );
      expect(engine.currentCatalogState, isA<CatalogSyncFailure>());
      expect(erp.requests, isEmpty);
      expect((await taskByUuid('T1')).status, SyncStatus.pending);
    });
  });

  group('Protección frente al baneo de IP (revisión de seguridad)', () {
    test('el catálogo vuelve a sincronizar tras configurar el ERP', () async {
      config = const FacturaScriptsConfig(baseUrl: '', apiToken: '');
      await engine.pullDownstreamCatalog();
      expect(erp.requests, isEmpty);

      config = _configured;
      erp.handler = (r) => jsonResponse(<Object?>[]);
      await engine.pullDownstreamCatalog();

      // Regresión: antes quedaba cacheado un future completado y no se
      // volvía a enviar ninguna petición hasta reiniciar la app.
      expect(erp.requests, isNotEmpty);
      expect(engine.currentCatalogState, isA<CatalogSyncSuccess>());
    });

    test('un 401 corta tras UNA petición y bloquea todas las rutas', () async {
      erp.handler =
          (r) => jsonResponse({'error': 'auth-token-invalid'}, status: 401);
      await seed([
        for (var i = 0; i < 3; i++)
          _task(ErpResource.pedidos, _orderPayload('ORD-$i'),
              uuid: 'T$i', createdAt: now.add(Duration(seconds: i))),
      ]);

      final first = await engine.processUpstreamQueue();
      expect(first, isA<UpstreamHalted>());
      expect(erp.requests, hasLength(1));
      expect(engine.credentialsRejected, isTrue);

      // Llamadas directas desde la UI (sin pasar por el orquestador).
      await engine.processUpstreamQueue();
      await engine.pullDownstreamCatalog();
      expect(erp.requests, hasLength(1));

      // Credenciales nuevas → huella distinta → se desbloquea.
      config = config.copyWith(apiToken: 'nuevo');
      erp.handler = (r) => jsonResponse({
            'doc': {'codigo': 'OK'},
          });
      now = now.add(const Duration(hours: 1));
      await engine.processUpstreamQueue();
      expect(engine.credentialsRejected, isFalse);
      expect((await taskByUuid('T2')).status, SyncStatus.completed);
    });

    test('el catálogo con token malo genera una sola incidencia', () async {
      erp.handler =
          (r) => jsonResponse({'error': 'auth-token-invalid'}, status: 401);

      await engine.pullDownstreamCatalog();

      expect(erp.requests, hasLength(1));
      expect(erp.requests.single.path, '/api/3/impuestos');
      expect(engine.credentialsRejected, isTrue);
    });

    test('una redirección (3xx) no se sigue y detiene la cola', () async {
      erp.handler = (r) => ResponseBody.fromString(
            '',
            302,
            headers: {
              'location': ['http://erp.test/api/3/crearPedidoCliente'],
            },
          );
      await seed([
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now),
      ]);

      final result = await engine.processUpstreamQueue();

      expect(
        result,
        isA<UpstreamHalted>().having(
          (r) => r.message,
          'message',
          contains('redirección'),
        ),
      );
      expect(erp.requests, hasLength(1));
      expect((await taskByUuid('T1')).retries, 0);
    });
  });

  group('Entrega ascendente', () {
    test('envía form-urlencoded con token y marca pedido completado', () async {
      erp.handler = (r) => jsonResponse({
            'doc': {'codigo': 'PED2026A1', 'codcliente': 'C1'},
            'lines': <Object?>[],
          });
      await seed(
        [
          _task(ErpResource.pedidos, _orderPayload('ORD-1'),
              uuid: 'T1', createdAt: now),
        ],
        [_order('ORD-1', 'T1')],
      );

      final result = await engine.processUpstreamQueue();

      expect(result, isA<UpstreamCompleted>());
      final request = erp.writes.single;
      expect(request.path, '/api/3/crearPedidoCliente');
      expect(request.options.headers['X-Auth-Token'], 'k');
      expect(request.options.contentType, Headers.formUrlEncodedContentType);
      expect(request.form['numero2'], 'ORD-1');
      expect(jsonDecode(request.form['lineas']!), isA<List<dynamic>>());

      final order =
          await isar.orderEntitys.filter().localIdEqualTo('ORD-1').findFirst();
      expect(order?.syncStatus, SyncStatus.completed);
      expect(order?.erpId, 'PED2026A1');
      expect((await taskByUuid('T1')).retries, 0);
    });

    test('dos disparos concurrentes NO duplican el pedido', () async {
      final gate = Completer<void>();
      erp.handler = (r) async {
        await gate.future;
        return jsonResponse({
          'doc': {'codigo': 'PED1'},
        });
      };
      await seed([
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now),
      ]);

      final first = engine.processUpstreamQueue();
      final second = engine.processUpstreamQueue();
      await Future<void>.delayed(const Duration(milliseconds: 50));
      gate.complete();
      await Future.wait([first, second]);

      expect(erp.writes, hasLength(1));
    });

    test('crash a mitad de envío: verifica en el ERP y NO reenvía', () async {
      erp.handler = (r) => switch (r.method) {
            'GET' => jsonResponse([
                {'numero2': 'ORD-1', 'codigo': 'PED9'},
              ]),
            _ => fail('No debe reenviar un pedido ya entregado'),
          };
      // Estado que deja un kill del proceso tras el claim.
      await seed(
        [
          _task(ErpResource.pedidos, _orderPayload('ORD-1'),
              uuid: 'T1', createdAt: now, status: SyncStatus.inProgress),
        ],
        [_order('ORD-1', 'T1')],
      );

      await engine.processUpstreamQueue();

      final probe = erp.requests.single;
      expect(probe.path, '/api/3/pedidoclientes');
      expect(probe.options.queryParameters['filter[numero2]'], 'ORD-1');
      expect((await taskByUuid('T1')).status, SyncStatus.completed);
      final order =
          await isar.orderEntitys.filter().localIdEqualTo('ORD-1').findFirst();
      expect(order?.erpId, 'PED9');
    });

    test('crash a mitad de envío sin rastro en el ERP: reenvía una vez',
        () async {
      erp.handler = (r) => switch (r.method) {
            'GET' => jsonResponse(<Object?>[]),
            _ => jsonResponse({
                'doc': {'codigo': 'PED1'},
              }),
          };
      await seed([
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now, status: SyncStatus.inProgress),
      ]);

      await engine.processUpstreamQueue();

      expect(erp.writes, hasLength(1));
      expect((await taskByUuid('T1')).status, SyncStatus.completed);
    });

    test('receiveTimeout: queda dudosa con backoff y luego se verifica',
        () async {
      erp.handler = (r) => failWith(r, DioExceptionType.receiveTimeout);
      await seed([
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now),
      ]);

      await engine.processUpstreamQueue();

      final afterTimeout = await taskByUuid('T1');
      expect(afterTimeout.status, SyncStatus.pending);
      expect(afterTimeout.deliveryUncertain, isTrue);
      expect(afterTimeout.retries, 1);
      expect(afterTimeout.nextAttemptAt!.isAfter(now), isTrue);

      // Antes del vencimiento no se reintenta.
      await engine.processUpstreamQueue();
      expect(erp.requests, hasLength(1));

      // Vencido: primero verifica (el ERP sí lo guardó) y no reenvía.
      now = now.add(const Duration(hours: 1));
      erp.handler = (r) => switch (r.method) {
            'GET' => jsonResponse([
                {'numero2': 'ORD-1', 'codigo': 'PED5'},
              ]),
            _ => fail('Duplicado tras timeout ambiguo'),
          };
      await engine.processUpstreamQueue();
      expect((await taskByUuid('T1')).status, SyncStatus.completed);
    });

    test('ERP inalcanzable: corta tras 2 tareas sin consumir reintentos',
        () async {
      erp.handler = (r) => failWith(r, DioExceptionType.connectionTimeout);
      await seed([
        for (var i = 0; i < 4; i++)
          _task(ErpResource.pedidos, _orderPayload('ORD-$i'),
              uuid: 'T$i', createdAt: now.add(Duration(seconds: i))),
      ]);

      final result = await engine.processUpstreamQueue();

      expect(
        result,
        isA<UpstreamHalted>()
            .having((r) => r.reason, 'reason', UpstreamHaltReason.network),
      );
      expect(erp.writes, hasLength(2));
      for (var i = 0; i < 4; i++) {
        expect((await taskByUuid('T$i')).retries, 0);
      }
    });

    test('una tarea venenosa no bloquea a las siguientes', () async {
      erp.handler = (r) => r.form['numero2'] == 'ORD-0'
          ? failWith(r, DioExceptionType.connectionTimeout)
          : jsonResponse({
              'doc': {'codigo': 'OK'},
            });
      await seed([
        for (var i = 0; i < 3; i++)
          _task(ErpResource.pedidos, _orderPayload('ORD-$i'),
              uuid: 'T$i', createdAt: now.add(Duration(seconds: i))),
      ]);

      final result = await engine.processUpstreamQueue();

      expect(result, isA<UpstreamCompleted>());
      expect((await taskByUuid('T1')).status, SyncStatus.completed);
      expect((await taskByUuid('T2')).status, SyncStatus.completed);
      expect((await taskByUuid('T0')).nextAttemptAt, isNotNull);
    });

    test('payload corrupto pasa a fatalError sin bloquear la cola', () async {
      final corrupt =
          _task(ErpResource.pedidos, const {}, uuid: 'BAD', createdAt: now)
            ..payloadJson = '{roto';
      await seed([
        corrupt,
        _task(ErpResource.pedidos, _orderPayload('ORD-1'),
            uuid: 'T1', createdAt: now.add(const Duration(seconds: 1))),
      ]);

      await engine.processUpstreamQueue();

      expect((await taskByUuid('BAD')).status, SyncStatus.fatalError);
      expect((await taskByUuid('T1')).status, SyncStatus.completed);
    });
  });

  group('Clientes creados offline', () {
    test('reconcilia el código y reescribe el pedido encolado', () async {
      const tempCode = '${tempClientCodePrefix}100';
      erp.handler = (r) => switch (r.path) {
            '/api/3/clientes' => jsonResponse({
                'ok': 'record-updated-correctly',
                'data': {'codcliente': '000123'},
              }),
            _ => jsonResponse({
                'doc': {'codigo': 'PED1'},
              }),
          };
      await isar.writeTxn(() => isar.clientEntitys.put(
            ClientEntity()
              ..codcliente = tempCode
              ..nombre = 'Bar Nuevo'
              ..cifnif = 'B00000000',
          ));
      await seed(
        [
          _task(
            ErpResource.clientes,
            buildClientPayload(
              tempCode: tempCode,
              nombre: 'Bar Nuevo',
              cifnif: 'B00000000',
            ),
            uuid: 'TC',
            createdAt: now,
          ),
          _task(
              ErpResource.pedidos, _orderPayload('ORD-1', codcliente: tempCode),
              uuid: 'TO', createdAt: now.add(const Duration(seconds: 1))),
        ],
        [_order('ORD-1', 'TO', codcliente: tempCode)],
      );

      await engine.processUpstreamQueue();

      final clientPost = erp.writes.first;
      expect(clientPost.form.containsKey(tempClientCodeKey), isFalse);
      expect(erp.writes.last.form['codcliente'], '000123');
      expect(
        await isar.clientEntitys.where().codclienteEqualTo('000123').count(),
        1,
      );
      final order =
          await isar.orderEntitys.filter().localIdEqualTo('ORD-1').findFirst();
      expect(order?.codcliente, '000123');
    });

    test('si el ERP rechaza el cliente, el pedido pasa a conflicto', () async {
      const tempCode = '${tempClientCodePrefix}200';
      erp.handler = (r) => switch (r.path) {
            '/api/3/clientes' =>
              jsonResponse({'error': 'invalid-cifnif'}, status: 400),
            _ => fail('No debe enviarse un pedido de cliente inexistente'),
          };
      await seed([
        _task(
          ErpResource.clientes,
          buildClientPayload(tempCode: tempCode, nombre: 'X', cifnif: '?'),
          uuid: 'TC',
          createdAt: now,
        ),
        _task(ErpResource.pedidos, _orderPayload('ORD-1', codcliente: tempCode),
            uuid: 'TO', createdAt: now.add(const Duration(seconds: 1))),
      ]);

      await engine.processUpstreamQueue();

      expect((await taskByUuid('TC')).status, SyncStatus.fatalError);
      expect((await taskByUuid('TO')).status, SyncStatus.conflict);
    });
  });

  group('Catálogo descendente', () {
    test('pagina, une impuesto+stock del almacén y respeta autoventa',
        () async {
      ResponseBody page(RecordedRequest r, List<Object?> rows) =>
          jsonResponse(r.options.queryParameters['offset'] == 0 ? rows : []);

      erp.handler = (r) => switch (r.path) {
            '/api/3/clientes' => page(r, [
                {'codcliente': '000001', 'nombre': 'Bar Central'},
              ]),
            '/api/3/productos' => page(r, [
                {
                  'referencia': 'REF-01',
                  'descripcion': 'Cerveza',
                  'precio': 1.2,
                  'codimpuesto': 'IVA10',
                },
              ]),
            '/api/3/impuestos' => page(r, [
                {'codimpuesto': 'IVA10', 'iva': 10},
              ]),
            '/api/3/stocks' => page(r, [
                {'referencia': 'REF-01', 'cantidad': 20, 'disponible': 20},
              ]),
            _ => fail('Endpoint inesperado ${r.path}'),
          };
      // Albarán de autoventa (3 uds.) aún no confirmado por el ERP.
      await isar.writeTxn(() => isar.orderEntitys.put(
            _order('ALB-1', 'TA')
              ..documentType = DocumentType.albaran
              ..lineas = [
                OrderLineEmbedded()
                  ..referencia = 'REF-01'
                  ..cantidad = 3,
              ],
          ));

      await engine.pullDownstreamCatalog();

      expect(engine.currentCatalogState, isA<CatalogSyncSuccess>());
      final stockRequest =
          erp.requests.firstWhere((r) => r.path == '/api/3/stocks');
      expect(
        stockRequest.options.queryParameters['filter[codalmacen]'],
        'FURGO1',
      );
      final product = await isar.productEntitys
          .where()
          .referenciaEqualTo('REF-01')
          .findFirst();
      expect(product?.iva, 10.0);
      expect(product?.stockDisponible, 17);
    });

    test('elimina lo que el ERP ya no devuelve, salvo clientes offline',
        () async {
      await isar.writeTxn(() => isar.clientEntitys.putAll([
            ClientEntity()
              ..codcliente = 'BAJA'
              ..nombre = 'Dado de baja'
              ..cifnif = '',
            ClientEntity()
              ..codcliente = '${tempClientCodePrefix}1'
              ..nombre = 'Creado offline'
              ..cifnif = '',
          ]));
      erp.handler = (r) => jsonResponse(
            r.options.queryParameters['offset'] != 0
                ? <Object?>[]
                : switch (r.path) {
                    '/api/3/clientes' => [
                        {'codcliente': '000001', 'nombre': 'Activo'},
                        {
                          'codcliente': 'BAJA',
                          'nombre': 'Dado de baja',
                          'debaja': true,
                        },
                      ],
                    '/api/3/productos' => [
                        {'referencia': 'REF-01'},
                      ],
                    _ => <Object?>[],
                  },
          );

      await engine.pullDownstreamCatalog();

      final codes =
          await isar.clientEntitys.where().codclienteProperty().findAll();
      expect(codes, unorderedEquals(['000001', '${tempClientCodePrefix}1']));
    });

    test('un timeout de descarga es fallo reintentable (no "inesperado")',
        () async {
      erp.handler = (r) => failWith(r, DioExceptionType.receiveTimeout);

      await engine.pullDownstreamCatalog();

      expect(
        engine.currentCatalogState,
        isA<CatalogSyncFailure>().having((s) => s.canRetry, 'canRetry', true),
      );
    });
  });
}
