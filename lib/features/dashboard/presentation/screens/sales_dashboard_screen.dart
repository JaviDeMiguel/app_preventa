import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/catalog_sync_state.dart';

/// Pantalla de Liquidación Diaria y Control de Stock en Vehículo para el Comercial
class SalesDashboardScreen extends StatelessWidget {
  final AppDependencies dependencies;

  const SalesDashboardScreen({
    super.key,
    required this.dependencies,
  });

  Future<void> _handleEndOfDaySync(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('Iniciando sincronización completa de cierre de jornada...'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    await dependencies.syncEngine.processUpstreamQueue();
    await dependencies.syncEngine.pullDownstreamCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de Jornada'),
      ),
      body: StreamBuilder<List<OrderEntity>>(
        stream: dependencies.isar.orderEntitys
            .filter()
            .fechaGreaterThan(todayStart)
            .watch(fireImmediately: true),
        builder: (context, orderSnapshot) {
          final todayOrders = orderSnapshot.data ?? [];

          double totalPreventa = 0.0;
          double totalAutoventa = 0.0;
          double totalEfectivo = 0.0;
          double totalTarjeta = 0.0;
          double totalPendiente = 0.0;
          final uniqueClients = <String>{};

          for (final order in todayOrders) {
            uniqueClients.add(order.codcliente);
            if (order.documentType == DocumentType.albaran) {
              totalAutoventa += order.totalFinal;
            } else {
              totalPreventa += order.totalFinal;
            }

            if (order.isPaid) {
              if (order.paymentMethod == PaymentMethod.efectivo) {
                totalEfectivo += order.paidAmount;
              } else if (order.paymentMethod == PaymentMethod.tarjeta) {
                totalTarjeta += order.paidAmount;
              }
            } else {
              totalPendiente += order.totalFinal;
            }
          }

          final grandTotal = totalPreventa + totalAutoventa;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tarjeta Principal de Facturación de Hoy
                Card(
                  elevation: 0,
                  color: theme.colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Ventas Totales Hoy',
                          style: TextStyle(
                            color: theme.colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${grandTotal.toStringAsFixed(2)} €',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildSubMetric(
                              'Preventa (${todayOrders.where((o) => o.documentType == DocumentType.pedido).length})',
                              '${totalPreventa.toStringAsFixed(2)} €',
                              theme.colorScheme.onPrimaryContainer,
                            ),
                            Container(
                              height: 30,
                              width: 1,
                              color: theme.colorScheme.onPrimaryContainer
                                  .withValues(alpha: 0.2),
                            ),
                            _buildSubMetric(
                              'Autoventa (${todayOrders.where((o) => o.documentType == DocumentType.albaran).length})',
                              '${totalAutoventa.toStringAsFixed(2)} €',
                              theme.colorScheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tarjetas de Métricas Rápidas
                Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        icon: Icons.storefront_outlined,
                        color: Colors.blue.shade700,
                        title: 'Clientes Visitados',
                        value: '${uniqueClients.length}',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StreamBuilder<int>(
                        stream: dependencies.isar.syncTaskCollections
                            .filter()
                            .statusEqualTo(SyncStatus.pending)
                            .or()
                            .statusEqualTo(SyncStatus.failed)
                            .watch(fireImmediately: true)
                            .map((tasks) => tasks.length),
                        builder: (context, queueSnapshot) {
                          final pendingCount = queueSnapshot.data ?? 0;
                          final hasPending = pendingCount > 0;

                          return _buildMetricCard(
                            context,
                            icon: hasPending
                                ? Icons.sync_problem_outlined
                                : Icons.cloud_done_outlined,
                            color: hasPending
                                ? Colors.orange.shade800
                                : Colors.green.shade700,
                            title: 'Cola de Sincronización',
                            value: hasPending
                                ? '$pendingCount pendientes'
                                : 'Al día',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Arqueo de Caja (Recaudación del Día)
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.point_of_sale,
                                color: Colors.teal, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Arqueo de Caja (Recaudación)',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Efectivo en mano:'),
                            Text(
                              '${totalEfectivo.toStringAsFixed(2)} €',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tarjeta / TPV:'),
                            Text(
                              '${totalTarjeta.toStringAsFixed(2)} €',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Pendiente de Cobro:'),
                            Text(
                              '${totalPendiente.toStringAsFixed(2)} €',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Botón de Cierre de Jornada
                StreamBuilder<CatalogSyncState>(
                  stream: dependencies.syncEngine.catalogSyncStream,
                  builder: (context, snapshot) {
                    final syncState =
                        snapshot.data ?? const CatalogSyncState.idle();

                    final isSyncing = switch (syncState) {
                      CatalogSyncInProgress() => true,
                      _ => false,
                    };

                    return FilledButton.icon(
                      onPressed:
                          isSyncing ? null : () => _handleEndOfDaySync(context),
                      icon: isSyncing
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.cloud_sync_outlined),
                      label: Text(
                        isSyncing
                            ? 'Sincronizando con ERP...'
                            : 'Cierre de Jornada (Sincronización Total)',
                      ),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.indigo.shade800,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 28),

                // Control de Mercancía en Vehículo (Stock en Furgoneta)
                Row(
                  children: [
                    Text(
                      'Mercancía en Vehículo (Stock)',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Disponible en furgoneta',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                StreamBuilder<List<ProductEntity>>(
                  stream: dependencies.isar.productEntitys
                      .where()
                      .sortByStockDisponibleDesc()
                      .watch(fireImmediately: true),
                  builder: (context, prodSnapshot) {
                    final products = prodSnapshot.data ?? [];

                    if (products.isEmpty) {
                      return Card(
                        elevation: 0,
                        color: Colors.grey.shade50,
                        child: const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Center(
                            child: Text(
                              'Sin productos en la base de datos local.\nRealiza una sincronización para cargar el catálogo.',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: products.length > 10 ? 10 : products.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final hasStock = product.stockDisponible > 0;

                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            product.descripcion,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text('Ref: ${product.referencia}'),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: hasStock
                                  ? Colors.green.shade50
                                  : Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: hasStock
                                    ? Colors.green.shade300
                                    : Colors.red.shade300,
                              ),
                            ),
                            child: Text(
                              '${product.stockDisponible} uds.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: hasStock
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
