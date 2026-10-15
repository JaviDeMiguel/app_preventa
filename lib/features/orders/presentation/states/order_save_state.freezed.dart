// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_save_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderSaveState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OrderSaveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderSaveState()';
  }
}

/// @nodoc
class $OrderSaveStateCopyWith<$Res> {
  $OrderSaveStateCopyWith(OrderSaveState _, $Res Function(OrderSaveState) __);
}

/// Adds pattern-matching-related methods to [OrderSaveState].
extension OrderSaveStatePatterns on OrderSaveState {
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
    TResult Function(OrderSaveInitial value)? initial,
    TResult Function(OrderSaveSubmitting value)? submitting,
    TResult Function(OrderSaveSuccess value)? success,
    TResult Function(OrderSaveFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial() when initial != null:
        return initial(_that);
      case OrderSaveSubmitting() when submitting != null:
        return submitting(_that);
      case OrderSaveSuccess() when success != null:
        return success(_that);
      case OrderSaveFailure() when failure != null:
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
    required TResult Function(OrderSaveInitial value) initial,
    required TResult Function(OrderSaveSubmitting value) submitting,
    required TResult Function(OrderSaveSuccess value) success,
    required TResult Function(OrderSaveFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial():
        return initial(_that);
      case OrderSaveSubmitting():
        return submitting(_that);
      case OrderSaveSuccess():
        return success(_that);
      case OrderSaveFailure():
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
    TResult? Function(OrderSaveInitial value)? initial,
    TResult? Function(OrderSaveSubmitting value)? submitting,
    TResult? Function(OrderSaveSuccess value)? success,
    TResult? Function(OrderSaveFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial() when initial != null:
        return initial(_that);
      case OrderSaveSubmitting() when submitting != null:
        return submitting(_that);
      case OrderSaveSuccess() when success != null:
        return success(_that);
      case OrderSaveFailure() when failure != null:
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
    TResult Function()? initial,
    TResult Function(String statusMessage)? submitting,
    TResult Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult Function(String errorMessage, bool canRetryLocally)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial() when initial != null:
        return initial();
      case OrderSaveSubmitting() when submitting != null:
        return submitting(_that.statusMessage);
      case OrderSaveSuccess() when success != null:
        return success(_that.orderId, _that.queuedTaskId, _that.isOnlineSynced);
      case OrderSaveFailure() when failure != null:
        return failure(_that.errorMessage, _that.canRetryLocally);
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
    required TResult Function() initial,
    required TResult Function(String statusMessage) submitting,
    required TResult Function(
            String orderId, String queuedTaskId, bool isOnlineSynced)
        success,
    required TResult Function(String errorMessage, bool canRetryLocally)
        failure,
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial():
        return initial();
      case OrderSaveSubmitting():
        return submitting(_that.statusMessage);
      case OrderSaveSuccess():
        return success(_that.orderId, _that.queuedTaskId, _that.isOnlineSynced);
      case OrderSaveFailure():
        return failure(_that.errorMessage, _that.canRetryLocally);
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
    TResult? Function()? initial,
    TResult? Function(String statusMessage)? submitting,
    TResult? Function(String orderId, String queuedTaskId, bool isOnlineSynced)?
        success,
    TResult? Function(String errorMessage, bool canRetryLocally)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case OrderSaveInitial() when initial != null:
        return initial();
      case OrderSaveSubmitting() when submitting != null:
        return submitting(_that.statusMessage);
      case OrderSaveSuccess() when success != null:
        return success(_that.orderId, _that.queuedTaskId, _that.isOnlineSynced);
      case OrderSaveFailure() when failure != null:
        return failure(_that.errorMessage, _that.canRetryLocally);
      case _:
        return null;
    }
  }
}

/// @nodoc

class OrderSaveInitial implements OrderSaveState {
  const OrderSaveInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OrderSaveInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderSaveState.initial()';
  }
}

/// @nodoc

class OrderSaveSubmitting implements OrderSaveState {
  const OrderSaveSubmitting(
      {this.statusMessage = 'Persistiendo pedido localmente...'});

  @JsonKey()
  final String statusMessage;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderSaveSubmittingCopyWith<OrderSaveSubmitting> get copyWith =>
      _$OrderSaveSubmittingCopyWithImpl<OrderSaveSubmitting>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderSaveSubmitting &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusMessage);

  @override
  String toString() {
    return 'OrderSaveState.submitting(statusMessage: $statusMessage)';
  }
}

