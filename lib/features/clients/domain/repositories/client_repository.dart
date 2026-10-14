import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Contrato abstracto para el repositorio de catálogo comercial offline
abstract interface class ClientRepository {
  Future<List<ClientEntity>> searchClients(
    String query, {
    int limit = 50,
    int offset = 0,
  });

  Stream<List<ClientEntity>> watchClients({String? query});

  Future<ClientEntity?> getClientByCode(String codcliente);

  Future<List<ProductEntity>> searchProducts(
    String query, {
    bool onlyWithStock = false,
    int limit = 50,
    int offset = 0,
  });

  Stream<List<ProductEntity>> watchProducts({
    String? query,
    bool onlyWithStock = false,
  });

  Future<ProductEntity?> getProductByReference(String referencia);
}
