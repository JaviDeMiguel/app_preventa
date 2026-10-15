// Prueba de contrato contra un FacturaScripts REAL (no se ejecuta en CI).
//
// Uso (instancia de PRUEBAS; crea y borra datos marcados PRUEBA-APP-*):
//   FS_URL=http://localhost/facturascripts FS_TOKEN=<clave api full access> \
//   FS_WAREHOUSE=ALG flutter test test/erp_live_contract_test.dart
@Tags(['erp-live'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/catalog_sync_state.dart';

import 'support/isar_test_support.dart';

final _env = Platform.environment;
final _url = _env['FS_URL'];
final _token = _env['FS_TOKEN'];
final _warehouse = _env['FS_WAREHOUSE'];

final class _OnlineConnectivity implements Connectivity {
  @override
  Future<List<ConnectivityResult>> checkConnectivity() async =>
      const [ConnectivityResult.wifi];

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      const Stream.empty();
}

/// NIF sintético válido y único por ejecución (letra de control correcta).
String _syntheticNif(int seed) {
  final number = seed % 100000000;
  const letters = 'TRWAGMYFPDXBNJZSQVHLCKE';
  return '${number.toString().padLeft(8, '0')}${letters[number % 23]}';
}

void main() {
  final runId = DateTime.now().millisecondsSinceEpoch;
  final marker = 'PRUEBA-APP-$runId';
  final productRef = 'PA$runId';
  final clientNif = _syntheticNif(runId);
  final tempCode = '$tempClientCodePrefix$runId';
  final orderLocalId = 'ORD-$runId';
  final vanSaleLocalId = 'ALB-$runId';
  const signature =
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">'
      '<path d="M1 1 L9 9"/></svg>';

  late Isar isar;
  late Directory dir;
  late Dio erp;
  late SyncEngine engine;

  final config = FacturaScriptsConfig(
    baseUrl: _url ?? '',
    apiToken: _token ?? '',
    warehouseCode: _warehouse,
  );

  Future<List<Map<String, dynamic>>> list(
    String resource,
    Map<String, Object> filters,
  ) async {
    final response = await erp.get<dynamic>(
      '/api/3/$resource',
      queryParameters: {
        for (final MapEntry(:key, :value) in filters.entries)
          'filter[$key]': value,
        'limit': 50,
      },
    );
    return (response.data as List<dynamic>).cast<Map<String, dynamic>>();
  }

  Future<void> deleteQuietly(String path) async {
    try {
      await erp.delete<dynamic>(path);
    } on DioException catch (error) {
      // ignore: avoid_print
      print(
          'Limpieza: no se pudo borrar $path (${error.response?.statusCode})');
    }
  }

  Future<SyncTaskCollection> taskByUuid(String uuid) async =>
      (await isar.syncTaskCollections.filter().uuidEqualTo(uuid).findFirst())!;

  group('Contrato real con FacturaScripts',
      skip: _url == null || _token == null
          ? 'Define FS_URL y FS_TOKEN para ejecutar contra una instancia real.'
          : false, () {
    setUpAll(() async {
      await initIsarCoreForTests();
      (isar, dir) = await openTestIsar();
      erp = FacturaScriptsApiClient.create(config);
      engine = SyncEngine(
        isar: isar,
        dio: erp,
        connectivity: _OnlineConnectivity(),
        config: () => config,
      );

      // Producto de prueba con stock en el almacén de la furgoneta.
      await erp.post<dynamic>(
        '/api/3/productos',
        data: encodeFormFields({
          'referencia': productRef,
          'descripcion': '$marker producto',
          'precio': 10,
          'ventasinstock': true,
        }),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (_warehouse case final String warehouse) {
        await erp.post<dynamic>(
          '/api/3/stocks',
          data: encodeFormFields({
            'referencia': productRef,
            'codalmacen': warehouse,
            'cantidad': 10,
          }),
          options: Options(contentType: Headers.formUrlEncodedContentType),
        );
      }
    });

    tearDownAll(() async {
      // Limpieza por marcadores: funciona aunque algún test haya fallado.
      for (final (resource, model, idField, localId) in [
        ('pedidoclientes', 'PedidoCliente', 'idpedido', orderLocalId),
        ('albaranclientes', 'AlbaranCliente', 'idalbaran', vanSaleLocalId),
      ]) {
        for (final doc in await list(resource, {'numero2': localId})) {
          final id = doc[idField];
          for (final relation in await list(
            'attachedfilerelations',
            {'model': model, 'modelid': '$id'},
          )) {
            await deleteQuietly(
                '/api/3/attachedfilerelations/${relation['id']}');
            await deleteQuietly('/api/3/attachedfiles/${relation['idfile']}');
          }
          await deleteQuietly('/api/3/$resource/$id');
        }
      }
      for (final client in await list('clientes', {'cifnif': clientNif})) {
        for (final contact
            in await list('contactos', {'codcliente': client['codcliente']})) {
          await deleteQuietly('/api/3/contactos/${contact['idcontacto']}');
        }
        await deleteQuietly('/api/3/clientes/${client['codcliente']}');
      }
      for (final stock in await list('stocks', {'referencia': productRef})) {
        await deleteQuietly('/api/3/stocks/${stock['idstock']}');
      }
      for (final product
          in await list('productos', {'referencia': productRef})) {
        await deleteQuietly('/api/3/productos/${product['idproducto']}');
      }
      await engine.dispose();
      erp.close();
      await closeTestIsar(isar, dir);
    });

    test('token inválido → 401 con mensaje (sin reintentos)', () async {
      final badErp = FacturaScriptsApiClient.create(
        config.copyWith(apiToken: 'token-invalido-$runId'),
      );
      addTearDown(badErp.close);

      final error = await badErp.get<dynamic>('/api/3/clientes',
          queryParameters: {
            'limit': 1
          }).then<DioException?>((_) => null,
          onError: (Object e) => e as DioException);

      expect(error?.response?.statusCode, anyOf(401, 403));
    });

    test('cliente offline + pedido firmado + albarán de furgoneta', () async {
      final now = DateTime.now();
      SyncTaskCollection task(
        ErpResource resource,
        Map<String, Object?> payload,
        String uuid,
        int order,
      ) =>
          SyncTaskCollection()
            ..uuid = uuid
            ..endpoint = resource.createPath
            ..method = HttpMethod.post
            ..payloadJson = jsonEncode(payload)
            ..retries = 0
            ..maxRetries = defaultTaskMaxRetries
            ..status = SyncStatus.pending
            ..createdAt = now.add(Duration(milliseconds: order));

      Map<String, Object?> document(String localId) =>
          buildSalesDocumentPayload(
            codcliente: tempCode,
            localDocumentId: localId,
            issuedAt: now,
            warehouseCode: _warehouse,
            signerName: 'Firmante $marker',
            signerDni: clientNif,
            lines: [
              (
                referencia: productRef,
                descripcion: '$marker línea',
                cantidad: 2,
                pvpunitario: 10,
                dtopor: 0,
              ),
            ],
          );

      OrderEntity order(String localId, String taskUuid, DocumentType type) =>
          OrderEntity()
            ..localId = localId
            ..codcliente = tempCode
            ..nombreCliente = marker
            ..fecha = now
            ..totalNeto = 20
            ..totalIva = 0
            ..totalFinal = 20
            ..syncStatus = SyncStatus.pending
            ..documentType = type
            ..paymentMethod = PaymentMethod.pendiente
            ..syncTaskId = taskUuid
            ..firmaSvg = type == DocumentType.pedido ? signature : null
            ..lineas = [
              OrderLineEmbedded()
                ..referencia = productRef
                ..cantidad = 2,
            ];

      await isar.writeTxn(() async {
        await isar.clientEntitys.put(
          ClientEntity()
            ..codcliente = tempCode
            ..nombre = marker
            ..cifnif = clientNif,
        );
        await isar.syncTaskCollections.putAll([
          task(
            ErpResource.clientes,
            buildClientPayload(
              tempCode: tempCode,
              nombre: marker,
              cifnif: clientNif,
              direccion: 'C/ $marker 1',
              codpostal: '35001',
              ciudad: 'Las Palmas',
            ),
            'T-CLI',
            0,
          ),
          task(ErpResource.pedidos, document(orderLocalId), 'T-PED', 1),
          task(ErpResource.albaranes, document(vanSaleLocalId), 'T-ALB', 2),
        ]);
        await isar.orderEntitys.putAll([
          order(orderLocalId, 'T-PED', DocumentType.pedido),
          order(vanSaleLocalId, 'T-ALB', DocumentType.albaran),
        ]);
      });

      await engine.processUpstreamQueue();

      final tasks = await isar.syncTaskCollections.where().findAll();
      final summary = [
        for (final t in tasks)
          '${t.uuid}: ${t.status.name} ${t.errorMessage ?? ''}',
      ].join('\n');
      expect(
        tasks.every((t) => t.status == SyncStatus.completed),
        isTrue,
        reason: summary,
      );

      // Cliente: código real reconciliado y dirección en su contacto.
      final clients = await list('clientes', {'cifnif': clientNif});
      expect(clients, hasLength(1));
      final codcliente = clients.single['codcliente'] as String;
      final localClient = await isar.clientEntitys
          .where()
          .codclienteEqualTo(codcliente)
          .findFirst();
      expect(localClient?.nombre, marker, reason: 'reconciliación TEMP→ERP');
      final contact = (await erp.get<dynamic>(
              '/api/3/contactos/${clients.single['idcontactofact']}'))
          .data as Map<String, dynamic>;
      expect(contact['direccion'], 'C/ $marker 1');
      expect(contact['codpostal'], '35001');

      // Pedido: cliente real, líneas, firma enlazada.
      final orders = await list('pedidoclientes', {'numero2': orderLocalId});
      expect(orders, hasLength(1));
      expect(orders.single['codcliente'], codcliente);
      expect(orders.single['observaciones'], contains('Firmante $marker'));
      expect(orders.single['observaciones'], isNot(contains(clientNif)));
      final orderLines = await list(
        'lineapedidoclientes',
        {'idpedido': orders.single['idpedido']},
      );
      expect(orderLines.single['referencia'], productRef);
      expect(orderLines.single['cantidad'], 2);
      final relations = await list('attachedfilerelations', {
        'model': 'PedidoCliente',
        'modelid': '${orders.single['idpedido']}',
      });
      expect(relations, hasLength(1), reason: 'firma enlazada al pedido');

      // Albarán: almacén de la furgoneta y descuento de stock en el ERP.
      final vanSales =
          await list('albaranclientes', {'numero2': vanSaleLocalId});
      expect(vanSales, hasLength(1));
      if (_warehouse case final String warehouse) {
        expect(vanSales.single['codalmacen'], warehouse);
        final stock = await list(
          'stocks',
          {'referencia': productRef, 'codalmacen': warehouse},
        );
        expect(stock.single['cantidad'], 8);
      }
    });

    test('un reenvío dudoso se verifica y NO duplica el pedido', () async {
      await isar.writeTxn(() async {
        final pedido = await taskByUuid('T-PED');
        pedido
          ..status = SyncStatus.pending
          ..deliveryUncertain = true;
        await isar.syncTaskCollections.put(pedido);
      });

      await engine.processUpstreamQueue();

      expect((await taskByUuid('T-PED')).status, SyncStatus.completed);
      expect(
        await list('pedidoclientes', {'numero2': orderLocalId}),
        hasLength(1),
      );
    });

    test('descarga completa del catálogo real', () async {
      await engine.pullDownstreamCatalog();

      expect(
        engine.currentCatalogState,
        isA<CatalogSyncSuccess>(),
        reason: '${engine.currentCatalogState}',
      );
      final product = await isar.productEntitys
          .where()
          .referenciaEqualTo(productRef)
          .findFirst();
      expect(product, isNotNull);
      if (_warehouse case final String warehouse) {
        // El pedido de prueba RESERVA stock en FacturaScripts: `disponible` =
        // cantidad − reservada. La app debe reflejar ambos valores del ERP.
        final stock = (await list(
          'stocks',
          {'referencia': productRef, 'codalmacen': warehouse},
        ))
            .single;
        expect(product?.stockFisico, stock['cantidad']);
        expect(product?.stockDisponible, stock['disponible']);
        expect(stock['reservada'], 2, reason: 'reserva del pedido de prueba');
      }
      final erpClients = (await erp.get<dynamic>(
        '/api/3/clientes',
        queryParameters: {'limit': 1},
      ))
          .headers
          .value('x-total-count');
      expect(await isar.clientEntitys.count(), int.parse(erpClients!));
    });
  });
}