/// @nodoc
abstract mixin class $OrderSaveSubmittingCopyWith<$Res>
    implements $OrderSaveStateCopyWith<$Res> {
  factory $OrderSaveSubmittingCopyWith(
          OrderSaveSubmitting value, $Res Function(OrderSaveSubmitting) _then) =
      _$OrderSaveSubmittingCopyWithImpl;
  @useResult
  $Res call({String statusMessage});
}

/// @nodoc
class _$OrderSaveSubmittingCopyWithImpl<$Res>
    implements $OrderSaveSubmittingCopyWith<$Res> {
  _$OrderSaveSubmittingCopyWithImpl(this._self, this._then);

  final OrderSaveSubmitting _self;
  final $Res Function(OrderSaveSubmitting) _then;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusMessage = null,
  }) {
    return _then(OrderSaveSubmitting(
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OrderSaveSuccess implements OrderSaveState {
  const OrderSaveSuccess(
      {required this.orderId,
      required this.queuedTaskId,
      required this.isOnlineSynced});

  final String orderId;
  final String queuedTaskId;
  final bool isOnlineSynced;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderSaveSuccessCopyWith<OrderSaveSuccess> get copyWith =>
      _$OrderSaveSuccessCopyWithImpl<OrderSaveSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderSaveSuccess &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.queuedTaskId, queuedTaskId) ||
                other.queuedTaskId == queuedTaskId) &&
            (identical(other.isOnlineSynced, isOnlineSynced) ||
                other.isOnlineSynced == isOnlineSynced));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, queuedTaskId, isOnlineSynced);

  @override
  String toString() {
    return 'OrderSaveState.success(orderId: $orderId, queuedTaskId: $queuedTaskId, isOnlineSynced: $isOnlineSynced)';
  }
}

/// @nodoc
abstract mixin class $OrderSaveSuccessCopyWith<$Res>
    implements $OrderSaveStateCopyWith<$Res> {
  factory $OrderSaveSuccessCopyWith(
          OrderSaveSuccess value, $Res Function(OrderSaveSuccess) _then) =
      _$OrderSaveSuccessCopyWithImpl;
  @useResult
  $Res call({String orderId, String queuedTaskId, bool isOnlineSynced});
}

/// @nodoc
class _$OrderSaveSuccessCopyWithImpl<$Res>
    implements $OrderSaveSuccessCopyWith<$Res> {
  _$OrderSaveSuccessCopyWithImpl(this._self, this._then);

  final OrderSaveSuccess _self;
  final $Res Function(OrderSaveSuccess) _then;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
    Object? queuedTaskId = null,
    Object? isOnlineSynced = null,
  }) {
    return _then(OrderSaveSuccess(
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      queuedTaskId: null == queuedTaskId
          ? _self.queuedTaskId
          : queuedTaskId // ignore: cast_nullable_to_non_nullable
              as String,
      isOnlineSynced: null == isOnlineSynced
          ? _self.isOnlineSynced
          : isOnlineSynced // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class OrderSaveFailure implements OrderSaveState {
  const OrderSaveFailure(
      {required this.errorMessage, this.canRetryLocally = true});

  final String errorMessage;
  @JsonKey()
  final bool canRetryLocally;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderSaveFailureCopyWith<OrderSaveFailure> get copyWith =>
      _$OrderSaveFailureCopyWithImpl<OrderSaveFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderSaveFailure &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.canRetryLocally, canRetryLocally) ||
                other.canRetryLocally == canRetryLocally));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, canRetryLocally);

  @override
  String toString() {
    return 'OrderSaveState.failure(errorMessage: $errorMessage, canRetryLocally: $canRetryLocally)';
  }
}

/// @nodoc
abstract mixin class $OrderSaveFailureCopyWith<$Res>
    implements $OrderSaveStateCopyWith<$Res> {
  factory $OrderSaveFailureCopyWith(
          OrderSaveFailure value, $Res Function(OrderSaveFailure) _then) =
      _$OrderSaveFailureCopyWithImpl;
  @useResult
  $Res call({String errorMessage, bool canRetryLocally});
}

/// @nodoc
class _$OrderSaveFailureCopyWithImpl<$Res>
    implements $OrderSaveFailureCopyWith<$Res> {
  _$OrderSaveFailureCopyWithImpl(this._self, this._then);

  final OrderSaveFailure _self;
  final $Res Function(OrderSaveFailure) _then;

  /// Create a copy of OrderSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
    Object? canRetryLocally = null,
  }) {
    return _then(OrderSaveFailure(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      canRetryLocally: null == canRetryLocally
          ? _self.canRetryLocally
          : canRetryLocally // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
