// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogSyncState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CatalogSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CatalogSyncState()';
  }
}

/// @nodoc
class $CatalogSyncStateCopyWith<$Res> {
  $CatalogSyncStateCopyWith(
      CatalogSyncState _, $Res Function(CatalogSyncState) __);
}

/// Adds pattern-matching-related methods to [CatalogSyncState].
extension CatalogSyncStatePatterns on CatalogSyncState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle() when idle != null:
        return idle(_that);
      case CatalogSyncInProgress() when inProgress != null:
        return inProgress(_that);
      case CatalogSyncSuccess() when success != null:
        return success(_that);
      case CatalogSyncFailure() when failure != null:
        return failure(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle():
        return idle(_that);
      case CatalogSyncInProgress():
        return inProgress(_that);
      case CatalogSyncSuccess():
        return success(_that);
      case CatalogSyncFailure():
        return failure(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle() when idle != null:
        return idle(_that);
      case CatalogSyncInProgress() when inProgress != null:
        return inProgress(_that);
      case CatalogSyncSuccess() when success != null:
        return success(_that);
      case CatalogSyncFailure() when failure != null:
        return failure(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String currentStep, double progress)? inProgress,
    TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult Function(String errorMessage, bool canRetry)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle() when idle != null:
        return idle();
      case CatalogSyncInProgress() when inProgress != null:
        return inProgress(_that.currentStep, _that.progress);
      case CatalogSyncSuccess() when success != null:
        return success(
            _that.completedAt, _that.clientsUpdated, _that.productsUpdated);
      case CatalogSyncFailure() when failure != null:
        return failure(_that.errorMessage, _that.canRetry);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle():
        return idle();
      case CatalogSyncInProgress():
        return inProgress(_that.currentStep, _that.progress);
      case CatalogSyncSuccess():
        return success(
            _that.completedAt, _that.clientsUpdated, _that.productsUpdated);
      case CatalogSyncFailure():
        return failure(_that.errorMessage, _that.canRetry);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case CatalogSyncIdle() when idle != null:
        return idle();
      case CatalogSyncInProgress() when inProgress != null:
        return inProgress(_that.currentStep, _that.progress);
      case CatalogSyncSuccess() when success != null:
        return success(
            _that.completedAt, _that.clientsUpdated, _that.productsUpdated);
      case CatalogSyncFailure() when failure != null:
        return failure(_that.errorMessage, _that.canRetry);
      case _:
        return null;
    }
  }
}

/// @nodoc

class CatalogSyncIdle implements CatalogSyncState {
  const CatalogSyncIdle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CatalogSyncIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CatalogSyncState.idle()';
  }
}

/// @nodoc

class CatalogSyncInProgress implements CatalogSyncState {
  const CatalogSyncInProgress(
      {required this.currentStep, required this.progress});

