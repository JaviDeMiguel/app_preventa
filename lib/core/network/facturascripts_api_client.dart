import 'package:dio/dio.dart';

/// Configuración para la conexión con la API de FacturaScripts v3.
class FacturaScriptsConfig {
  final String baseUrl;
  final String apiToken;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  const FacturaScriptsConfig({
    required this.baseUrl,
    required this.apiToken,
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 15),
  });

  FacturaScriptsConfig copyWith({
    String? baseUrl,
    String? apiToken,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) {
    return FacturaScriptsConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      apiToken: apiToken ?? this.apiToken,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
    );
  }
}

/// Interceptor que inyecta la autenticación obligatoria FS-TOKEN y cabeceras estándar
class FacturaScriptsAuthInterceptor extends Interceptor {
  FacturaScriptsConfig config;

  FacturaScriptsAuthInterceptor(this.config);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['FS-TOKEN'] = config.apiToken;
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
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
        sendTimeout: config.connectTimeout,
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.addAll([
      FacturaScriptsAuthInterceptor(config),
      LogInterceptor(
        requestBody: true,
        responseBody: false,
        error: true,
      ),
    ]);

    return dio;
  }
}
