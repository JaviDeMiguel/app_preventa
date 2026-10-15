import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/clients/presentation/screens/client_detail_screen.dart';

/// Formulario para dar de alta nuevos clientes en ruta sin conexión (Offline-First)
class NewClientScreen extends StatefulWidget {
  final AppDependencies dependencies;

  const NewClientScreen({
    super.key,
    required this.dependencies,
  });

  @override
  State<NewClientScreen> createState() => _NewClientScreenState();
}

class _NewClientScreenState extends State<NewClientScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _cifController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ciudadController = TextEditingController();
  final _cpController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _cifController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _direccionController.dispose();
    _ciudadController.dispose();
    _cpController.dispose();
    super.dispose();
  }

  Future<void> _handleSaveClient() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    try {
      // El motor bloquea los pedidos de este cliente hasta reconciliar el código.
      final tempCode =
          '$tempClientCodePrefix${DateTime.now().millisecondsSinceEpoch}';
      final syncTaskUuid = 'TASK-CLI-${DateTime.now().microsecondsSinceEpoch}';

      final clientEntity = ClientEntity()
        ..codcliente = tempCode
        ..nombre = _nombreController.text.trim()
        ..cifnif = _cifController.text.trim().toUpperCase()
        ..telefono = _telefonoController.text.trim()
        ..email = _emailController.text.trim()
        ..direccion = _direccionController.text.trim()
        ..ciudad = _ciudadController.text.trim()
        ..codpostal = _cpController.text.trim()
        ..updatedAt = DateTime.now();

      final syncTaskEntity = SyncTaskCollection()
        ..uuid = syncTaskUuid
        ..endpoint = ErpResource.clientes.createPath
        ..method = HttpMethod.post
        // FIX (Contrato API): solo campos de `Cliente`; la dirección pertenece
        // al modelo `Contacto` y se conserva en local. El código temporal va
        // en una clave local (`_…`) que nunca se envía al ERP.
        ..payloadJson = jsonEncode(
          buildClientPayload(
            tempCode: tempCode,
            nombre: clientEntity.nombre,
            cifnif: clientEntity.cifnif,
            telefono: clientEntity.telefono,
            email: clientEntity.email,
          ),
        )
        ..retries = 0
        ..maxRetries = defaultTaskMaxRetries
        ..status = SyncStatus.pending
        ..createdAt = DateTime.now();

      await widget.dependencies.isar.writeTxn(() async {
        await widget.dependencies.isar.clientEntitys.put(clientEntity);
        await widget.dependencies.isar.syncTaskCollections.put(syncTaskEntity);
      });

      // Disparar sincronización oportunista
      unawaited(widget.dependencies.syncEngine.processUpstreamQueue());

      // [ECC: Seguridad de Contexto]
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Cliente ${clientEntity.nombre} registrado localmente (en cola ERP).',
          ),
          backgroundColor: Colors.green.shade800,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Reemplazar la vista actual abriendo directamente la ficha del nuevo cliente
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ClientDetailScreen(
            client: clientEntity,
            dependencies: widget.dependencies,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar cliente localmente: $e'),
          backgroundColor: Colors.red.shade800,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Cliente (En Ruta)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Datos del Prospecto / Cliente',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'El cliente se guardará de forma inmediata en la base de datos local y se encolará para su alta en FacturaScripts v3.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Comercial / Razón Social *',
                  prefixIcon: Icon(Icons.business_outlined),
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.words,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Introduce el nombre o razón social';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _cifController,
                decoration: const InputDecoration(
                  labelText: 'CIF / NIF / DNI *',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.characters,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Introduce el CIF o NIF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _telefonoController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(
                  labelText: 'Dirección Comercial',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _ciudadController,
                      decoration: const InputDecoration(
                        labelText: 'Población / Ciudad',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _cpController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'C. Postal',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              FilledButton.icon(
                onPressed: _isSaving ? null : _handleSaveClient,
                icon: _isSaving
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save),
                label: Text(
                  _isSaving
                      ? 'Registrando en local...'
                      : 'Guardar y Abrir Ficha',
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
