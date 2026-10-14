// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_save_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderSaveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSaveStateCopyWith<$Res> {
  factory $OrderSaveStateCopyWith(
          OrderSaveState value, $Res Function(OrderSaveState) then) =
      _$OrderSaveStateCopyWithImpl<$Res, OrderSaveState>;
}

/// @nodoc
class _$OrderSaveStateCopyWithImpl<$Res, $Val extends OrderSaveState>
    implements $OrderSaveStateCopyWith<$Res> {
  _$OrderSaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$OrderSaveInitialImplCopyWith<$Res> {
  factory _$$OrderSaveInitialImplCopyWith(_$OrderSaveInitialImpl value,
          $Res Function(_$OrderSaveInitialImpl) then) =
      __$$OrderSaveInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderSaveInitialImplCopyWithImpl<$Res>
    extends _$OrderSaveStateCopyWithImpl<$Res, _$OrderSaveInitialImpl>
    implements _$$OrderSaveInitialImplCopyWith<$Res> {
  __$$OrderSaveInitialImplCopyWithImpl(_$OrderSaveInitialImpl _value,
      $Res Function(_$OrderSaveInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OrderSaveInitialImpl implements OrderSaveInitial {
  const _$OrderSaveInitialImpl();

  @override
  String toString() {
    return 'OrderSaveState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderSaveInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OrderSaveInitial implements OrderSaveState {
  const factory OrderSaveInitial() = _$OrderSaveInitialImpl;
}

/// @nodoc
abstract class _$$OrderSaveSubmittingImplCopyWith<$Res> {
  factory _$$OrderSaveSubmittingImplCopyWith(_$OrderSaveSubmittingImpl value,
          $Res Function(_$OrderSaveSubmittingImpl) then) =
      __$$OrderSaveSubmittingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String statusMessage});
}

/// @nodoc
class __$$OrderSaveSubmittingImplCopyWithImpl<$Res>
    extends _$OrderSaveStateCopyWithImpl<$Res, _$OrderSaveSubmittingImpl>
    implements _$$OrderSaveSubmittingImplCopyWith<$Res> {
  __$$OrderSaveSubmittingImplCopyWithImpl(_$OrderSaveSubmittingImpl _value,
      $Res Function(_$OrderSaveSubmittingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusMessage = null,
  }) {
    return _then(_$OrderSaveSubmittingImpl(
      statusMessage: null == statusMessage
          ? _value.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderSaveSubmittingImpl implements OrderSaveSubmitting {
  const _$OrderSaveSubmittingImpl(
      {this.statusMessage = 'Persistiendo pedido localmente...'});

  @override
  @JsonKey()
  final String statusMessage;

  @override
  String toString() {
    return 'OrderSaveState.submitting(statusMessage: $statusMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSaveSubmittingImpl &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSaveSubmittingImplCopyWith<_$OrderSaveSubmittingImpl> get copyWith =>
      __$$OrderSaveSubmittingImplCopyWithImpl<_$OrderSaveSubmittingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) {
    return submitting(statusMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) {
    return submitting?.call(statusMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(statusMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class OrderSaveSubmitting implements OrderSaveState {
  const factory OrderSaveSubmitting({final String statusMessage}) =
      _$OrderSaveSubmittingImpl;

  String get statusMessage;
  @JsonKey(ignore: true)
  _$$OrderSaveSubmittingImplCopyWith<_$OrderSaveSubmittingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderSaveSuccessImplCopyWith<$Res> {
  factory _$$OrderSaveSuccessImplCopyWith(_$OrderSaveSuccessImpl value,
          $Res Function(_$OrderSaveSuccessImpl) then) =
      __$$OrderSaveSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, String queuedTaskId, bool isOnlineSynced});
}

/// @nodoc
class __$$OrderSaveSuccessImplCopyWithImpl<$Res>
    extends _$OrderSaveStateCopyWithImpl<$Res, _$OrderSaveSuccessImpl>
    implements _$$OrderSaveSuccessImplCopyWith<$Res> {
  __$$OrderSaveSuccessImplCopyWithImpl(_$OrderSaveSuccessImpl _value,
      $Res Function(_$OrderSaveSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? queuedTaskId = null,
    Object? isOnlineSynced = null,
  }) {
    return _then(_$OrderSaveSuccessImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      queuedTaskId: null == queuedTaskId
          ? _value.queuedTaskId
          : queuedTaskId // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlineSynced: null == isOnlineSynced
          ? _value.isOnlineSynced
          : isOnlineSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderSaveSuccessImpl implements OrderSaveSuccess {
  const _$OrderSaveSuccessImpl(
      {required this.orderId,
      required this.queuedTaskId,
      required this.isOnlineSynced});

  @override
  final String orderId;
  @override
  final String queuedTaskId;
  @override
  final bool isOnlineSynced;

  @override
  String toString() {
    return 'OrderSaveState.success(orderId: $orderId, queuedTaskId: $queuedTaskId, isOnlineSynced: $isOnlineSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSaveSuccessImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.queuedTaskId, queuedTaskId) ||
                other.queuedTaskId == queuedTaskId) &&
            (identical(other.isOnlineSynced, isOnlineSynced) ||
                other.isOnlineSynced == isOnlineSynced));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, queuedTaskId, isOnlineSynced);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSaveSuccessImplCopyWith<_$OrderSaveSuccessImpl> get copyWith =>
      __$$OrderSaveSuccessImplCopyWithImpl<_$OrderSaveSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) {
    return success(orderId, queuedTaskId, isOnlineSynced);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) {
    return success?.call(orderId, queuedTaskId, isOnlineSynced);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(orderId, queuedTaskId, isOnlineSynced);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OrderSaveSuccess implements OrderSaveState {
  const factory OrderSaveSuccess(
      {required final String orderId,
      required final String queuedTaskId,
      required final bool isOnlineSynced}) = _$OrderSaveSuccessImpl;

  String get orderId;
  String get queuedTaskId;
  bool get isOnlineSynced;
  @JsonKey(ignore: true)
  _$$OrderSaveSuccessImplCopyWith<_$OrderSaveSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderSaveFailureImplCopyWith<$Res> {
  factory _$$OrderSaveFailureImplCopyWith(_$OrderSaveFailureImpl value,
          $Res Function(_$OrderSaveFailureImpl) then) =
      __$$OrderSaveFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage, bool canRetryLocally});
}

/// @nodoc
class __$$OrderSaveFailureImplCopyWithImpl<$Res>
    extends _$OrderSaveStateCopyWithImpl<$Res, _$OrderSaveFailureImpl>
    implements _$$OrderSaveFailureImplCopyWith<$Res> {
  __$$OrderSaveFailureImplCopyWithImpl(_$OrderSaveFailureImpl _value,
      $Res Function(_$OrderSaveFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? canRetryLocally = null,
  }) {
    return _then(_$OrderSaveFailureImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canRetryLocally: null == canRetryLocally
          ? _value.canRetryLocally
          : canRetryLocally // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrderSaveFailureImpl implements OrderSaveFailure {
  const _$OrderSaveFailureImpl(
      {required this.errorMessage, this.canRetryLocally = true});

  @override
  final String errorMessage;
  @override
  @JsonKey()
  final bool canRetryLocally;

  @override
  String toString() {
    return 'OrderSaveState.failure(errorMessage: $errorMessage, canRetryLocally: $canRetryLocally)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSaveFailureImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.canRetryLocally, canRetryLocally) ||
                other.canRetryLocally == canRetryLocally));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, canRetryLocally);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSaveFailureImplCopyWith<_$OrderSaveFailureImpl> get copyWith =>
      __$$OrderSaveFailureImplCopyWithImpl<_$OrderSaveFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) {
    return failure(errorMessage, canRetryLocally);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) {
    return failure?.call(errorMessage, canRetryLocally);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage, canRetryLocally);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class OrderSaveFailure implements OrderSaveState {
  const factory OrderSaveFailure(
      {required final String errorMessage,
      final bool canRetryLocally}) = _$OrderSaveFailureImpl;

  String get errorMessage;
  bool get canRetryLocally;
  @JsonKey(ignore: true)
  _$$OrderSaveFailureImplCopyWith<_$OrderSaveFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
