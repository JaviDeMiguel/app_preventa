import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_save_state.freezed.dart';

/// [ECC: Inmutabilidad absoluta & Estados jerárquicos]
/// Sealed class combinada con @freezed en Dart 3 para forzar exhaustividad
/// obligatoria en vistas y eliminar por completo flags dispersos como "isLoading".
@freezed
sealed class OrderSaveState with _$OrderSaveState {
  const factory OrderSaveState.initial() = OrderSaveInitial;

  const factory OrderSaveState.submitting({
    @Default('Persistiendo pedido localmente...') String statusMessage,
  }) = OrderSaveSubmitting;

  const factory OrderSaveState.success({
    required String orderId,
    required String queuedTaskId,
    required bool isOnlineSynced,
  }) = OrderSaveSuccess;

  const factory OrderSaveState.failure({
    required String errorMessage,
    @Default(true) bool canRetryLocally,
  }) = OrderSaveFailure;
}
