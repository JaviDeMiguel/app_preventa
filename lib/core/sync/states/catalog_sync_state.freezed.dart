// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CatalogSyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String currentStep, double progress)? inProgress,
    TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult Function(String errorMessage, bool canRetry)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogSyncStateCopyWith<$Res> {
  factory $CatalogSyncStateCopyWith(
          CatalogSyncState value, $Res Function(CatalogSyncState) then) =
      _$CatalogSyncStateCopyWithImpl<$Res, CatalogSyncState>;
}

/// @nodoc
class _$CatalogSyncStateCopyWithImpl<$Res, $Val extends CatalogSyncState>
    implements $CatalogSyncStateCopyWith<$Res> {
  _$CatalogSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CatalogSyncIdleImplCopyWith<$Res> {
  factory _$$CatalogSyncIdleImplCopyWith(_$CatalogSyncIdleImpl value,
          $Res Function(_$CatalogSyncIdleImpl) then) =
      __$$CatalogSyncIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CatalogSyncIdleImplCopyWithImpl<$Res>
    extends _$CatalogSyncStateCopyWithImpl<$Res, _$CatalogSyncIdleImpl>
    implements _$$CatalogSyncIdleImplCopyWith<$Res> {
  __$$CatalogSyncIdleImplCopyWithImpl(
      _$CatalogSyncIdleImpl _value, $Res Function(_$CatalogSyncIdleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CatalogSyncIdleImpl implements CatalogSyncIdle {
  const _$CatalogSyncIdleImpl();

  @override
  String toString() {
    return 'CatalogSyncState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CatalogSyncIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) {
    return idle?.call();
  }

  @override
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
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class CatalogSyncIdle implements CatalogSyncState {
  const factory CatalogSyncIdle() = _$CatalogSyncIdleImpl;
}

/// @nodoc
abstract class _$$CatalogSyncInProgressImplCopyWith<$Res> {
  factory _$$CatalogSyncInProgressImplCopyWith(
          _$CatalogSyncInProgressImpl value,
          $Res Function(_$CatalogSyncInProgressImpl) then) =
      __$$CatalogSyncInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentStep, double progress});
}

/// @nodoc
class __$$CatalogSyncInProgressImplCopyWithImpl<$Res>
    extends _$CatalogSyncStateCopyWithImpl<$Res, _$CatalogSyncInProgressImpl>
    implements _$$CatalogSyncInProgressImplCopyWith<$Res> {
  __$$CatalogSyncInProgressImplCopyWithImpl(_$CatalogSyncInProgressImpl _value,
      $Res Function(_$CatalogSyncInProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? progress = null,
  }) {
    return _then(_$CatalogSyncInProgressImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CatalogSyncInProgressImpl implements CatalogSyncInProgress {
  const _$CatalogSyncInProgressImpl(
      {required this.currentStep, required this.progress});

  @override
  final String currentStep;
  @override
  final double progress;

  @override
  String toString() {
    return 'CatalogSyncState.inProgress(currentStep: $currentStep, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogSyncInProgressImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentStep, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogSyncInProgressImplCopyWith<_$CatalogSyncInProgressImpl>
      get copyWith => __$$CatalogSyncInProgressImplCopyWithImpl<
          _$CatalogSyncInProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) {
    return inProgress(currentStep, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) {
    return inProgress?.call(currentStep, progress);
  }

  @override
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
    if (inProgress != null) {
      return inProgress(currentStep, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class CatalogSyncInProgress implements CatalogSyncState {
  const factory CatalogSyncInProgress(
      {required final String currentStep,
      required final double progress}) = _$CatalogSyncInProgressImpl;

  String get currentStep;
  double get progress;
  @JsonKey(ignore: true)
  _$$CatalogSyncInProgressImplCopyWith<_$CatalogSyncInProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CatalogSyncSuccessImplCopyWith<$Res> {
  factory _$$CatalogSyncSuccessImplCopyWith(_$CatalogSyncSuccessImpl value,
          $Res Function(_$CatalogSyncSuccessImpl) then) =
      __$$CatalogSyncSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime completedAt, int clientsUpdated, int productsUpdated});
}

/// @nodoc
class __$$CatalogSyncSuccessImplCopyWithImpl<$Res>
    extends _$CatalogSyncStateCopyWithImpl<$Res, _$CatalogSyncSuccessImpl>
    implements _$$CatalogSyncSuccessImplCopyWith<$Res> {
  __$$CatalogSyncSuccessImplCopyWithImpl(_$CatalogSyncSuccessImpl _value,
      $Res Function(_$CatalogSyncSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedAt = null,
    Object? clientsUpdated = null,
    Object? productsUpdated = null,
  }) {
    return _then(_$CatalogSyncSuccessImpl(
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clientsUpdated: null == clientsUpdated
          ? _value.clientsUpdated
          : clientsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      productsUpdated: null == productsUpdated
          ? _value.productsUpdated
          : productsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CatalogSyncSuccessImpl implements CatalogSyncSuccess {
  const _$CatalogSyncSuccessImpl(
      {required this.completedAt,
      required this.clientsUpdated,
      required this.productsUpdated});

  @override
  final DateTime completedAt;
  @override
  final int clientsUpdated;
  @override
  final int productsUpdated;

  @override
  String toString() {
    return 'CatalogSyncState.success(completedAt: $completedAt, clientsUpdated: $clientsUpdated, productsUpdated: $productsUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogSyncSuccessImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogSyncSuccessImplCopyWith<_$CatalogSyncSuccessImpl> get copyWith =>
      __$$CatalogSyncSuccessImplCopyWithImpl<_$CatalogSyncSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) {
    return success(completedAt, clientsUpdated, productsUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) {
    return success?.call(completedAt, clientsUpdated, productsUpdated);
  }

  @override
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
    if (success != null) {
      return success(completedAt, clientsUpdated, productsUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CatalogSyncSuccess implements CatalogSyncState {
  const factory CatalogSyncSuccess(
      {required final DateTime completedAt,
      required final int clientsUpdated,
      required final int productsUpdated}) = _$CatalogSyncSuccessImpl;

  DateTime get completedAt;
  int get clientsUpdated;
  int get productsUpdated;
  @JsonKey(ignore: true)
  _$$CatalogSyncSuccessImplCopyWith<_$CatalogSyncSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CatalogSyncFailureImplCopyWith<$Res> {
  factory _$$CatalogSyncFailureImplCopyWith(_$CatalogSyncFailureImpl value,
          $Res Function(_$CatalogSyncFailureImpl) then) =
      __$$CatalogSyncFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage, bool canRetry});
}

/// @nodoc
class __$$CatalogSyncFailureImplCopyWithImpl<$Res>
    extends _$CatalogSyncStateCopyWithImpl<$Res, _$CatalogSyncFailureImpl>
    implements _$$CatalogSyncFailureImplCopyWith<$Res> {
  __$$CatalogSyncFailureImplCopyWithImpl(_$CatalogSyncFailureImpl _value,
      $Res Function(_$CatalogSyncFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? canRetry = null,
  }) {
    return _then(_$CatalogSyncFailureImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canRetry: null == canRetry
          ? _value.canRetry
          : canRetry // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CatalogSyncFailureImpl implements CatalogSyncFailure {
  const _$CatalogSyncFailureImpl(
      {required this.errorMessage, this.canRetry = true});

  @override
  final String errorMessage;
  @override
  @JsonKey()
  final bool canRetry;

  @override
  String toString() {
    return 'CatalogSyncState.failure(errorMessage: $errorMessage, canRetry: $canRetry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogSyncFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.canRetry, canRetry) ||
                other.canRetry == canRetry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, canRetry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogSyncFailureImplCopyWith<_$CatalogSyncFailureImpl> get copyWith =>
      __$$CatalogSyncFailureImplCopyWithImpl<_$CatalogSyncFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String currentStep, double progress) inProgress,
    required TResult Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)
        success,
    required TResult Function(String errorMessage, bool canRetry) failure,
  }) {
    return failure(errorMessage, canRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String currentStep, double progress)? inProgress,
    TResult? Function(
            DateTime completedAt, int clientsUpdated, int productsUpdated)?
        success,
    TResult? Function(String errorMessage, bool canRetry)? failure,
  }) {
    return failure?.call(errorMessage, canRetry);
  }

  @override
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
    if (failure != null) {
      return failure(errorMessage, canRetry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatalogSyncIdle value) idle,
    required TResult Function(CatalogSyncInProgress value) inProgress,
    required TResult Function(CatalogSyncSuccess value) success,
    required TResult Function(CatalogSyncFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CatalogSyncIdle value)? idle,
    TResult? Function(CatalogSyncInProgress value)? inProgress,
    TResult? Function(CatalogSyncSuccess value)? success,
    TResult? Function(CatalogSyncFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatalogSyncIdle value)? idle,
    TResult Function(CatalogSyncInProgress value)? inProgress,
    TResult Function(CatalogSyncSuccess value)? success,
    TResult Function(CatalogSyncFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class CatalogSyncFailure implements CatalogSyncState {
  const factory CatalogSyncFailure(
      {required final String errorMessage,
      final bool canRetry}) = _$CatalogSyncFailureImpl;

  String get errorMessage;
  bool get canRetry;
  @JsonKey(ignore: true)
  _$$CatalogSyncFailureImplCopyWith<_$CatalogSyncFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
