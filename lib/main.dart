import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/features/clients/presentation/screens/clients_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // [ECC: Inyección de Dependencias] Inicializa infraestructura con configuración persistida en Isar
  final dependencies = await AppDependencies.initialize();

  runApp(PreventaApp(dependencies: dependencies));
}

class PreventaApp extends StatelessWidget {
  final AppDependencies dependencies;

  const PreventaApp({
    super.key,
    required this.dependencies,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preventa y Autoventa ERP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: ClientsListScreen(dependencies: dependencies),
    );
  }
}
