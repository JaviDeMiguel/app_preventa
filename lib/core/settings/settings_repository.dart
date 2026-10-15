import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/settings/secret_store.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Repositorio de configuración local y comprobación de conectividad con FacturaScripts
class SettingsRepository {
  final Isar _isar;
  final SecretStore _secrets;

  static const String _keyBaseUrl = 'fs_base_url';
  static const String _keyApiToken = 'fs_api_token';
  static const String _keyWarehouse = 'fs_codalmacen';

  // FIX (Seguridad): sin URL ni token por defecto. Antes se usaba
  // `DEMO_FS_TOKEN` contra un servidor público: cada arranque sin configurar
  // intentaba sincronizar y sumaba incidencias de baneo de IP.

  SettingsRepository(
    this._isar, {
    SecretStore secrets = const SecureSecretStore(),
    DateTime Function()? clock,
  })  : _secrets = secrets,
        _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;
  DateTime? _lastConnectionTestAt;

  /// FIX (Baneo de IP): cada prueba con token erróneo es una incidencia en
  /// FacturaScripts (5 en 10 min bloquean la IP). Se limita la cadencia.
  static const _connectionTestCooldown = Duration(seconds: 15);

  /// Carga la configuración: URL y almacén desde Isar, token desde el
  /// almacén seguro del sistema operativo.
  Future<FacturaScriptsConfig> loadConfig() async {
    final (baseUrl, warehouse, legacyToken) = await (
      _readSetting(_keyBaseUrl),
      _readSetting(_keyWarehouse),
      _readSetting(_keyApiToken),
    ).wait;

    return FacturaScriptsConfig(
      baseUrl: baseUrl ?? '',
      apiToken: await _loadToken(legacyToken) ?? '',
      warehouseCode: switch (warehouse?.trim()) {
        final String code when code.isNotEmpty => code,
        _ => null,
      },
    );
  }

  /// Guarda la configuración: el token NUNCA se persiste en Isar.
  Future<void> saveConfig(FacturaScriptsConfig config) async {
    await _secrets.write(_keyApiToken, config.apiToken.trim());

    final settings = [
      AppSettingsEntity()
        ..key = _keyBaseUrl
        ..value = config.baseUrl.trim(),
      AppSettingsEntity()
        ..key = _keyWarehouse
        ..value = config.warehouseCode?.trim() ?? '',
    ];
    await _isar.writeTxn(() => _isar.appSettingsEntitys.putAll(settings));
  }

  /// Migración: instalaciones previas guardaban el token en Isar en claro.
  /// Se traslada al almacén seguro y se borra de la base de datos.
  Future<String?> _loadToken(String? legacyToken) async {
    final stored = await _secrets.read(_keyApiToken);
    if (stored != null && stored.isNotEmpty) {
      // FIX: si un crash interrumpió la migración (o tras restaurar un
      // backup) la copia en claro quedaba en Isar para siempre.
      if (legacyToken != null) await _deleteLegacyToken();
      return stored;
    }
    if (legacyToken == null || legacyToken.isEmpty) return null;

    try {
      await _secrets.write(_keyApiToken, legacyToken);
    }
    // Si el almacén seguro falla, la app sigue funcionando con la copia
    // heredada (no se borra: perderla dejaría al comercial sin sincronizar).
    on PlatformException catch (error) {
      developer.log(
        'Migración del token aplazada: almacén seguro no disponible',
        name: 'SettingsRepository',
        error: error.code,
      );
      return legacyToken;
    }

    // Solo se borra la copia en claro tras confirmar la escritura segura.
    if (await _secrets.read(_keyApiToken) == legacyToken) {
      await _deleteLegacyToken();
    }
    return legacyToken;
  }

  Future<void> _deleteLegacyToken() => _isar.writeTxn(
        () => _isar.appSettingsEntitys
            .filter()
            .keyEqualTo(_keyApiToken)
            .deleteAll(),
      );

  Future<String?> _readSetting(String key) async =>
      (await _isar.appSettingsEntitys.filter().keyEqualTo(key).findFirst())
          ?.value;

  /// Prueba diagnóstica de conexión hacia FacturaScripts v3
  Future<(bool success, String message)> testConnection({
    required String baseUrl,
    required String apiToken,
  }) async {
    final sanitizedUrl = baseUrl.trim().replaceAll(RegExp(r'/+$'), '');

    if (validateErpBaseUrl(sanitizedUrl) case final String error) {
      return (false, error);
    }

    if (apiToken.trim().isEmpty) {
      return (false, 'El token de la API no puede estar vacío');
    }

    final now = _clock();
    if (_lastConnectionTestAt case final last?
        when now.difference(last) < _connectionTestCooldown) {
      return (
        false,
        'Espera unos segundos entre pruebas: el ERP bloquea la IP tras '
            'varios intentos fallidos.',
      );
    }
    _lastConnectionTestAt = now;

    final dio = Dio(
      BaseOptions(
        baseUrl: sanitizedUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        // FIX (Seguridad): una redirección a http:// reenviaría el token.
        followRedirects: false,
        headers: {
          // FIX (Contrato API): FacturaScripts lee `X-Auth-Token`, no FS-TOKEN.
          facturaScriptsTokenHeader: apiToken.trim(),
          'Accept': 'application/json',
        },
      ),
    );

    try {
      await dio.get<dynamic>(
        '/api/3/clientes',
        queryParameters: {'limit': 1},
      );
      return (true, '¡Conexión verificada con FacturaScripts!');
    } on DioException catch (e) {
      final msg = switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.connectionError =>
          'No se pudo alcanzar el servidor. Verifica la URL y la conexión a la red.',
        DioExceptionType.badCertificate =>
          'Certificado HTTPS no válido en el servidor.',
        DioExceptionType.badResponse => switch (e.response?.statusCode) {
            401 || 403 => 'Token de la API no autorizado o caducado.',
            404 =>
              'Endpoint no encontrado. Verifica si la URL es de FacturaScripts.',
            _ =>
              'Error HTTP ${e.response?.statusCode}: ${e.response?.statusMessage}',
          },
        _ => 'Fallo de red: ${e.message}',
      };
      return (false, msg);
    } finally {
      dio.close();
    }
  }
}
