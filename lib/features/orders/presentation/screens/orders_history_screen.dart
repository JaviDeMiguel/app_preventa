import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/widgets/keyed_stream_builder.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/orders/presentation/widgets/digital_receipt_dialog.dart';
import 'package:app_preventa/features/orders/presentation/widgets/signature_preview_card.dart';

/// Pantalla de historial de pedidos locales y estado de sincronización con el ERP
class OrdersHistoryScreen extends StatelessWidget {
  static const _historyLimit = 300;

  final AppDependencies dependencies;

  const OrdersHistoryScreen({
    super.key,
    required this.dependencies,
  });

  void _showOrderDetails(BuildContext context, OrderEntity order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    'Detalle del Pedido ${order.localId}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text('Cliente: ${order.codcliente}'),
                  Text(
                    'Fecha: ${order.fecha.toLocal().toString().substring(0, 16)}',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const Divider(height: 24),
                  const Text(
                    'Líneas del Pedido:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...order.lineas.map(
                    (line) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${line.cantidad}x ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(line.descripcion ?? line.referencia ?? ''),
                                Text(
                                  'Ref: ${line.referencia ?? 'N/A'} • ${line.pvpunitario.toStringAsFixed(2)} €',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${line.pvptotal.toStringAsFixed(2)} €',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Neto:'),
                      Text('${order.totalNeto.toStringAsFixed(2)} €'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('IVA:'),
                      Text('${order.totalIva.toStringAsFixed(2)} €'),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pedido:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '${order.totalFinal.toStringAsFixed(2)} €',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  if (order.firmaSvg != null ||
                      order.firmanteNombre != null) ...[
                    const SizedBox(height: 12),
                    SignaturePreviewCard(
                      svg: order.firmaSvg,
                      signerName: order.firmanteNombre,
                      signerDni: order.firmanteDni,
                    ),
                  ],
                  const SizedBox(height: 16),
                  FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      DigitalReceiptDialog.show(context, order);
                    },
                    icon: const Icon(Icons.receipt_long),
                    label: const Text('Ver / Copiar Comprobante'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Pedidos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            tooltip: 'Reintentar sincronización',
            onPressed: () {
              // FIX: Antes las tareas `failed` nunca volvían a la cola.
              unawaited(dependencies.syncEngine.retryFailedTasks());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Procesando cola de pedidos...'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      // FIX (Rendimiento): stream estable y acotado; antes se recreaba en cada
      // rebuild y observaba TODOS los pedidos históricos.
      body: KeyedStreamBuilder<List<OrderEntity>>(
        create: () => dependencies.isar.orderEntitys
            .where()
            .sortByFechaDesc()
            .limit(_historyLimit)
            .watch(fireImmediately: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final orders = snapshot.data ?? [];

          if (orders.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.receipt_long_outlined,
                      size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  const Text(
                    'No hay pedidos registrados en este dispositivo.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final order = orders[index];

              // [ECC: Control de Flujo con Pattern Matching]
              final (badgeColor, badgeText, badgeIcon) =
                  switch (order.syncStatus) {
                SyncStatus.completed => (
                    Colors.green.shade700,
                    order.erpId != null
                        ? 'ERP #${order.erpId}'
                        : 'Sincronizado',
                    Icons.check_circle_outline,
                  ),
                SyncStatus.inProgress => (
                    Colors.blue.shade700,
                    'Enviando...',
                    Icons.hourglass_top,
                  ),
                SyncStatus.failed => (
                    Colors.orange.shade800,
                    'Reintentos agotados',
                    Icons.warning_amber,
                  ),
                SyncStatus.conflict => (
                    Colors.deepPurple.shade700,
                    'En conflicto',
                    Icons.report_problem_outlined,
                  ),
                SyncStatus.fatalError => (
                    Colors.red.shade800,
                    'Error ERP',
                    Icons.error_outline,
                  ),
                SyncStatus.pending => (
                    Colors.grey.shade700,
                    'En cola local',
                    Icons.schedule,
                  ),
              };

              return ListTile(
                title: Row(
                  children: [
                    Text(
                      order.localId,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${order.totalFinal.toStringAsFixed(2)} €',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Cliente: ${order.codcliente} • ${order.lineas.length} líneas'),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(badgeIcon, size: 14, color: badgeColor),
                        const SizedBox(width: 4),
                        Text(
                          badgeText,
                          style: TextStyle(
                            color: badgeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        if (order.firmaSvg != null ||
                            order.firmanteNombre != null) ...[
                          const SizedBox(width: 8),
                          Icon(Icons.draw,
                              size: 14, color: Colors.indigo.shade600),
                          const SizedBox(width: 2),
                          Text(
                            'Firmado',
                            style: TextStyle(
                              color: Colors.indigo.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                        const Spacer(),
                        Text(
                          order.fecha.toLocal().toString().substring(0, 16),
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showOrderDetails(context, order),
              );
            },
          );
        },
      ),
    );
  }
}
