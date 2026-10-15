import 'package:flutter/material.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/core/widgets/keyed_stream_builder.dart';
import 'package:app_preventa/features/orders/presentation/screens/orders_history_screen.dart';

/// FEAT (Revisión): aviso de documentos rechazados por el ERP. Solo aparece
/// si hay alguno; al pulsarlo abre el historial, donde se reintentan o anulan.
/// Sin él, un albarán en conflicto podía quedar olvidado reservando stock.
class PendingReviewBanner extends StatelessWidget {
  const PendingReviewBanner({super.key, required this.dependencies});

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return KeyedStreamBuilder<int>(
      create: dependencies.syncEngine.watchDocumentsNeedingReview,
      builder: (context, snapshot) => switch (snapshot.data) {
        final int count when count > 0 => Card(
            elevation: 0,
            color: Colors.orange.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.orange.shade300),
            ),
            child: ListTile(
              leading: Icon(
                Icons.report_problem_outlined,
                color: Colors.orange.shade900,
              ),
              title: Text(
                count == 1
                    ? '1 documento requiere revisión'
                    : '$count documentos requieren revisión',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'El ERP no los aceptó. Revisa el motivo y reintenta o anula.',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      OrdersHistoryScreen(dependencies: dependencies),
                ),
              ),
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
