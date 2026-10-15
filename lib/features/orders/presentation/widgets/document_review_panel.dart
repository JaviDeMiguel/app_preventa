import 'package:flutter/material.dart';

import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

/// FEAT (Revisión de documentos): muestra por qué el ERP rechazó un documento
/// y permite reintentarlo o anularlo. Antes un albarán en conflicto reservaba
/// stock de la furgoneta indefinidamente sin forma de resolverlo desde la app.
class DocumentReviewPanel extends StatefulWidget {
  const DocumentReviewPanel({
    super.key,
    required this.syncEngine,
    required this.order,
  });

  final SyncEngine syncEngine;
  final OrderEntity order;

  @override
  State<DocumentReviewPanel> createState() => _DocumentReviewPanelState();
}

class _DocumentReviewPanelState extends State<DocumentReviewPanel> {
  late final Future<({SyncStatus status, String? errorMessage})?> _review =
      switch (widget.order.syncTaskId) {
    final String uuid => widget.syncEngine.taskReview(uuid),
    null => Future.value(),
  };
  bool _busy = false;

  bool get _isAlbaran => widget.order.documentType == DocumentType.albaran;

  Future<void> _retry(String taskUuid) async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final ok = await widget.syncEngine.retryDocument(taskUuid);

    if (!mounted) return;
    navigator.pop();
    messenger.showSnackBar(SnackBar(
      content: Text(ok
          ? 'Documento ${widget.order.localId} reenviado a la cola.'
          : 'El documento ya no está pendiente de revisión.'),
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> _discard(String taskUuid) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('¿Anular ${widget.order.localId}?'),
        content: Text(
          _isAlbaran
              ? 'No se enviará al ERP y se repondrá el stock de la furgoneta. '
                  'Úsalo solo si la mercancía NO se entregó.'
              : 'No se enviará al ERP. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red.shade700),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Anular'),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final ok = await widget.syncEngine.discardDocument(taskUuid);

    if (!mounted) return;
    navigator.pop();
    messenger.showSnackBar(SnackBar(
      content: Text(ok
          ? 'Documento ${widget.order.localId} anulado.'
          : 'No se puede anular: el documento se está enviando o ya está en '
              'el ERP.'),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final taskUuid = widget.order.syncTaskId;
    if (taskUuid == null) return const SizedBox.shrink();

    return FutureBuilder(
      future: _review,
      builder: (context, snapshot) => switch (snapshot.data) {
        (
          status:
              SyncStatus.conflict || SyncStatus.fatalError || SyncStatus.failed,
          :final errorMessage,
        ) =>
          Card(
            color: Colors.orange.shade50,
            margin: const EdgeInsets.only(top: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(Icons.report_problem_outlined,
                          color: Colors.orange.shade900),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Requiere revisión',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(errorMessage ?? 'El ERP no aceptó el documento.'),
                  if (_isAlbaran) ...[
                    const SizedBox(height: 6),
                    Text(
                      'Mientras no se resuelva, sus unidades siguen '
                      'descontadas del stock de la furgoneta.',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _busy ? null : () => _discard(taskUuid),
                          icon: const Icon(Icons.block),
                          label: const Text('Anular'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _busy ? null : () => _retry(taskUuid),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reintentar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
