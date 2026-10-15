import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_preventa/core/di/service_locator.dart';
import 'package:app_preventa/main.dart';

void main() {
  testWidgets('muestra el arranque mientras se inicializa (no pantalla negra)',
      (tester) async {
    final pending = Completer<AppDependencies>();

    await tester.pumpWidget(PreventaApp(initialize: () => pending.future));

    expect(find.text('Preventa ERP'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'si la inicialización falla muestra el error y permite reintentar',
      (tester) async {
    var attempts = 0;
    final secondAttempt = Completer<AppDependencies>();

    await tester.pumpWidget(PreventaApp(
      initialize: () {
        attempts++;
        return attempts == 1
            ? Future.error(StateError('Isar: base de datos corrupta'))
            : secondAttempt.future;
      },
    ));
    await tester.pump();

    expect(find.text('No se pudo iniciar la aplicación'), findsOneWidget);
    expect(find.textContaining('base de datos corrupta'), findsOneWidget);

    await tester.tap(find.text('Reintentar'));
    await tester.pump();

    expect(attempts, 2);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
