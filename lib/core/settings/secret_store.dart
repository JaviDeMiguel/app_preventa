import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Almacén de secretos (token del ERP). Abstraído para poder probar
/// `SettingsRepository` sin canales de plataforma.
abstract interface class SecretStore {
  /// Nunca lanza: un secreto ilegible se trata como ausente (`null`).
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

/// FIX (Seguridad): el token de la API daba acceso total al ERP y se guardaba
/// en Isar en claro (legible con un backup o en un dispositivo rooteado).
/// Keychain en iOS; RSA-OAEP + AES-GCM con Android Keystore en Android.
final class SecureSecretStore implements SecretStore {
  const SecureSecretStore([this._storage = const FlutterSecureStorage()]);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key);
    }
    // FIX (Arranque): tras restaurar un backup en otro dispositivo, la clave
    // del Keystore ya no existe y la lectura lanza (BadPadding). Antes esto
    // impedía arrancar la app; ahora se descarta y se pide el token de nuevo.
    on PlatformException catch (error, stackTrace) {
      developer.log(
        'Secreto ilegible; se descarta y se solicitará de nuevo',
        name: 'SecureSecretStore',
        error: error.code,
        stackTrace: stackTrace,
      );
      await _deleteQuietly(key);
      return null;
    }
  }

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> _deleteQuietly(String key) async {
    try {
      await _storage.delete(key: key);
    } on PlatformException catch (error) {
      developer.log(
        'No se pudo borrar el secreto corrupto',
        name: 'SecureSecretStore',
        error: error.code,
      );
    }
  }
}
