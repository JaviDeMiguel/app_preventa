import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/products/presentation/screens/product_catalog_screen.dart';

/// Ficha comercial del cliente con acceso a datos de contacto, historial específico y emisión de documentos
class ClientDetailScreen extends StatelessWidget {
  final ClientEntity client;
  final AppDependencies dependencies;

  const ClientDetailScreen({
    super.key,
    required this.client,
    required this.dependencies,
  });

  void _navigateToCatalog(BuildContext context, DocumentType documentType) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductCatalogScreen(
          client: client,
          dependencies: dependencies,
          documentType: documentType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(client.nombre),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabecera con datos fiscales del cliente
            Card(
              elevation: 0,
              color: theme.colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          child: Text(
                            client.nombre.isNotEmpty
                                ? client.nombre[0].toUpperCase()
                                : 'C',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                client.nombre,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Código: ${client.codcliente} • CIF/NIF: ${client.cifnif.isNotEmpty ? client.cifnif : "N/A"}',
                                style: TextStyle(
                                  color: theme.colorScheme.onPrimaryContainer
                                      .withValues(alpha: 0.8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tarjetas de contacto y localización
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.phone_outlined),
                      title: Text(client.telefono?.isNotEmpty == true
                          ? client.telefono!
                          : 'Sin teléfono registrado'),
                      subtitle: const Text('Teléfono de contacto'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.email_outlined),
                      title: Text(client.email?.isNotEmpty == true
                          ? client.email!
                          : 'Sin email registrado'),
                      subtitle: const Text('Correo electrónico'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(
                        [
                          client.direccion,
                          client.codpostal,
                          client.ciudad,
                        ]
                            .where((e) => e != null && e.isNotEmpty)
                            .join(', ')
                            .ifEmpty('Sin dirección registrada'),
                      ),
                      subtitle: const Text('Dirección fiscal y entrega'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tarjeta de Riesgo de Crédito y Tarifas
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color:
                      client.riesgomax > 0 && client.deuda >= client.riesgomax
                          ? Colors.red.shade300
                          : Colors.indigo.shade100,
                  width:
                      client.riesgomax > 0 && client.deuda >= client.riesgomax
                          ? 1.5
                          : 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              color: client.riesgomax > 0 && client.deuda >= client.riesgomax
                  ? Colors.red.shade50
                  : Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 20,
                          color: client.riesgomax > 0 &&
                                  client.deuda >= client.riesgomax
                              ? Colors.red.shade700
                              : Colors.indigo,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Riesgo y Situación Comercial',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: client.riesgomax > 0 &&
                                    client.deuda >= client.riesgomax
                                ? Colors.red.shade900
                                : Colors.indigo.shade900,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: client.riesgomax > 0 &&
                                    client.deuda >= client.riesgomax
                                ? Colors.red.shade700
                                : client.deuda > 0
                                    ? Colors.amber.shade700
                                    : Colors.green.shade700,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            client.riesgomax > 0 &&
                                    client.deuda >= client.riesgomax
                                ? 'EXCEDIDO'
                                : client.deuda > 0
                                    ? 'DEUDA VIVA'
                                    : 'SOLVENTE',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Deuda Pendiente',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                '${client.deuda.toStringAsFixed(2)} €',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: client.deuda > 0
                                      ? Colors.red.shade700
                                      : Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Límite Crédito',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                client.riesgomax > 0
                                    ? '${client.riesgomax.toStringAsFixed(2)} €'
                                    : 'Sin límite',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Tarifa / Recargo',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 2),
                              Text(
                                '${client.codtarifa?.isNotEmpty == true ? client.codtarifa! : "GENERAL"}${client.recargo ? " (+R.E.)" : ""}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Botones de acción comercial (Preventa vs Autoventa)
            Text(
              'Operativa Comercial',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () =>
                        _navigateToCatalog(context, DocumentType.pedido),
                    icon: const Icon(Icons.post_add),
                    label: const Text('Nuevo Pedido\n(Preventa)',
                        textAlign: TextAlign.center),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonalIcon(
                    onPressed: () =>
                        _navigateToCatalog(context, DocumentType.albaran),
                    icon: const Icon(Icons.local_shipping_outlined),
                    label: const Text('Venta Directa\n(Albarán)',
                        textAlign: TextAlign.center),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Historial de documentos de este cliente
            Text(
              'Documentos de este Cliente',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            StreamBuilder<List<OrderEntity>>(
              stream: dependencies.isar.orderEntitys
                  .filter()
                  .codclienteEqualTo(client.codcliente)
                  .sortByFechaDesc()
                  .watch(fireImmediately: true),
              builder: (context, snapshot) {
                final orders = snapshot.data ?? [];

                if (orders.isEmpty) {
                  return Card(
                    elevation: 0,
                    color: Colors.grey.shade50,
                    child: const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Center(
                        child: Text(
                          'No hay pedidos ni albaranes previos para este cliente en el dispositivo.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final isAlbaran =
                        order.documentType == DocumentType.albaran;

                    return ListTile(
                      dense: true,
                      leading: Icon(
                        isAlbaran
                            ? Icons.local_shipping_outlined
                            : Icons.receipt_long_outlined,
                        color: isAlbaran ? Colors.teal : Colors.blue.shade700,
                      ),
                      title: Text(
                        '${isAlbaran ? "Albarán" : "Pedido"} ${order.localId}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${order.fecha.toLocal().toString().substring(0, 16)} • ${order.lineas.length} líneas',
                      ),
                      trailing: Text(
                        '${order.totalFinal.toStringAsFixed(2)} €',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  String ifEmpty(String fallback) => isEmpty ? fallback : this;
}
