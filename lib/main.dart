import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/features/clients/presentation/screens/clients_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // FIX (Arranque): antes `main` esperaba a toda la infraestructura ANTES de
  // `runApp`. La primera vez el Keystore de Android genera claves (~10 s en
  // dispositivos lentos) y el comercial veía una pantalla negra; si algo
  // fallaba (BD corrupta, sin espacio) se quedaba en negro para siempre.
  runApp(const PreventaApp(initialize: AppDependencies.initialize));
}

final _theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0D47A1),
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

/// Raíz de la app: muestra el arranque mientras se inicializa la
/// infraestructura (Isar, almacén seguro, red) y permite reintentar si falla.
class PreventaApp extends StatefulWidget {
  const PreventaApp({
    super.key,
    required this.initialize,
    this.homeBuilder = _defaultHome,
  });

  final Future<AppDependencies> Function() initialize;
  final Widget Function(AppDependencies dependencies) homeBuilder;

  static Widget _defaultHome(AppDependencies dependencies) =>
      ClientsListScreen(dependencies: dependencies);

  @override
  State<PreventaApp> createState() => _PreventaAppState();
}

class _PreventaAppState extends State<PreventaApp> {
  late Future<AppDependencies> _dependencies = widget.initialize();

  void _retry() {
    // Bloque (no flecha): el callback de setState no debe devolver un Future.
    final next = widget.initialize();
    setState(() {
      _dependencies = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preventa y Autoventa ERP',
      debugShowCheckedModeBanner: false,
      theme: _theme,
      home: FutureBuilder<AppDependencies>(
        future: _dependencies,
        // [ECC: Pattern Matching] Estados de arranque exhaustivos. Solo cuenta
        // el resultado del Future ACTUAL: al reintentar, FutureBuilder
        // conserva el error anterior mientras el nuevo está en curso.
        builder: (context, snapshot) => switch (snapshot) {
          AsyncSnapshot(
            connectionState: ConnectionState.done,
            hasData: true,
            :final AppDependencies data,
          ) =>
            widget.homeBuilder(data),
          AsyncSnapshot(
            connectionState: ConnectionState.done,
            hasError: true,
            :final Object error,
          ) =>
            _StartupErrorScreen(error: error, onRetry: _retry),
          _ => const _StartupScreen(),
        },
      ),
    );
  }
}

class _StartupScreen extends StatelessWidget {
  const _StartupScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_shipping_outlined,
                size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text('Preventa ERP', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
            const SizedBox(height: 12),
            Text(
              'Preparando datos locales…',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _StartupErrorScreen extends StatelessWidget {
  const _StartupErrorScreen({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red.shade700),
              const SizedBox(height: 16),
              const Text(
                'No se pudo iniciar la aplicación',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Los pedidos guardados en el dispositivo no se han perdido. '
                'Reintenta; si persiste, contacta con soporte.\n\n$error',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
