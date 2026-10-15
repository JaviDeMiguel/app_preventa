import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/engine/dispatch_classifier.dart';
import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/models/catalog_dtos.dart';
import 'package:app_preventa/core/sync/states/upstream_sync_result.dart';

/// Contrato verificado contra el código fuente de FacturaScripts:
/// - Core/Template/ApiController.php      → cabecera `X-Auth-Token`
/// - Core/Request.php                      → POST solo lee $_POST (form)
/// - Core/Controller/ApiCreateDocument.php → crear{Pedido,Albaran}Cliente
/// - Core/Lib/ApiBusinessDocumentTrait.php → `lineas` como JSON string
/// - Core/Lib/API/APIModel.php             → recursos = plural del modelo
void main() {
  group('Recursos y autenticación', () {
    test('los documentos se crean con los endpoints crear* reales', () {
      expect(ErpResource.pedidos.createPath, '/api/3/crearPedidoCliente');
      expect(ErpResource.albaranes.createPath, '/api/3/crearAlbaranCliente');
      expect(ErpResource.pedidos.lookupPath, '/api/3/pedidoclientes');
      expect(ErpResource.albaranes.lookupPath, '/api/3/albaranclientes');
    });

    test('el interceptor envía X-Auth-Token y no fuerza JSON', () {
      final options = RequestOptions(path: '/api/3/clientes');
      FacturaScriptsAuthInterceptor(
        const FacturaScriptsConfig(baseUrl: 'https://erp', apiToken: 'k3y'),
      ).onRequest(options, RequestInterceptorHandler());

      expect(options.headers['X-Auth-Token'], 'k3y');
      expect(options.headers.containsKey('FS-TOKEN'), isFalse);
      expect(options.headers['Content-Type'], isNull);
    });

    test('extrae el id del sobre {"doc": ...} de crearPedidoCliente', () {
      expect(
        extractErpId({
          'doc': {'codigo': 'PED2026A7', 'idpedido': 7, 'codcliente': 'C1'},
          'lines': <Object?>[],
        }, ErpResource.pedidos),
        'PED2026A7',
      );
    });

    test('el error {"error": msg} de FacturaScripts se conserva', () {
      final outcome = classifyHttpResponse(
        Response<dynamic>(
          requestOptions: RequestOptions(path: '/api/3/crearPedidoCliente'),
          statusCode: 404,
          data: {'error': 'customer-not-found'},
        ),
        resource: ErpResource.pedidos,
      );
      expect(
        outcome,
        isA<DispatchRejected>().having(
          (o) => o.message,
          'message',
          contains('customer-not-found'),
        ),
      );
    });
  });

  group('Payloads', () {
    final issuedAt = DateTime(2026, 10, 15, 9, 5, 7);

    test('documento de venta: solo campos que lee ApiCreateDocument', () {
      final payload = buildSalesDocumentPayload(
        codcliente: 'C0001',
        localDocumentId: 'ALB-1',
        issuedAt: issuedAt,
        warehouseCode: 'FURGO1',
        signerName: 'Ana',
        signerDni: '00000000T',
        lines: [
          (
            referencia: 'REF-01',
            descripcion: 'Cerveza',
            cantidad: 2,
            pvpunitario: 1.5,
            dtopor: 10,
          ),
        ],
      );

      expect(payload, containsPair('numero2', 'ALB-1'));
      expect(payload, containsPair('fecha', '15-10-2026'));
      expect(payload, containsPair('hora', '09:05:07'));
      expect(payload, containsPair('codalmacen', 'FURGO1'));
      expect(payload['observaciones'], contains('Ana (***000T)'));
      expect(payload['observaciones'], isNot(contains('00000000T')));
      expect(payload['lineas'], [
        {
          'referencia': 'REF-01',
          'descripcion': 'Cerveza',
          'cantidad': 2,
          'pvpunitario': 1.5,
          'dtopor': 10,
        },
      ]);
      expect(
        payload.keys,
        isNot(contains(anyOf('dsc', 'iva', 'pvptotal', 'firma_svg'))),
      );
    });

    test('sin almacén configurado no se envía codalmacen', () {
      final payload = buildSalesDocumentPayload(
        codcliente: 'C0001',
        localDocumentId: 'ORD-1',
        issuedAt: issuedAt,
        lines: const [],
      );
      expect(payload.containsKey('codalmacen'), isFalse);
      expect(payload.containsKey('observaciones'), isFalse);
    });

    test('el formulario omite claves locales y nulos y serializa lineas', () {
      final payload = {
        ...buildClientPayload(
          tempCode: 'TEMP-CLI-1',
          nombre: 'Bar Sol',
          cifnif: 'B00000000',
        ),
        'activo': true,
        'nota': null,
        'lineas': [
          {'referencia': 'R1', 'cantidad': 1},
        ],
      };

      final form = encodeFormFields(payload);

      expect(form.containsKey(tempClientCodeKey), isFalse);
      expect(form.containsKey('nota'), isFalse);
      expect(form['activo'], '1');
      expect(jsonDecode(form['lineas']!), [
        {'referencia': 'R1', 'cantidad': 1},
      ]);
    });
  });

  group('Catálogo (mapCatalog)', () {
    test('mapea los campos reales de Cliente', () {
      final (:clients, :products) = mapCatalog((
        clients: [
          {
            'codcliente': '000001',
            'nombre': 'Bar Central',
            'cifnif': 'B00000000',
            'riesgomax': '1500.00',
            'riesgoalcanzado': 1200,
            'regimeniva': 'Recargo',
            'debaja': false,
          },
          {'codcliente': '000002', 'nombre': 'De baja', 'debaja': '1'},
        ],
        products: const [],
        taxes: const [],
        stocks: null,
      ));

      expect(clients, hasLength(1));
      expect(clients.single.riesgomax, 1500.0);
      expect(clients.single.deuda, 1200.0);
      expect(clients.single.recargo, isTrue);
      expect(products, isEmpty);
    });

    test('une producto + impuesto + stock del almacén de la furgoneta', () {
      final (:clients, :products) = mapCatalog((
        clients: const [],
        products: [
          {
            'referencia': 'REF-01',
            'descripcion': 'Cerveza',
            'precio': '1.20',
            'codimpuesto': 'IVA10',
            'stockfis': 999,
            'sevende': true,
          },
          {'referencia': 'NO-VENTA', 'sevende': false},
          {'referencia': 'SIN-STOCK', 'codimpuesto': 'IVA21'},
        ],
        taxes: [
          {'codimpuesto': 'IVA10', 'iva': 10},
          {'codimpuesto': 'IVA21', 'iva': '21'},
        ],
        stocks: [
          {'referencia': 'REF-01', 'cantidad': 12, 'disponible': 10},
        ],
      ));

      expect(clients, isEmpty);
      expect(products.map((p) => p.referencia), ['REF-01', 'SIN-STOCK']);
      final beer = products.first;
      expect(beer.precio, 1.2);
      expect(beer.iva, 10.0);
      // Stock del almacén, no `stockfis` global.
      expect(beer.stockFisico, 12);
      expect(beer.stockDisponible, 10);
      expect(products.last.stockDisponible, 0);
    });

    test('sin almacén configurado usa stockfis global', () {
      final (clients: _, :products) = mapCatalog((
        clients: const [],
        products: [
          {'referencia': 'REF-01', 'stockfis': '7.0'},
        ],
        taxes: const [],
        stocks: null,
      ));
      expect(products.single.stockDisponible, 7);
    });

    test('una fila sin campo requerido es FormatException, no TypeError', () {
      expect(
        () => mapCatalog((
          clients: [
            {'nombre': 'Sin código'},
          ],
          products: const [],
          taxes: const [],
          stocks: null,
        )),
        throwsFormatException,
      );
    });
  });

  group('Conversores tolerantes', () {
    test('números y booleanos serializados como texto', () {
      expect(lenientDouble('12.50'), 12.5);
      expect(lenientDouble(null), 0.0);
      expect(lenientBool('t'), isTrue);
      expect(lenientBool('0'), isFalse);
      expect(lenientBool(1), isTrue);
      expect(lenientBoolTrue(null), isTrue);
    });
  });
}