  final String currentStep;
  final double progress;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CatalogSyncInProgressCopyWith<CatalogSyncInProgress> get copyWith =>
      _$CatalogSyncInProgressCopyWithImpl<CatalogSyncInProgress>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CatalogSyncInProgress &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, progress);

  @override
  String toString() {
    return 'CatalogSyncState.inProgress(currentStep: $currentStep, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $CatalogSyncInProgressCopyWith<$Res>
    implements $CatalogSyncStateCopyWith<$Res> {
  factory $CatalogSyncInProgressCopyWith(CatalogSyncInProgress value,
          $Res Function(CatalogSyncInProgress) _then) =
      _$CatalogSyncInProgressCopyWithImpl;
  @useResult
  $Res call({String currentStep, double progress});
}

/// @nodoc
class _$CatalogSyncInProgressCopyWithImpl<$Res>
    implements $CatalogSyncInProgressCopyWith<$Res> {
  _$CatalogSyncInProgressCopyWithImpl(this._self, this._then);

  final CatalogSyncInProgress _self;
  final $Res Function(CatalogSyncInProgress) _then;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentStep = null,
    Object? progress = null,
  }) {
    return _then(CatalogSyncInProgress(
      currentStep: null == currentStep
          ? _self.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class CatalogSyncSuccess implements CatalogSyncState {
  const CatalogSyncSuccess(
      {required this.completedAt,
      required this.clientsUpdated,
      required this.productsUpdated});

  final DateTime completedAt;
  final int clientsUpdated;
  final int productsUpdated;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CatalogSyncSuccessCopyWith<CatalogSyncSuccess> get copyWith =>
      _$CatalogSyncSuccessCopyWithImpl<CatalogSyncSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CatalogSyncSuccess &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.clientsUpdated, clientsUpdated) ||
                other.clientsUpdated == clientsUpdated) &&
            (identical(other.productsUpdated, productsUpdated) ||
                other.productsUpdated == productsUpdated));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, completedAt, clientsUpdated, productsUpdated);

  @override
  String toString() {
    return 'CatalogSyncState.success(completedAt: $completedAt, clientsUpdated: $clientsUpdated, productsUpdated: $productsUpdated)';
  }
}

/// @nodoc
abstract mixin class $CatalogSyncSuccessCopyWith<$Res>
    implements $CatalogSyncStateCopyWith<$Res> {
  factory $CatalogSyncSuccessCopyWith(
          CatalogSyncSuccess value, $Res Function(CatalogSyncSuccess) _then) =
      _$CatalogSyncSuccessCopyWithImpl;
  @useResult
  $Res call({DateTime completedAt, int clientsUpdated, int productsUpdated});
}

/// @nodoc
class _$CatalogSyncSuccessCopyWithImpl<$Res>
    implements $CatalogSyncSuccessCopyWith<$Res> {
  _$CatalogSyncSuccessCopyWithImpl(this._self, this._then);

  final CatalogSyncSuccess _self;
  final $Res Function(CatalogSyncSuccess) _then;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? completedAt = null,
    Object? clientsUpdated = null,
    Object? productsUpdated = null,
  }) {
    return _then(CatalogSyncSuccess(
      completedAt: null == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clientsUpdated: null == clientsUpdated
          ? _self.clientsUpdated
          : clientsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      productsUpdated: null == productsUpdated
          ? _self.productsUpdated
          : productsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CatalogSyncFailure implements CatalogSyncState {
  const CatalogSyncFailure({required this.errorMessage, this.canRetry = true});

  final String errorMessage;
  @JsonKey()
  final bool canRetry;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CatalogSyncFailureCopyWith<CatalogSyncFailure> get copyWith =>
      _$CatalogSyncFailureCopyWithImpl<CatalogSyncFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CatalogSyncFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.canRetry, canRetry) ||
                other.canRetry == canRetry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, canRetry);

  @override
  String toString() {
    return 'CatalogSyncState.failure(errorMessage: $errorMessage, canRetry: $canRetry)';
  }
}

/// @nodoc
abstract mixin class $CatalogSyncFailureCopyWith<$Res>
    implements $CatalogSyncStateCopyWith<$Res> {
  factory $CatalogSyncFailureCopyWith(
          CatalogSyncFailure value, $Res Function(CatalogSyncFailure) _then) =
      _$CatalogSyncFailureCopyWithImpl;
  @useResult
  $Res call({String errorMessage, bool canRetry});
}

/// @nodoc
class _$CatalogSyncFailureCopyWithImpl<$Res>
    implements $CatalogSyncFailureCopyWith<$Res> {
  _$CatalogSyncFailureCopyWithImpl(this._self, this._then);

  final CatalogSyncFailure _self;
  final $Res Function(CatalogSyncFailure) _then;

  /// Create a copy of CatalogSyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
    Object? canRetry = null,
  }) {
    return _then(CatalogSyncFailure(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canRetry: null == canRetry
          ? _self.canRetry
          : canRetry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
