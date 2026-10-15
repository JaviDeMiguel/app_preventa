import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/settings/secret_store.dart';
import 'package:app_preventa/core/settings/settings_repository.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

import 'support/isar_test_support.dart';

final class InMemorySecretStore implements SecretStore {
  final values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;

  @override
  Future<void> delete(String key) async => values.remove(key);
}

final class _FailingWriteStore implements SecretStore {
  @override
  Future<String?> read(String key) async => null;

  @override
  Future<void> write(String key, String value) async =>
      throw PlatformException(code: 'KeystoreUnavailable');

  @override
  Future<void> delete(String key) async {}
}

void main() {
  group('Política de URL del ERP', () {
    test('HTTPS siempre es válido', () {
      expect(
        validateErpBaseUrl('https://erp.miempresa.com', allowInsecure: false),
        isNull,
      );
    });

    test('HTTP se rechaza en release (token en claro)', () {
      expect(
        validateErpBaseUrl('http://erp.miempresa.com', allowInsecure: false),
        contains('HTTPS'),
      );
    });

    test('HTTP solo se admite en debug', () {
      expect(
        validateErpBaseUrl('http://192.168.1.10', allowInsecure: true),
        isNull,
      );
    });

    test('URLs sin host o con otro esquema se rechazan', () {
      expect(validateErpBaseUrl('erp', allowInsecure: true), isNotNull);
      expect(
          validateErpBaseUrl('ftp://erp.com', allowInsecure: true), isNotNull);
    });

    test('sin token la configuración no se considera utilizable', () {
      expect(
        const FacturaScriptsConfig(baseUrl: 'https://erp.com', apiToken: ' ')
            .isConfigured,
        isFalse,
      );
      expect(
        const FacturaScriptsConfig(baseUrl: 'https://erp.com', apiToken: 'k')
            .isConfigured,
        isTrue,
      );
    });
  });

  group('SettingsRepository + almacén seguro', () {
    late Isar isar;
    late Directory dir;
    late InMemorySecretStore secrets;
    late SettingsRepository repository;

    setUpAll(initIsarCoreForTests);

    setUp(() async {
      (isar, dir) = await openTestIsar();
      secrets = InMemorySecretStore();
      repository = SettingsRepository(isar, secrets: secrets);
    });

    tearDown(() => closeTestIsar(isar, dir));

    test('sin configuración no hay URL ni token de demostración', () async {
      final config = await repository.loadConfig();
      expect(config.baseUrl, isEmpty);
      expect(config.apiToken, isEmpty);
      expect(config.isConfigured, isFalse);
    });

    test('el token se guarda en el almacén seguro, nunca en Isar', () async {
      await repository.saveConfig(
        const FacturaScriptsConfig(
          baseUrl: 'https://erp.com',
          apiToken: 's3cr3t',
          warehouseCode: 'FURGO1',
        ),
      );

      expect(secrets.values['fs_api_token'], 's3cr3t');
      final storedInIsar =
          await isar.appSettingsEntitys.filter().valueEqualTo('s3cr3t').count();
      expect(storedInIsar, 0);

      final reloaded = await repository.loadConfig();
      expect(reloaded.apiToken, 's3cr3t');
      expect(reloaded.warehouseCode, 'FURGO1');
    });

    test('borra la copia en claro aunque el almacén seguro ya tenga token',
        () async {
      // Estado tras un crash entre la escritura segura y el borrado.
      secrets.values['fs_api_token'] = 'seguro';
      await isar.writeTxn(
        () => isar.appSettingsEntitys.put(
          AppSettingsEntity()
            ..key = 'fs_api_token'
            ..value = 'seguro',
        ),
      );

      final config = await repository.loadConfig();

      expect(config.apiToken, 'seguro');
      expect(
        await isar.appSettingsEntitys
            .filter()
            .keyEqualTo('fs_api_token')
            .count(),
        0,
      );
    });

    test('si el almacén seguro falla, conserva la copia heredada', () async {
      final failing = SettingsRepository(isar, secrets: _FailingWriteStore());
      await isar.writeTxn(
        () => isar.appSettingsEntitys.put(
          AppSettingsEntity()
            ..key = 'fs_api_token'
            ..value = 'legacy',
        ),
      );

      final config = await failing.loadConfig();

      expect(config.apiToken, 'legacy');
      expect(
        await isar.appSettingsEntitys
            .filter()
            .keyEqualTo('fs_api_token')
            .count(),
        1,
      );
    });

    test('limita la cadencia de pruebas de conexión', () async {
      var now = DateTime(2026, 10, 15, 12);
      final throttled =
          SettingsRepository(isar, secrets: secrets, clock: () => now);

      // Puerto cerrado en localhost: falla rápido y sin salir a la red.
      await throttled.testConnection(
        baseUrl: 'https://127.0.0.1:1',
        apiToken: 'k',
      );
      final (ok, message) = await throttled.testConnection(
        baseUrl: 'https://127.0.0.1:1',
        apiToken: 'k',
      );

      expect(ok, isFalse);
      expect(message, contains('Espera'));

      now = now.add(const Duration(seconds: 20));
      final (_, later) = await throttled.testConnection(
        baseUrl: 'https://127.0.0.1:1',
        apiToken: 'k',
      );
      expect(later, isNot(contains('Espera')));
    });

    test('migra un token heredado en Isar al almacén seguro y lo borra',
        () async {
      await isar.writeTxn(
        () => isar.appSettingsEntitys.put(
          AppSettingsEntity()
            ..key = 'fs_api_token'
            ..value = 'legacy',
        ),
      );

      final config = await repository.loadConfig();

      expect(config.apiToken, 'legacy');
      expect(secrets.values['fs_api_token'], 'legacy');
      expect(
        await isar.appSettingsEntitys
            .filter()
            .keyEqualTo('fs_api_token')
            .count(),
        0,
      );
    });
  });
}
