// Prueba E2E sobre la interfaz REAL contra un FacturaScripts de pruebas.
//
//   flutter test integration_test/offline_order_flow_test.dart -d windows \
//     --dart-define=FS_URL=http://localhost/facturascripts \
//     --dart-define=FS_TOKEN=<clave api> --dart-define=FS_WAREHOUSE=ALG
//
// Requiere en el ERP el cliente genérico del TPV y el producto BEB-AGUA-50.
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/main.dart';

const _url = String.fromEnvironment('FS_URL');
const _token = String.fromEnvironment('FS_TOKEN');
const _warehouse = String.fromEnvironment('FS_WAREHOUSE');

const _clientName = 'CLIENTES VARIOS (TPV)';
const _productRef = 'BEB-AGUA-50';
const _productName = 'Agua mineral (50 cl)';

/// Red controlable: permite simular el corte y la recuperación de cobertura.
final class SwitchableConnectivity implements Connectivity {
  SwitchableConnectivity({required bool online})
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

/// Bombea frames hasta que aparece [finder] (operaciones reales de red/BD).
Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 60),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
    if (finder.evaluate().isNotEmpty) return;
  }
  throw TestFailure('No apareció en ${timeout.inSeconds}s: $finder');
}

Future<void> tapVisible(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'pedido creado sin red se envía solo al recuperar la cobertura',
    (tester) async {
      final dir = await Directory.systemTemp.createTemp('preventa_e2e_');
      final network = SwitchableConnectivity(online: true);
      final config = FacturaScriptsConfig(
        baseUrl: _url,
        apiToken: _token,
        warehouseCode: _warehouse.isEmpty ? null : _warehouse,
      );
      final erp = FacturaScriptsApiClient.create(config);
      late AppDependencies dependencies;
      String? localOrderId;

      addTearDown(() async {
        if (localOrderId case final String id) {
          final found = await erp.get<List<dynamic>>(
            '/api/3/pedidoclientes',
            queryParameters: {'filter[numero2]': id},
          );
          for (final order in found.data ?? const []) {
            await erp.delete<dynamic>(
              '/api/3/pedidoclientes/${(order as Map)['idpedido']}',
            );
          }
        }
        erp.close();
      });

      Future<List<dynamic>> erpOrders(String localId) async =>
          (await erp.get<List<dynamic>>(
            '/api/3/pedidoclientes',
            queryParameters: {'filter[numero2]': localId},
          ))
              .data ??
          const [];

      await tester.pumpWidget(PreventaApp(
        initialize: () async => dependencies = await AppDependencies.initialize(
          apiConfig: config,
          dbDirectoryPath: dir.path,
          connectivity: network,
        ),
      ));

      // 1. Descarga del catálogo desde la UI.
      await pumpUntil(tester, find.text('Descargar Clientes'));
      await tapVisible(tester, find.text('Descargar Clientes'));
      await pumpUntil(
        tester,
        find.text(_clientName),
        timeout: const Duration(seconds: 120),
      );

      // 2. El comercial pierde la cobertura.
      network.setOnline(false);
      await pumpUntil(tester, find.text('Offline'));

      // 3. Pedido de 2 unidades desde la UI.
      await tapVisible(tester, find.text(_clientName));
      await pumpUntil(tester, find.textContaining('Nuevo Pedido'));
      await tapVisible(tester, find.textContaining('Nuevo Pedido'));
      await pumpUntil(tester, find.text('Tramitar Pedido'));

      await tester.enterText(
        find.descendant(
          of: find.byType(SearchBar),
          matching: find.byType(EditableText),
        ),
        _productRef,
      );
      // El buscador tiene debounce: se espera a que la lista quede filtrada
      // (un único producto) y se pulsa el "+" DE SU FILA, no el primero.
      await tester.pump(const Duration(milliseconds: 400));
      await pumpUntil(
        tester,
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.icon == Icons.add_circle_outline &&
              find.byIcon(Icons.add_circle_outline).evaluate().length == 1,
        ),
      );
      final productRow = find
          .ancestor(
            of: find.text(_productName),
            matching: find.byType(ListTile),
          )
          .first;
      final addButton = find.descendant(
        of: productRow,
        matching: find.byIcon(Icons.add_circle_outline),
      );
      await tapVisible(tester, addButton);
      await tapVisible(tester, addButton);

      await tapVisible(tester, find.text('Tramitar Pedido'));
      await pumpUntil(tester, find.text('Guardar y Encolar Pedido'));
      await tapVisible(tester, find.text('Guardar y Encolar Pedido'));
      await pumpUntil(tester, find.textContaining('ID Local:'));

      // 4. Guardado y encolado en local; NADA en el ERP todavía.
      final order = await dependencies.isar.orderEntitys.where().findFirst();
      localOrderId = order?.localId;
      expect(order, isNotNull);
      expect(order!.syncStatus, SyncStatus.pending);
      expect(order.lineas.single.cantidad, 2);
      expect(await erpOrders(order.localId), isEmpty);

      // 5. Vuelve la cobertura: el orquestador envía la cola solo.
      network.setOnline(true);
      final deadline = DateTime.now().add(const Duration(seconds: 90));
      var status = SyncStatus.pending;
      while (
          status != SyncStatus.completed && DateTime.now().isBefore(deadline)) {
        await tester.pump(const Duration(milliseconds: 500));
        status = (await dependencies.isar.orderEntitys
                .filter()
                .localIdEqualTo(order.localId)
                .findFirst())!
            .syncStatus;
      }
      expect(status, SyncStatus.completed);

      // 6. Verificación en el ERP: un único pedido con la línea correcta.
      final inErp = await erpOrders(order.localId);
      expect(inErp, hasLength(1));
      final lines = (await erp.get<List<dynamic>>(
            '/api/3/lineapedidoclientes',
            queryParameters: {
              'filter[idpedido]': (inErp.single as Map)['idpedido'],
            },
          ))
              .data ??
          const [];
      expect((lines.single as Map)['referencia'], _productRef);
      expect((lines.single as Map)['cantidad'], 2);
    },
    skip: _url.isEmpty || _token.isEmpty,
    timeout: const Timeout(Duration(minutes: 6)),
  );
}
