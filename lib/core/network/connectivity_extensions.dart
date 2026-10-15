import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityResultsX on List<ConnectivityResult> {
  /// FIX: `!contains(none)` devolvía `true` para una lista vacía.
  /// Hay red solo si existe al menos una interfaz distinta de `none`.
  bool get hasNetwork => any((result) => result != ConnectivityResult.none);
}
