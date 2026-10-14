import 'package:flutter_test/flutter_test.dart';

import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/utils/receipt_formatter.dart';
import 'package:app_preventa/features/orders/presentation/states/order_save_state.dart';

void main() {
  group('SyncTask Domain Model (ECC Inmutabilidad)', () {
    test('Serialización y deserialización JSON correcta', () {
      final task = SyncTask(
        id: 'TASK-1001',
        endpoint: '/api/3/pedidoscliente',
        method: HttpMethod.post,
        payload: {
          'codcliente': 'CLI001',
          'total': 150.50,
        },
        retries: 1,
        maxRetries: 3,
        status: SyncStatus.pending,
        createdAt: DateTime(2026, 10, 14, 12, 0),
      );

      final json = task.toJson();
      final fromJson = SyncTask.fromJson(json);

      expect(fromJson.id, equals('TASK-1001'));
      expect(fromJson.endpoint, equals('/api/3/pedidoscliente'));
      expect(fromJson.method, equals(HttpMethod.post));
      expect(fromJson.payload['codcliente'], equals('CLI001'));
      expect(fromJson.retries, equals(1));
      expect(fromJson.status, equals(SyncStatus.pending));
    });

    test('Inmutabilidad y copyWith libre de efectos secundarios', () {
      final task = SyncTask(
        id: 'TASK-1002',
        endpoint: '/api/3/albaranescliente',
        method: HttpMethod.post,
        payload: {'codcliente': 'CLI002'},
        createdAt: DateTime.now(),
      );

      final updated = task.copyWith(
        retries: task.retries + 1,
        status: SyncStatus.inProgress,
      );

      expect(task.retries, equals(0));
      expect(task.status, equals(SyncStatus.pending));
      expect(updated.retries, equals(1));
      expect(updated.status, equals(SyncStatus.inProgress));
    });
  });

  group('OrderSaveState (ECC Jerarquía Sealed & Exhaustividad)', () {
    test('Exhaustive Pattern Matching sobre estados de guardado', () {
      const OrderSaveState state = OrderSaveState.success(
        orderId: 'ORD-999',
        queuedTaskId: 'TASK-999',
        isOnlineSynced: true,
      );

      final resultMessage = switch (state) {
        OrderSaveInitial() => 'inicial',
        OrderSaveSubmitting(:final statusMessage) => statusMessage,
        OrderSaveSuccess(:final orderId, :final isOnlineSynced) =>
          'Pedido $orderId (Online: $isOnlineSynced)',
        OrderSaveFailure(:final errorMessage) => errorMessage,
      };

      expect(resultMessage, equals('Pedido ORD-999 (Online: true)'));
    });
  });

  group('Autoventa & DocumentType Support', () {
    test('Tipado de documentos comerciales (Pedido vs Albarán)', () {
      expect(DocumentType.pedido.name, equals('pedido'));
      expect(DocumentType.albaran.name, equals('albaran'));
    });

    test('Creación de tarea para alta de cliente en ruta', () {
      final task = SyncTask(
        id: 'TASK-CLI-01',
        endpoint: '/api/3/clientes',
        method: HttpMethod.post,
        payload: {
          'nombre': 'Restaurante Nuevo SL',
          'cifnif': 'B12345678',
          'temp_codcliente': 'TEMP-CLI-100',
        },
        createdAt: DateTime.now(),
      );

      expect(task.endpoint, equals('/api/3/clientes'));
      expect(task.payload['temp_codcliente'], equals('TEMP-CLI-100'));
      expect(task.payload['nombre'], equals('Restaurante Nuevo SL'));
    });
  });

  group('PaymentMethod & Digital Receipt', () {
    test('Tipado de formas de pago', () {
      expect(PaymentMethod.efectivo.name, equals('efectivo'));
      expect(PaymentMethod.tarjeta.name, equals('tarjeta'));
      expect(PaymentMethod.pendiente.name, equals('pendiente'));
    });

    test('Generación de ticket digital formateado', () {
      final order = OrderEntity()
        ..localId = 'ALB-1001'
        ..codcliente = 'CLI001'
        ..nombreCliente = 'Bar Central'
        ..fecha = DateTime(2026, 10, 14, 18, 0)
        ..totalNeto = 100.0
        ..totalIva = 21.0
        ..totalFinal = 121.0
        ..syncStatus = SyncStatus.completed
        ..erpId = 'ERP-55'
        ..documentType = DocumentType.albaran
        ..paymentMethod = PaymentMethod.efectivo
        ..isPaid = true
        ..paidAmount = 121.0
        ..lineas = [
          OrderLineEmbedded()
            ..referencia = 'REF-01'
            ..descripcion = 'Cerveza Barril'
            ..cantidad = 2
            ..pvpunitario = 50.0
            ..iva = 21.0
            ..pvptotal = 100.0,
        ];

      final ticket = ReceiptFormatter.generateTextTicket(order);

      expect(ticket, contains('COMPROBANTE COMERCIAL'));
      expect(ticket, contains('ALBARÁN (AUTOVENTA)'));
      expect(ticket, contains('ALB-1001'));
      expect(ticket, contains('Bar Central'));
      expect(ticket, contains('COBRADO EN MANO (121.00 €)'));
      expect(ticket, contains('Sincronizado ERP (#ERP-55)'));
    });

    test('Generación de ticket con descuentos de línea y firma digital', () {
      final order = OrderEntity()
        ..localId = 'ALB-2002'
        ..codcliente = 'CLI005'
        ..nombreCliente = 'Supermercado Sol'
        ..fecha = DateTime(2026, 10, 14, 19, 30)
        ..totalNeto = 90.0
        ..totalIva = 18.90
        ..totalFinal = 108.90
        ..syncStatus = SyncStatus.pending
        ..documentType = DocumentType.albaran
        ..paymentMethod = PaymentMethod.tarjeta
        ..isPaid = true
        ..paidAmount = 108.90
        ..firmaSvg =
            '<svg viewBox="0 0 100 100"><path d="M 0 0 L 50 50" /></svg>'
        ..firmanteNombre = 'Juan Gerente'
        ..firmanteDni = '12345678Z'
        ..lineas = [
          OrderLineEmbedded()
            ..referencia = 'VIN-01'
            ..descripcion = 'Vino Tinto Reserva'
            ..cantidad = 10
            ..pvpunitario = 10.0
            ..dsc = 10.0
            ..iva = 21.0
            ..pvptotal = 90.0,
        ];

      final ticket = ReceiptFormatter.generateTextTicket(order);

      expect(ticket, contains('Dto. -10.0%'));
      expect(ticket, contains('CONFORMIDAD DEL CLIENTE'));
      expect(ticket, contains('Receptor: Juan Gerente'));
      expect(ticket, contains('DNI / NIF: 12345678Z'));
      expect(ticket, contains('Firma: [REGISTRADA DIGITALMENTE]'));
    });
  });

  group('Client Financial Risk & Tariff Rates', () {
    test('ClientEntity y DTO mapean riesgo, deuda y tarifa correctamente', () {
      final client = ClientEntity()
        ..codcliente = 'CLI-DEBT-01'
        ..nombre = 'Cafetería Gran Vía'
        ..cifnif = 'B99887766'
        ..riesgomax = 1500.0
        ..deuda = 1200.0
        ..codtarifa = 'HOSTELERIA'
        ..recargo = true;

      expect(client.riesgomax, equals(1500.0));
      expect(client.deuda, equals(1200.0));
      expect(client.codtarifa, equals('HOSTELERIA'));
      expect(client.recargo, isTrue);

      // Verificación de alerta de riesgo si se supera el crédito
      const newOrderTotal = 350.0;
      final exceedsLimit = (client.deuda + newOrderTotal) > client.riesgomax;
      expect(exceedsLimit, isTrue); // 1200 + 350 = 1550 > 1500
    });
  });
}
