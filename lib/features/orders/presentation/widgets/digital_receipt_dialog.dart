import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/utils/receipt_formatter.dart';

/// Modal interactivo para visualizar y copiar o compartir el ticket digital
class DigitalReceiptDialog extends StatelessWidget {
  final OrderEntity order;

  const DigitalReceiptDialog({
    super.key,
    required this.order,
  });

  static Future<void> show(BuildContext context, OrderEntity order) {
    return showDialog(
      context: context,
      builder: (_) => DigitalReceiptDialog(order: order),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ticketText = ReceiptFormatter.generateTextTicket(order);

    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.receipt_long, color: Colors.indigo),
          SizedBox(width: 8),
          Text('Comprobante Digital'),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: SelectableText(
              ticketText,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                height: 1.35,
              ),
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: ticketText));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Comprobante copiado al portapapeles. Listo para enviar por WhatsApp o Email.',
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          icon: const Icon(Icons.copy),
          label: const Text('Copiar Ticket'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
