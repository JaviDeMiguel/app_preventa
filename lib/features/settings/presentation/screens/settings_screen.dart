import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/network/facturascripts_api_client.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// Pantalla de configuración del servidor ERP FacturaScripts v3 y diagnóstico de conexión
class SettingsScreen extends StatefulWidget {
  final AppDependencies dependencies;

  const SettingsScreen({
    super.key,
    required this.dependencies,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _urlController;
  late final TextEditingController _tokenController;

  bool _obscureToken = true;
  bool _isTesting = false;
  bool _isSaving = false;
  String? _testResult;
  bool _testSuccess = false;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
    _tokenController = TextEditingController();
    _loadCurrentConfig();
  }

  @override
  void dispose() {
    _urlController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  Future<void> _loadCurrentConfig() async {
    final config = await widget.dependencies.settingsRepository.loadConfig();
    if (!mounted) return;
    setState(() {
      _urlController.text = config.baseUrl;
      _tokenController.text = config.apiToken;
    });
  }

  Future<void> _handleTestConnection() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isTesting = true;
      _testResult = null;
    });

    final (success, message) =
        await widget.dependencies.settingsRepository.testConnection(
      baseUrl: _urlController.text,
      apiToken: _tokenController.text,
    );

    if (!mounted) return;

    setState(() {
      _isTesting = false;
      _testSuccess = success;
      _testResult = message;
    });
  }

  Future<void> _handleSaveConfig() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    final newConfig = FacturaScriptsConfig(
      baseUrl: _urlController.text.trim().replaceAll(RegExp(r'/+$'), ''),
      apiToken: _tokenController.text.trim(),
    );

    await widget.dependencies.settingsRepository.saveConfig(newConfig);
    widget.dependencies.updateApiConfig(newConfig);

    if (!mounted) return;

    setState(() {
      _isSaving = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Configuración guardada y aplicada correctamente.'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración ERP'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Conexión FacturaScripts v3',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Indica la URL base de tu instalación de FacturaScripts y el token de acceso API para la sincronización.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _urlController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: 'URL del Servidor',
                  hintText: 'https://facturascripts.miempresa.com',
                  prefixIcon: Icon(Icons.dns_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Introduce la URL del servidor';
                  }
                  if (!val.startsWith('http://') &&
                      !val.startsWith('https://')) {
                    return 'Debe comenzar por http:// o https://';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tokenController,
                obscureText: _obscureToken,
                decoration: InputDecoration(
                  labelText: 'FS-TOKEN (API Key)',
                  hintText: 'Ej: 9f8a7b6c5d4e...',
                  prefixIcon: const Icon(Icons.key_outlined),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureToken
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() => _obscureToken = !_obscureToken);
                    },
                  ),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Introduce el FS-TOKEN';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              if (_testResult != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _testSuccess
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _testSuccess
                          ? Colors.green.shade300
                          : Colors.red.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _testSuccess ? Icons.check_circle : Icons.error_outline,
                        color: _testSuccess
                            ? Colors.green.shade700
                            : Colors.red.shade700,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _testResult!,
                          style: TextStyle(
                            color: _testSuccess
                                ? Colors.green.shade900
                                : Colors.red.shade900,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _isTesting ? null : _handleTestConnection,
                      icon: _isTesting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.network_check),
                      label: const Text('Probar Conexión'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _isSaving ? null : _handleSaveConfig,
                      icon: const Icon(Icons.save),
                      label: const Text('Guardar'),
                    ),
                  ),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Almacenamiento Local (Isar)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              FutureBuilder<(int clients, int products, int orders)>(
                future: _countLocalRecords(),
                builder: (context, snapshot) {
                  final (clients, products, orders) =
                      snapshot.data ?? (0, 0, 0);

                  return Card(
                    elevation: 0,
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _buildStatRow('Clientes en caché:', '$clients'),
                          const Divider(),
                          _buildStatRow('Artículos en catálogo:', '$products'),
                          const Divider(),
                          _buildStatRow('Pedidos registrados:', '$orders'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<(int, int, int)> _countLocalRecords() async {
    final clients = await widget.dependencies.isar.clientEntitys.count();
    final products = await widget.dependencies.isar.productEntitys.count();
    final orders = await widget.dependencies.isar.orderEntitys.count();
    return (clients, products, orders);
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
