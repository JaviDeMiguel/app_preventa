import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Servicio de gestión y ciclo de vida de Isar Database
class LocalDatabaseService {
  const LocalDatabaseService._();

  /// Inicializa la base de datos Isar registrando todos los esquemas de colecciones
  static Future<Isar> init({
    String? directoryPath,
    bool inspector = true,
  }) async {
    final dir =
        directoryPath ?? (await getApplicationDocumentsDirectory()).path;

    if (Isar.instanceNames.isNotEmpty) {
      final existing = Isar.getInstance('preventa_db');
      if (existing != null && existing.isOpen) {
        return existing;
      }
    }

    return Isar.open(
      [
        SyncTaskCollectionSchema,
        SyncMetadataCollectionSchema,
        ClientEntitySchema,
        ProductEntitySchema,
        OrderEntitySchema,
        AppSettingsEntitySchema,
      ],
      directory: dir,
      name: 'preventa_db',
      inspector: inspector,
    );
  }
}
