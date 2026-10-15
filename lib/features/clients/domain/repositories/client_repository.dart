import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Contrato abstracto para el repositorio de catálogo comercial offline
abstract interface class ClientRepository {
  Future<List<ClientEntity>> searchClients(
    String query, {
    int limit = 50,
    int offset = 0,
  });

  /// [limit] acota lo que se deserializa en el Main Isolate en cada cambio.
  Stream<List<ClientEntity>> watchClients({String? query, int limit = 200});

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
    int limit = 200,
  });

  Future<ProductEntity?> getProductByReference(String referencia);
}
