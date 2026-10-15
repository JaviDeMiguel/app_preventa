import 'dart:async';

import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/widgets/keyed_stream_builder.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/orders/presentation/screens/order_submission_screen.dart';

/// Pantalla interactiva del catálogo de productos y carrito de pedido para el cliente seleccionado
class ProductCatalogScreen extends StatefulWidget {
  final ClientEntity client;
  final AppDependencies dependencies;
  final DocumentType documentType;

  const ProductCatalogScreen({
    super.key,
    required this.client,
    required this.dependencies,
    this.documentType = DocumentType.pedido,
  });

  @override
  State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
}

class _ProductCatalogScreenState extends State<ProductCatalogScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _onlyWithStock = false;

  // Carrito de pedido en memoria: referencia -> cantidad
  final Map<String, int> _cartQuantities = {};
  final Map<String, ProductEntity> _productCache = {};

  static const _searchDebounce = Duration(milliseconds: 300);
  Timer? _searchTimer;

  /// FIX: los resultados se cortaban en 200 sin aviso. Scroll infinito.
  static const _pageSize = 200;
  static const _loadMoreThreshold = 600.0;
  int _visibleLimit = _pageSize;

  bool _onScroll(ScrollNotification notification, int loadedCount) {
    final reachedEnd = notification.metrics.extentAfter < _loadMoreThreshold;
    if (reachedEnd && loadedCount >= _visibleLimit) {
      setState(() => _visibleLimit += _pageSize);
    }
    return false;
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  /// FIX (Rendimiento): debounce; antes cada tecla abría una consulta nueva.
  void _onSearchChanged(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(_searchDebounce, () {
      if (!mounted) return;
      setState(() {
        _searchQuery = value;
        _visibleLimit = _pageSize;
      });
    });
  }

  void _updateQuantity(ProductEntity product, int delta) {
    setState(() {
      _productCache[product.referencia] = product;
      final current = _cartQuantities[product.referencia] ?? 0;
      final updated = current + delta;

      if (updated <= 0) {
        _cartQuantities.remove(product.referencia);
      } else {
        _cartQuantities[product.referencia] = updated;
      }
    });
  }

  double get _totalAmount {
    double total = 0.0;
    for (final entry in _cartQuantities.entries) {
      final product = _productCache[entry.key];
      if (product != null) {
        total += product.precio * entry.value;
      }
    }
    return total;
  }

  int get _totalItemsCount {
    return _cartQuantities.values.fold(0, (sum, qty) => sum + qty);
  }

  void _proceedToOrderSubmission() {
    if (_cartQuantities.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Añade al menos un producto al pedido.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Líneas locales del carrito; `buildSalesDocumentPayload` las traduce al
    // formato de `crearPedidoCliente`/`crearAlbaranCliente`.
    final orderLines = _cartQuantities.entries.map((entry) {
      final product = _productCache[entry.key]!;
      final pvpTotal = product.precio * entry.value;
      return {
        'referencia': product.referencia,
        'descripcion': product.descripcion,
        'cantidad': entry.value,
        'pvpunitario': product.precio,
        'dsc': 0.0,
        'iva': product.iva,
        'pvptotal': double.parse(pvpTotal.toStringAsFixed(2)),
      };
    }).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OrderSubmissionScreen(
          syncEngine: widget.dependencies.syncEngine,
          isar: widget.dependencies.isar,
          codcliente: widget.client.codcliente,
          client: widget.client,
          orderLines: orderLines,
          documentType: widget.documentType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAlbaran = widget.documentType == DocumentType.albaran;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${isAlbaran ? "Albarán Directo" : "Pedido"} - ${widget.client.nombre}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Cliente: ${widget.client.codcliente} • ${isAlbaran ? "Autoventa" : "Preventa"}',
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Buscar artículo por ref o descripción...',
              leading: const Icon(Icons.search),
              trailing: [
                if (_searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchTimer?.cancel();
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  ),
              ],
              onChanged: _onSearchChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('Solo con stock'),
                  selected: _onlyWithStock,
                  onSelected: (selected) {
                    setState(() => _onlyWithStock = selected);
                  },
                ),
                const Spacer(),
                Text(
                  '${_cartQuantities.length} ref. seleccionadas',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            // FIX (Rendimiento): el stream sobrevive a los setState del carrito;
            // antes cada +/− re-consultaba y deserializaba el catálogo entero.
            child: KeyedStreamBuilder<List<ProductEntity>>(
              streamKey: (_searchQuery, _onlyWithStock, _visibleLimit),
              create: () => widget.dependencies.clientRepository.watchProducts(
                query: _searchQuery,
                onlyWithStock: _onlyWithStock,
                limit: _visibleLimit,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final products = snapshot.data ?? [];

                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.inventory_2_outlined,
                            size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No hay productos disponibles en caché local.'
                              : 'No se encontraron artículos para "$_searchQuery".',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  );
                }

                final hasMore = products.length >= _visibleLimit;

                return NotificationListener<ScrollNotification>(
                  onNotification: (n) => _onScroll(n, products.length),
                  child: ListView.separated(
                    itemCount: products.length + (hasMore ? 1 : 0),
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      if (index == products.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final product = products[index];
                      _productCache[product.referencia] = product;
                      final qty = _cartQuantities[product.referencia] ?? 0;
                      final hasStock = product.stockDisponible > 0;

                      return ListTile(
                        title: Text(
                          product.descripcion,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          'Ref: ${product.referencia} • Stock: ${product.stockDisponible} uds.\nPVP: ${product.precio.toStringAsFixed(2)} € (+${product.iva}% IVA)',
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (qty > 0) ...[
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                color: Colors.red.shade700,
                                onPressed: () => _updateQuantity(product, -1),
                              ),
                              Text(
                                '$qty',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: hasStock
                                  ? theme.colorScheme.primary
                                  : Colors.grey,
                              onPressed: () => _updateQuantity(product, 1),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$_totalItemsCount unidades',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '${_totalAmount.toStringAsFixed(2)} €',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed:
                    _cartQuantities.isEmpty ? null : _proceedToOrderSubmission,
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text('Tramitar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
