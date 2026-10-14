import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Repositorio de configuración local y comprobación de conectividad con FacturaScripts
class SettingsRepository {
  final Isar _isar;

  static const String _keyBaseUrl = 'fs_base_url';
  static const String _keyApiToken = 'fs_api_token';

  static const String defaultBaseUrl = 'https://demo.facturascripts.com';
  static const String defaultApiToken = 'DEMO_FS_TOKEN';

  const SettingsRepository(this._isar);

  /// Carga la configuración persistida en Isar o los valores por defecto
  Future<FacturaScriptsConfig> loadConfig() async {
    final baseUrlEntity = await _isar.appSettingsEntitys
        .filter()
        .keyEqualTo(_keyBaseUrl)
        .findFirst();

    final apiTokenEntity = await _isar.appSettingsEntitys
        .filter()
        .keyEqualTo(_keyApiToken)
        .findFirst();

    return FacturaScriptsConfig(
      baseUrl: baseUrlEntity?.value ?? defaultBaseUrl,
      apiToken: apiTokenEntity?.value ?? defaultApiToken,
    );
  }

  /// Guarda atómicamente la configuración en Isar
  Future<void> saveConfig(FacturaScriptsConfig config) async {
    final baseUrlEntity = AppSettingsEntity()
      ..key = _keyBaseUrl
      ..value = config.baseUrl.trim();

    final apiTokenEntity = AppSettingsEntity()
      ..key = _keyApiToken
      ..value = config.apiToken.trim();

    await _isar.writeTxn(() async {
      await _isar.appSettingsEntitys.putAll([
        baseUrlEntity,
        apiTokenEntity,
      ]);
    });
  }

  /// Prueba diagnóstica de conexión hacia FacturaScripts v3
  Future<(bool success, String message)> testConnection({
    required String baseUrl,
    required String apiToken,
  }) async {
    final sanitizedUrl = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');

    if (!sanitizedUrl.startsWith('http://') &&
        !sanitizedUrl.startsWith('https://')) {
      return (false, 'La URL debe comenzar por http:// o https://');
    }

    if (apiToken.trim().isEmpty) {
      return (false, 'El FS-TOKEN no puede estar vacío');
    }

    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: sanitizedUrl,
          connectTimeout: const Duration(seconds: 8),
          receiveTimeout: const Duration(seconds: 8),
          headers: {
            'FS-TOKEN': apiToken.trim(),
            'Accept': 'application/json',
          },
        ),
      );

      final response = await dio.get<dynamic>(
        '/api/3/clientes',
        queryParameters: {'limit': 1},
      );

      final isOk =
          (response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300;

      if (isOk) {
        return (true, '¡Conexión verificada con FacturaScripts v3!');
      }

      return (
        false,
        'Respuesta inesperada del servidor (HTTP ${response.statusCode})',
      );
    } on DioException catch (e) {
      final msg = switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.connectionError =>
          'No se pudo alcanzar el servidor. Verifica la URL y la conexión a la red.',
        DioExceptionType.badResponse => switch (e.response?.statusCode) {
            401 || 403 => 'FS-TOKEN no autorizado o caducado.',
            404 =>
              'Endpoint no encontrado. Verifica si la URL es de FacturaScripts v3.',
            _ =>
              'Error HTTP ${e.response?.statusCode}: ${e.response?.statusMessage}',
          },
        _ => 'Fallo de red: ${e.message}',
      };
      return (false, msg);
    } catch (e) {
      return (false, 'Error inesperado: $e');
    }
  }
}
