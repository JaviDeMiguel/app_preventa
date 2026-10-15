import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/clients/domain/repositories/client_repository.dart';

/// Implementación de alto rendimiento sobre Isar Database
class IsarClientRepository implements ClientRepository {
  // [ECC: Inyección de Dependencias]
  final Isar _isar;

  const IsarClientRepository(this._isar);

  @override
  Future<List<ClientEntity>> searchClients(
    String query, {
    int limit = 50,
    int offset = 0,
  }) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      return _isar.clientEntitys.where().offset(offset).limit(limit).findAll();
    }

    return _isar.clientEntitys
        .filter()
        .nombreContains(trimmed, caseSensitive: false)
        .or()
        .cifnifContains(trimmed, caseSensitive: false)
        .or()
        .codclienteContains(trimmed, caseSensitive: false)
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  @override
  Stream<List<ClientEntity>> watchClients({String? query, int limit = 200}) {
    final trimmed = query?.trim() ?? '';
    if (trimmed.isEmpty) {
      // FIX (Rendimiento): orden por índice `nombre` + límite; antes se
      // observaba la colección completa sin orden.
      return _isar.clientEntitys
          .where()
          .anyNombre()
          .limit(limit)
          .watch(fireImmediately: true);
    }

    return _isar.clientEntitys
        .filter()
        .nombreContains(trimmed, caseSensitive: false)
        .or()
        .cifnifContains(trimmed, caseSensitive: false)
        .or()
        .codclienteContains(trimmed, caseSensitive: false)
        // FIX: orden estable; sin él cada página podía traer filas distintas.
        .sortByNombre()
        .limit(limit)
        .watch(fireImmediately: true);
  }

  @override
  Future<ClientEntity?> getClientByCode(String codcliente) {
    return _isar.clientEntitys
        .where()
        .codclienteEqualTo(codcliente)
        .findFirst();
  }

  @override
  Future<List<ProductEntity>> searchProducts(
    String query, {
    bool onlyWithStock = false,
    int limit = 50,
    int offset = 0,
  }) async {
    final trimmed = query.trim();
    final queryBuilder = _isar.productEntitys.filter();
    final QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
        afterFilter;

    if (onlyWithStock && trimmed.isNotEmpty) {
      afterFilter = queryBuilder.stockDisponibleGreaterThan(0).and().group(
          (q) => q
              .descripcionContains(trimmed, caseSensitive: false)
              .or()
              .referenciaContains(trimmed, caseSensitive: false));
    } else if (onlyWithStock) {
      afterFilter = queryBuilder.stockDisponibleGreaterThan(0);
    } else if (trimmed.isNotEmpty) {
      afterFilter = queryBuilder.group((q) => q
          .descripcionContains(trimmed, caseSensitive: false)
          .or()
          .referenciaContains(trimmed, caseSensitive: false));
    } else {
      return _isar.productEntitys.where().offset(offset).limit(limit).findAll();
    }

    return afterFilter.offset(offset).limit(limit).findAll();
  }

  @override
  Stream<List<ProductEntity>> watchProducts({
    String? query,
    bool onlyWithStock = false,
    int limit = 200,
  }) {
    final trimmed = query?.trim() ?? '';
    final queryBuilder = _isar.productEntitys.filter();
    final QueryBuilder<ProductEntity, ProductEntity, QAfterFilterCondition>
        afterFilter;

    if (onlyWithStock && trimmed.isNotEmpty) {
      afterFilter = queryBuilder.stockDisponibleGreaterThan(0).and().group(
          (q) => q
              .descripcionContains(trimmed, caseSensitive: false)
              .or()
              .referenciaContains(trimmed, caseSensitive: false));
    } else if (onlyWithStock) {
      afterFilter = queryBuilder.stockDisponibleGreaterThan(0);
    } else if (trimmed.isNotEmpty) {
      afterFilter = queryBuilder.group((q) => q
          .descripcionContains(trimmed, caseSensitive: false)
          .or()
          .referenciaContains(trimmed, caseSensitive: false));
    } else {
      return _isar.productEntitys
          .where()
          .anyDescripcion()
          .limit(limit)
          .watch(fireImmediately: true);
    }

    // FIX: orden estable; sin él cada página podía traer filas distintas.
    return afterFilter
        .sortByDescripcion()
        .limit(limit)
        .watch(fireImmediately: true);
  }

  @override
  Future<ProductEntity?> getProductByReference(String referencia) {
    return _isar.productEntitys
        .where()
        .referenciaEqualTo(referencia)
        .findFirst();
  }
}
