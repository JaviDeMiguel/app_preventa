import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/core/sync/states/catalog_sync_state.dart';
import 'package:app_preventa/features/clients/presentation/screens/client_detail_screen.dart';
import 'package:app_preventa/features/clients/presentation/screens/new_client_screen.dart';
import 'package:app_preventa/features/dashboard/presentation/screens/sales_dashboard_screen.dart';
import 'package:app_preventa/features/orders/presentation/screens/orders_history_screen.dart';
import 'package:app_preventa/features/settings/presentation/screens/settings_screen.dart';

/// Pantalla de listado y búsqueda full-text reactiva de clientes offline
class ClientsListScreen extends StatefulWidget {
  // [ECC: Inyección de Dependencias]
  final AppDependencies dependencies;

  const ClientsListScreen({
    super.key,
    required this.dependencies,
  });

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  Future<void> _triggerCatalogSync() async {
    await widget.dependencies.syncEngine.pullDownstreamCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Preventa'),
            const SizedBox(width: 8),
            StreamBuilder<bool>(
              stream: widget.dependencies.syncOrchestrator.onConnectivityChange,
              initialData: widget.dependencies.syncOrchestrator.isOnline,
              builder: (context, snapshot) {
                final isOnline = snapshot.data ?? false;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isOnline
                        ? Colors.green.shade800
                        : Colors.orange.shade800,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isOnline ? Icons.wifi : Icons.wifi_off,
                        size: 12,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isOnline ? 'Online' : 'Offline',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            tooltip: 'Resumen de Jornada',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SalesDashboardScreen(
                    dependencies: widget.dependencies,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.receipt_long),
            tooltip: 'Historial de Pedidos',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => OrdersHistoryScreen(
                    dependencies: widget.dependencies,
                  ),
                ),
              );
            },
          ),
          StreamBuilder<CatalogSyncState>(
            stream: widget.dependencies.syncEngine.catalogSyncStream,
            builder: (context, snapshot) {
              final state = snapshot.data ?? const CatalogSyncState.idle();

              // [ECC: Control de Flujo con Pattern Matching]
              return switch (state) {
                CatalogSyncInProgress(:final progress) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          value: progress > 0 ? progress : null,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                _ => IconButton(
                    icon: const Icon(Icons.sync),
                    tooltip: 'Sincronizar Catálogo FacturaScripts',
                    onPressed: _triggerCatalogSync,
                  ),
              };
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Configuración ERP',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(
                    dependencies: widget.dependencies,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner de estado de sincronización reactivo
          StreamBuilder<CatalogSyncState>(
            stream: widget.dependencies.syncEngine.catalogSyncStream,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state == null) return const SizedBox.shrink();

              return switch (state) {
                CatalogSyncInProgress(:final currentStep) => Container(
                    width: double.infinity,
                    color: theme.colorScheme.primaryContainer,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    child: Text(
                      currentStep,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                CatalogSyncFailure(:final errorMessage) => Container(
                    width: double.infinity,
                    color: Colors.red.shade100,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    child: Text(
                      errorMessage,
                      style:
                          TextStyle(color: Colors.red.shade900, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                CatalogSyncSuccess(
                  :final clientsUpdated,
                  :final productsUpdated
                ) =>
                  Container(
                    width: double.infinity,
                    color: Colors.green.shade100,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    child: Text(
                      'Sincronizado: $clientsUpdated clientes, $productsUpdated productos.',
                      style:
                          TextStyle(color: Colors.green.shade900, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Buscar por nombre, CIF/NIF o código...',
              leading: const Icon(Icons.search),
              trailing: [
                if (_searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _onSearchChanged('');
                    },
                  ),
              ],
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ClientEntity>>(
              stream: widget.dependencies.clientRepository
                  .watchClients(query: _searchQuery),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final clients = snapshot.data ?? [];

                if (clients.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person_off_outlined,
                            size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        Text(
                          _searchQuery.isEmpty
                              ? 'Sin clientes en caché local.\nToca sincronizar para descargar desde FacturaScripts.'
                              : 'No hay clientes que coincidan con "$_searchQuery".',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        if (_searchQuery.isEmpty) ...[
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: _triggerCatalogSync,
                            icon: const Icon(Icons.cloud_download),
                            label: const Text('Descargar Clientes'),
                          ),
                        ],
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: clients.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final client = clients[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          client.nombre.isNotEmpty
                              ? client.nombre[0].toUpperCase()
                              : 'C',
                        ),
                      ),
                      title: Text(
                        client.nombre,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'CIF: ${client.cifnif.isNotEmpty ? client.cifnif : 'N/A'} • Cód: ${client.codcliente}\n${client.ciudad ?? ''}',
                        maxLines: 2,
                      ),
                      isThreeLine:
                          client.ciudad != null && client.ciudad!.isNotEmpty,
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ClientDetailScreen(
                              client: client,
                              dependencies: widget.dependencies,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NewClientScreen(
                dependencies: widget.dependencies,
              ),
            ),
          );
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Nuevo Cliente'),
      ),
    );
  }
}
