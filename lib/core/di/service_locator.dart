import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/database/local_database_service.dart';
import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/settings/settings_repository.dart';
import 'package:app_preventa/core/sync/engine/connectivity_sync_orchestrator.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/features/clients/data/repositories/isar_client_repository.dart';
import 'package:app_preventa/features/clients/domain/repositories/client_repository.dart';

/// [ECC: Inyección de Dependencias]
/// Contenedor de dependencias centralizado y desacoplado para el ciclo de vida de la app.
class AppDependencies {
  final Isar isar;
  final Dio dio;
  final Connectivity connectivity;
  final SyncEngine syncEngine;
  final ConnectivitySyncOrchestrator syncOrchestrator;
  final ClientRepository clientRepository;
  final SettingsRepository settingsRepository;

  /// Configuración vigente del ERP; el motor lee de aquí el almacén del vehículo.
  final ValueNotifier<FacturaScriptsConfig> apiConfig;

  const AppDependencies({
    required this.isar,
    required this.dio,
    required this.connectivity,
    required this.syncEngine,
    required this.syncOrchestrator,
    required this.clientRepository,
    required this.settingsRepository,
    required this.apiConfig,
  });

  /// Ensamblaje asíncrono ordenado de la infraestructura
  static Future<AppDependencies> initialize({
    FacturaScriptsConfig? apiConfig,
    String? dbDirectoryPath,
  }) async {
    // 1. Inicialización de la base de datos local con todos los esquemas Isar
    final isar = await LocalDatabaseService.init(
      directoryPath: dbDirectoryPath,
    );

    // 2. Repositorio de configuración persistida
    final settingsRepo = SettingsRepository(isar);
    final effectiveConfig = apiConfig ?? await settingsRepo.loadConfig();
    final configNotifier = ValueNotifier(effectiveConfig);

    // 3. Cliente de red configurado para FacturaScripts v3
    final dio = FacturaScriptsApiClient.create(effectiveConfig);

    // 4. Sensor de conectividad
    final connectivity = Connectivity();

    // 5. Motores de sincronización
    final syncEngine = SyncEngine(
      isar: isar,
      dio: dio,
      connectivity: connectivity,
      config: () => configNotifier.value,
    );

    final syncOrchestrator = ConnectivitySyncOrchestrator(
      syncEngine: syncEngine,
      connectivity: connectivity,
    );

    // Iniciar el vigilante reactivo de red
    await syncOrchestrator.startListening();

    // 6. Repositorios de datos locales
    final clientRepository = IsarClientRepository(isar);

    return AppDependencies(
      isar: isar,
      dio: dio,
      connectivity: connectivity,
      syncEngine: syncEngine,
      syncOrchestrator: syncOrchestrator,
      clientRepository: clientRepository,
      settingsRepository: settingsRepo,
      apiConfig: configNotifier,
    );
  }

  /// Actualiza en caliente la URL, el token y el almacén del vehículo.
  void updateApiConfig(FacturaScriptsConfig newConfig) {
    apiConfig.value = newConfig;
    dio.options.baseUrl = newConfig.baseUrl;

    for (final interceptor in dio.interceptors) {
      if (interceptor is FacturaScriptsAuthInterceptor) {
        interceptor.config = newConfig;
      }
    }

    // FIX: Tras un 401/403 la cola queda bloqueada (evita el baneo de IP de
    // FacturaScripts); solo un cambio de credenciales la desbloquea.
    syncOrchestrator.onCredentialsUpdated();
  }

  Future<void> dispose() async {
    await syncOrchestrator.dispose();
    await syncEngine.dispose();
    apiConfig.dispose();
    dio.close();
  }
}
