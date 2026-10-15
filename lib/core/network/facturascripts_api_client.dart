import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Configuración para la conexión con la API de FacturaScripts v3.
class FacturaScriptsConfig {
  final String baseUrl;
  final String apiToken;

  /// Almacén del vehículo (autoventa). Determina de qué almacén se descuenta
  /// el albarán en el ERP y qué stock se descarga. `null` = almacén por defecto.
  final String? warehouseCode;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  const FacturaScriptsConfig({
    required this.baseUrl,
    required this.apiToken,
    this.warehouseCode,
    this.connectTimeout = const Duration(seconds: 15),
    // FIX: crearPedidoCliente recalcula totales de todas las líneas en el ERP;
    // 15 s provocaba timeouts AMBIGUOS (el ERP sí guardaba el documento).
    this.receiveTimeout = const Duration(seconds: 30),
  });

  /// Hay URL válida y token: solo entonces se permite hablar con el ERP
  /// (cada intento con token vacío suma incidencias de baneo de IP).
  bool get isConfigured =>
      apiToken.trim().isNotEmpty && validateErpBaseUrl(baseUrl) == null;

  FacturaScriptsConfig copyWith({
    String? baseUrl,
    String? apiToken,
    String? warehouseCode,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) {
    return FacturaScriptsConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      apiToken: apiToken ?? this.apiToken,
      warehouseCode: warehouseCode ?? this.warehouseCode,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
    );
  }
}

/// FIX (Seguridad): valida la URL del ERP. En release solo se admite HTTPS:
/// por HTTP el token (acceso total al ERP) y los datos personales de los
/// clientes viajarían en claro. En debug se permite HTTP para entornos locales.
/// Devuelve `null` si es válida o el mensaje de error.
String? validateErpBaseUrl(String raw, {bool allowInsecure = kDebugMode}) {
  final uri = Uri.tryParse(raw.trim());
  return switch (uri) {
    null || Uri(host: '') => 'Introduce una URL válida (https://...).',
    Uri(scheme: 'https') => null,
    Uri(scheme: 'http') when allowInsecure => null,
    Uri(scheme: 'http') =>
      'Por seguridad solo se admite HTTPS: el token viajaría sin cifrar.',
    _ => 'La URL debe comenzar por https://',
  };
}

/// Cabecera de autenticación que lee `Core/Template/ApiController.php`
/// (acepta `X-Auth-Token` y, como alternativa, `Token`).
const facturaScriptsTokenHeader = 'X-Auth-Token';

/// Interceptor que inyecta la autenticación de la API de FacturaScripts.
class FacturaScriptsAuthInterceptor extends Interceptor {
  FacturaScriptsConfig config;

  FacturaScriptsAuthInterceptor(this.config);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // FIX (Contrato API): FacturaScripts ignora `FS-TOKEN`; toda petición se
    // rechazaba como `auth-token-invalid` y sumaba incidencias de baneo de IP.
    options.headers[facturaScriptsTokenHeader] = config.apiToken;
    options.headers['Accept'] = 'application/json';
    // FIX: Ya no se fuerza `Content-Type: application/json`. FacturaScripts
    // NO parsea cuerpos JSON en POST (`Request::parseRequestData` solo usa
    // $_POST); cada petición de escritura declara form-urlencoded.
    handler.next(options);
  }
}

/// Fábrica para inicializar y parametrizar el cliente Dio
class FacturaScriptsApiClient {
  const FacturaScriptsApiClient._();

  static Dio create(FacturaScriptsConfig config) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        sendTimeout: config.receiveTimeout,
        responseType: ResponseType.json,
        // FIX (Seguridad): dart:io conserva las cabeceras al seguir una
        // redirección; un 30x hacia http:// filtraría el token en claro.
        // Las 3xx se tratan como error de configuración de la URL.
        followRedirects: false,
      ),
    );

    dio.interceptors.addAll([
      FacturaScriptsAuthInterceptor(config),
      // FIX (Seguridad): LogInterceptor registraba en release las cabeceras
      // (token) y los cuerpos (DNI, firma SVG). Solo en debug y sin ellos.
      if (kDebugMode)
        LogInterceptor(
          // La URI incluye filtros con PII (`filter[cifnif]`): solo errores.
          request: false,
          requestHeader: false,
          requestBody: false,
          responseHeader: false,
          responseBody: false,
          error: true,
        ),
    ]);

    return dio;
  }
}
