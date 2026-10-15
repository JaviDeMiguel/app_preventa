import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Utilidad para formatear pedidos y albaranes en tickets legibles para compartir o imprimir
class ReceiptFormatter {
  const ReceiptFormatter._();

  static String generateTextTicket(OrderEntity order) {
    final buffer = StringBuffer();
    final isAlbaran = order.documentType == DocumentType.albaran;
    final docTitle = isAlbaran ? 'ALBARÁN (AUTOVENTA)' : 'PEDIDO (PREVENTA)';

    final paymentTitle = switch (order.paymentMethod) {
      PaymentMethod.efectivo => 'EFECTIVO',
      PaymentMethod.tarjeta => 'TARJETA / TPV',
      PaymentMethod.transferencia => 'TRANSFERENCIA',
      PaymentMethod.pendiente => 'PENDIENTE DE PAGO',
    };

    final syncText = switch (order.syncStatus) {
      SyncStatus.completed => 'Sincronizado ERP (#${order.erpId ?? "OK"})',
      SyncStatus.pending => 'En cola local (Offline)',
      SyncStatus.inProgress => 'Enviando a FacturaScripts...',
      // FIX: `failed` ya no se reintenta solo; el texto anterior engañaba.
      SyncStatus.failed => 'Reintentos agotados (reintento manual)',
      SyncStatus.fatalError => 'Rechazado por el ERP',
      SyncStatus.conflict => 'En conflicto con el ERP (revisión)',
    };

    buffer.writeln('========================================');
    buffer.writeln('         COMPROBANTE COMERCIAL          ');
    buffer.writeln('========================================');
    buffer.writeln('Tipo: $docTitle');
    buffer.writeln('Nº Local: ${order.localId}');
    buffer
        .writeln('Fecha: ${order.fecha.toLocal().toString().substring(0, 16)}');
    buffer.writeln('----------------------------------------');
    buffer.writeln('CLIENTE:');
    buffer.writeln('Nombre: ${order.nombreCliente}');
    buffer.writeln('Código: ${order.codcliente}');
    buffer.writeln('----------------------------------------');
    buffer.writeln('LÍNEAS DE ARTÍCULOS:');

    for (final line in order.lineas) {
      final desc = line.descripcion ?? line.referencia ?? 'Artículo';
      final dscText =
          line.dsc > 0 ? ' (Dto. -${line.dsc.toStringAsFixed(1)}%)' : '';
      buffer.writeln('${line.cantidad}x $desc$dscText');
      buffer.writeln(
          '   Ref: ${line.referencia ?? "N/A"} | ${line.pvpunitario.toStringAsFixed(2)} € (+${line.iva}% IVA) = ${line.pvptotal.toStringAsFixed(2)} €');
    }

    buffer.writeln('----------------------------------------');
    buffer.writeln('Subtotal Neto: ${order.totalNeto.toStringAsFixed(2)} €');
    buffer.writeln('Impuestos (IVA): ${order.totalIva.toStringAsFixed(2)} €');
    buffer.writeln('TOTAL DOCUMENTO: ${order.totalFinal.toStringAsFixed(2)} €');
    buffer.writeln('----------------------------------------');
    buffer.writeln('FORMA DE PAGO: $paymentTitle');
    buffer.writeln(
        'ESTADO COBRO: ${order.isPaid ? "COBRADO EN MANO (${order.paidAmount.toStringAsFixed(2)} €)" : "PENDIENTE DE COBRO"}');

    if (order.firmanteNombre != null && order.firmanteNombre!.isNotEmpty ||
        order.firmaSvg != null && order.firmaSvg!.isNotEmpty) {
      buffer.writeln('----------------------------------------');
      buffer.writeln('CONFORMIDAD DEL CLIENTE:');
      if (order.firmanteNombre != null && order.firmanteNombre!.isNotEmpty) {
        buffer.writeln('Receptor: ${order.firmanteNombre}');
      }
      if (order.firmanteDni != null && order.firmanteDni!.isNotEmpty) {
        buffer.writeln('DNI / NIF: ${order.firmanteDni}');
      }
      buffer.writeln('Firma: [REGISTRADA DIGITALMENTE]');
    }

    buffer.writeln('----------------------------------------');
    buffer.writeln('Estado ERP: $syncText');
    buffer.writeln('========================================');
    buffer.writeln('¡Gracias por su confianza comercial!');

    return buffer.toString();
  }
}
