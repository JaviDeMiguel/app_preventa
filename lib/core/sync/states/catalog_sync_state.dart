import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_sync_state.freezed.dart';

/// [ECC: Inmutabilidad absoluta & Estados jerárquicos]
/// Sealed class para el proceso de sincronización descendente (Downstream Sync).
@freezed
sealed class CatalogSyncState with _$CatalogSyncState {
  const factory CatalogSyncState.idle() = CatalogSyncIdle;

  const factory CatalogSyncState.inProgress({
    required String currentStep,
    required double progress,
  }) = CatalogSyncInProgress;

  const factory CatalogSyncState.success({
    required DateTime completedAt,
    required int clientsUpdated,
    required int productsUpdated,
  }) = CatalogSyncSuccess;

  const factory CatalogSyncState.failure({
    required String errorMessage,
    @Default(true) bool canRetry,
  }) = CatalogSyncFailure;
}
