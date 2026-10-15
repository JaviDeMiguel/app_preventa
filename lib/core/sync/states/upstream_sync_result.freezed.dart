// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upstream_sync_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DispatchOutcome {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DispatchOutcome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DispatchOutcome()';
  }
}

/// @nodoc
class $DispatchOutcomeCopyWith<$Res> {
  $DispatchOutcomeCopyWith(
      DispatchOutcome _, $Res Function(DispatchOutcome) __);
}

/// Adds pattern-matching-related methods to [DispatchOutcome].
extension DispatchOutcomePatterns on DispatchOutcome {
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
    TResult Function(DispatchDelivered value)? delivered,
    TResult Function(DispatchUnreachable value)? unreachable,
    TResult Function(DispatchTransient value)? transient,
    TResult Function(DispatchUnauthorized value)? unauthorized,
    TResult Function(DispatchConflict value)? conflict,
    TResult Function(DispatchRejected value)? rejected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered() when delivered != null:
        return delivered(_that);
      case DispatchUnreachable() when unreachable != null:
        return unreachable(_that);
      case DispatchTransient() when transient != null:
        return transient(_that);
      case DispatchUnauthorized() when unauthorized != null:
        return unauthorized(_that);
      case DispatchConflict() when conflict != null:
        return conflict(_that);
      case DispatchRejected() when rejected != null:
        return rejected(_that);
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
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered():
        return delivered(_that);
      case DispatchUnreachable():
        return unreachable(_that);
      case DispatchTransient():
        return transient(_that);
      case DispatchUnauthorized():
        return unauthorized(_that);
      case DispatchConflict():
        return conflict(_that);
      case DispatchRejected():
        return rejected(_that);
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
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered() when delivered != null:
        return delivered(_that);
      case DispatchUnreachable() when unreachable != null:
        return unreachable(_that);
      case DispatchTransient() when transient != null:
        return transient(_that);
      case DispatchUnauthorized() when unauthorized != null:
        return unauthorized(_that);
      case DispatchConflict() when conflict != null:
        return conflict(_that);
      case DispatchRejected() when rejected != null:
        return rejected(_that);
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
    TResult Function(String? erpId, Map<String, Object?> record)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered() when delivered != null:
        return delivered(_that.erpId, _that.record);
      case DispatchUnreachable() when unreachable != null:
        return unreachable(_that.message, _that.ambiguous);
      case DispatchTransient() when transient != null:
        return transient(_that.message, _that.ambiguous, _that.retryAfter);
      case DispatchUnauthorized() when unauthorized != null:
        return unauthorized(_that.message);
      case DispatchConflict() when conflict != null:
        return conflict(_that.message);
      case DispatchRejected() when rejected != null:
        return rejected(_that.message);
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
    required TResult Function(String? erpId, Map<String, Object?> record)
        delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered():
        return delivered(_that.erpId, _that.record);
      case DispatchUnreachable():
        return unreachable(_that.message, _that.ambiguous);
      case DispatchTransient():
        return transient(_that.message, _that.ambiguous, _that.retryAfter);
      case DispatchUnauthorized():
        return unauthorized(_that.message);
      case DispatchConflict():
        return conflict(_that.message);
      case DispatchRejected():
        return rejected(_that.message);
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
    TResult? Function(String? erpId, Map<String, Object?> record)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    final _that = this;
    switch (_that) {
      case DispatchDelivered() when delivered != null:
        return delivered(_that.erpId, _that.record);
      case DispatchUnreachable() when unreachable != null:
        return unreachable(_that.message, _that.ambiguous);
      case DispatchTransient() when transient != null:
        return transient(_that.message, _that.ambiguous, _that.retryAfter);
      case DispatchUnauthorized() when unauthorized != null:
        return unauthorized(_that.message);
      case DispatchConflict() when conflict != null:
        return conflict(_that.message);
      case DispatchRejected() when rejected != null:
        return rejected(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DispatchDelivered implements DispatchOutcome {
  const DispatchDelivered(
      {this.erpId,
      final Map<String, Object?> record = const <String, Object?>{}})
      : _record = record;

  final String? erpId;
  final Map<String, Object?> _record;
  @JsonKey()
  Map<String, Object?> get record {
    if (_record is EqualUnmodifiableMapView) return _record;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_record);
  }

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchDeliveredCopyWith<DispatchDelivered> get copyWith =>
      _$DispatchDeliveredCopyWithImpl<DispatchDelivered>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchDelivered &&
            (identical(other.erpId, erpId) || other.erpId == erpId) &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, erpId, const DeepCollectionEquality().hash(_record));

  @override
  String toString() {
    return 'DispatchOutcome.delivered(erpId: $erpId, record: $record)';
  }
}

/// @nodoc
abstract mixin class $DispatchDeliveredCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchDeliveredCopyWith(
          DispatchDelivered value, $Res Function(DispatchDelivered) _then) =
      _$DispatchDeliveredCopyWithImpl;
  @useResult
  $Res call({String? erpId, Map<String, Object?> record});
}

/// @nodoc
class _$DispatchDeliveredCopyWithImpl<$Res>
    implements $DispatchDeliveredCopyWith<$Res> {
  _$DispatchDeliveredCopyWithImpl(this._self, this._then);

  final DispatchDelivered _self;
  final $Res Function(DispatchDelivered) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? erpId = freezed,
    Object? record = null,
  }) {
    return _then(DispatchDelivered(
      erpId: freezed == erpId
          ? _self.erpId
          : erpId // ignore: cast_nullable_to_non_nullable
              as String?,
      record: null == record
          ? _self._record
          : record // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
    ));
  }
}

/// @nodoc

class DispatchUnreachable implements DispatchOutcome {
  const DispatchUnreachable({required this.message, this.ambiguous = false});

  final String message;
  @JsonKey()
  final bool ambiguous;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchUnreachableCopyWith<DispatchUnreachable> get copyWith =>
      _$DispatchUnreachableCopyWithImpl<DispatchUnreachable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchUnreachable &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ambiguous, ambiguous) ||
                other.ambiguous == ambiguous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, ambiguous);

  @override
  String toString() {
    return 'DispatchOutcome.unreachable(message: $message, ambiguous: $ambiguous)';
  }
}

/// @nodoc
abstract mixin class $DispatchUnreachableCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchUnreachableCopyWith(
          DispatchUnreachable value, $Res Function(DispatchUnreachable) _then) =
      _$DispatchUnreachableCopyWithImpl;
  @useResult
  $Res call({String message, bool ambiguous});
}

/// @nodoc
class _$DispatchUnreachableCopyWithImpl<$Res>
    implements $DispatchUnreachableCopyWith<$Res> {
  _$DispatchUnreachableCopyWithImpl(this._self, this._then);

  final DispatchUnreachable _self;
  final $Res Function(DispatchUnreachable) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? ambiguous = null,
  }) {
    return _then(DispatchUnreachable(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ambiguous: null == ambiguous
          ? _self.ambiguous
          : ambiguous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class DispatchTransient implements DispatchOutcome {
  const DispatchTransient(
      {required this.message, required this.ambiguous, this.retryAfter});

  final String message;
  final bool ambiguous;
  final Duration? retryAfter;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchTransientCopyWith<DispatchTransient> get copyWith =>
      _$DispatchTransientCopyWithImpl<DispatchTransient>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchTransient &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ambiguous, ambiguous) ||
                other.ambiguous == ambiguous) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, ambiguous, retryAfter);

  @override
  String toString() {
    return 'DispatchOutcome.transient(message: $message, ambiguous: $ambiguous, retryAfter: $retryAfter)';
  }
}

/// @nodoc
abstract mixin class $DispatchTransientCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchTransientCopyWith(
          DispatchTransient value, $Res Function(DispatchTransient) _then) =
      _$DispatchTransientCopyWithImpl;
  @useResult
  $Res call({String message, bool ambiguous, Duration? retryAfter});
}

/// @nodoc
class _$DispatchTransientCopyWithImpl<$Res>
    implements $DispatchTransientCopyWith<$Res> {
  _$DispatchTransientCopyWithImpl(this._self, this._then);

  final DispatchTransient _self;
  final $Res Function(DispatchTransient) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? ambiguous = null,
    Object? retryAfter = freezed,
  }) {
    return _then(DispatchTransient(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ambiguous: null == ambiguous
          ? _self.ambiguous
          : ambiguous // ignore: cast_nullable_to_non_nullable
              as bool,
      retryAfter: freezed == retryAfter
          ? _self.retryAfter
          : retryAfter // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class DispatchUnauthorized implements DispatchOutcome {
  const DispatchUnauthorized({required this.message});

  final String message;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchUnauthorizedCopyWith<DispatchUnauthorized> get copyWith =>
      _$DispatchUnauthorizedCopyWithImpl<DispatchUnauthorized>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchUnauthorized &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DispatchOutcome.unauthorized(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DispatchUnauthorizedCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchUnauthorizedCopyWith(DispatchUnauthorized value,
          $Res Function(DispatchUnauthorized) _then) =
      _$DispatchUnauthorizedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DispatchUnauthorizedCopyWithImpl<$Res>
    implements $DispatchUnauthorizedCopyWith<$Res> {
  _$DispatchUnauthorizedCopyWithImpl(this._self, this._then);

  final DispatchUnauthorized _self;
  final $Res Function(DispatchUnauthorized) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DispatchUnauthorized(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DispatchConflict implements DispatchOutcome {
  const DispatchConflict({required this.message});

  final String message;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchConflictCopyWith<DispatchConflict> get copyWith =>
      _$DispatchConflictCopyWithImpl<DispatchConflict>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchConflict &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DispatchOutcome.conflict(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DispatchConflictCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchConflictCopyWith(
          DispatchConflict value, $Res Function(DispatchConflict) _then) =
      _$DispatchConflictCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DispatchConflictCopyWithImpl<$Res>
    implements $DispatchConflictCopyWith<$Res> {
  _$DispatchConflictCopyWithImpl(this._self, this._then);

  final DispatchConflict _self;
  final $Res Function(DispatchConflict) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DispatchConflict(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DispatchRejected implements DispatchOutcome {
  const DispatchRejected({required this.message});

  final String message;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DispatchRejectedCopyWith<DispatchRejected> get copyWith =>
      _$DispatchRejectedCopyWithImpl<DispatchRejected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DispatchRejected &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DispatchOutcome.rejected(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DispatchRejectedCopyWith<$Res>
    implements $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchRejectedCopyWith(
          DispatchRejected value, $Res Function(DispatchRejected) _then) =
      _$DispatchRejectedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DispatchRejectedCopyWithImpl<$Res>
    implements $DispatchRejectedCopyWith<$Res> {
  _$DispatchRejectedCopyWithImpl(this._self, this._then);

  final DispatchRejected _self;
  final $Res Function(DispatchRejected) _then;

  /// Create a copy of DispatchOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DispatchRejected(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TaskStep {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TaskStep);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TaskStep()';
  }
}

/// @nodoc
class $TaskStepCopyWith<$Res> {
  $TaskStepCopyWith(TaskStep _, $Res Function(TaskStep) __);
}

/// Adds pattern-matching-related methods to [TaskStep].
extension TaskStepPatterns on TaskStep {
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
    TResult Function(TaskSkipped value)? skipped,
    TResult Function(TaskDeferred value)? deferred,
    TResult Function(TaskAttempted value)? attempted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped() when skipped != null:
        return skipped(_that);
      case TaskDeferred() when deferred != null:
        return deferred(_that);
      case TaskAttempted() when attempted != null:
        return attempted(_that);
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
    required TResult Function(TaskSkipped value) skipped,
    required TResult Function(TaskDeferred value) deferred,
    required TResult Function(TaskAttempted value) attempted,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped():
        return skipped(_that);
      case TaskDeferred():
        return deferred(_that);
      case TaskAttempted():
        return attempted(_that);
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
    TResult? Function(TaskSkipped value)? skipped,
    TResult? Function(TaskDeferred value)? deferred,
    TResult? Function(TaskAttempted value)? attempted,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped() when skipped != null:
        return skipped(_that);
      case TaskDeferred() when deferred != null:
        return deferred(_that);
      case TaskAttempted() when attempted != null:
        return attempted(_that);
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
    TResult Function()? skipped,
    TResult Function(String reason)? deferred,
    TResult Function(DispatchOutcome outcome)? attempted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped() when skipped != null:
        return skipped();
      case TaskDeferred() when deferred != null:
        return deferred(_that.reason);
      case TaskAttempted() when attempted != null:
        return attempted(_that.outcome);
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
    required TResult Function() skipped,
    required TResult Function(String reason) deferred,
    required TResult Function(DispatchOutcome outcome) attempted,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped():
        return skipped();
      case TaskDeferred():
        return deferred(_that.reason);
      case TaskAttempted():
        return attempted(_that.outcome);
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
    TResult? Function()? skipped,
    TResult? Function(String reason)? deferred,
    TResult? Function(DispatchOutcome outcome)? attempted,
  }) {
    final _that = this;
    switch (_that) {
      case TaskSkipped() when skipped != null:
        return skipped();
      case TaskDeferred() when deferred != null:
        return deferred(_that.reason);
      case TaskAttempted() when attempted != null:
        return attempted(_that.outcome);
      case _:
        return null;
    }
  }
}

/// @nodoc

class TaskSkipped implements TaskStep {
  const TaskSkipped();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TaskSkipped);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TaskStep.skipped()';
  }
}

/// @nodoc

class TaskDeferred implements TaskStep {
  const TaskDeferred({required this.reason});

  final String reason;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskDeferredCopyWith<TaskDeferred> get copyWith =>
      _$TaskDeferredCopyWithImpl<TaskDeferred>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskDeferred &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'TaskStep.deferred(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $TaskDeferredCopyWith<$Res>
    implements $TaskStepCopyWith<$Res> {
  factory $TaskDeferredCopyWith(
          TaskDeferred value, $Res Function(TaskDeferred) _then) =
      _$TaskDeferredCopyWithImpl;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$TaskDeferredCopyWithImpl<$Res> implements $TaskDeferredCopyWith<$Res> {
  _$TaskDeferredCopyWithImpl(this._self, this._then);

  final TaskDeferred _self;
  final $Res Function(TaskDeferred) _then;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
  }) {
    return _then(TaskDeferred(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TaskAttempted implements TaskStep {
  const TaskAttempted(this.outcome);

  final DispatchOutcome outcome;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskAttemptedCopyWith<TaskAttempted> get copyWith =>
      _$TaskAttemptedCopyWithImpl<TaskAttempted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskAttempted &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outcome);

  @override
  String toString() {
    return 'TaskStep.attempted(outcome: $outcome)';
  }
}

/// @nodoc
abstract mixin class $TaskAttemptedCopyWith<$Res>
    implements $TaskStepCopyWith<$Res> {
  factory $TaskAttemptedCopyWith(
          TaskAttempted value, $Res Function(TaskAttempted) _then) =
      _$TaskAttemptedCopyWithImpl;
  @useResult
  $Res call({DispatchOutcome outcome});

  $DispatchOutcomeCopyWith<$Res> get outcome;
}

/// @nodoc
class _$TaskAttemptedCopyWithImpl<$Res>
    implements $TaskAttemptedCopyWith<$Res> {
  _$TaskAttemptedCopyWithImpl(this._self, this._then);

  final TaskAttempted _self;
  final $Res Function(TaskAttempted) _then;

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? outcome = null,
  }) {
    return _then(TaskAttempted(
      null == outcome
          ? _self.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as DispatchOutcome,
    ));
  }

  /// Create a copy of TaskStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DispatchOutcomeCopyWith<$Res> get outcome {
    return $DispatchOutcomeCopyWith<$Res>(_self.outcome, (value) {
      return _then(_self.copyWith(outcome: value));
    });
  }
}

/// @nodoc
mixin _$UpstreamRunStats {
  int get delivered;
  int get rescheduled;
  int get deferred;
  int get conflicts;
  int get rejected;

  /// Create a copy of UpstreamRunStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpstreamRunStatsCopyWith<UpstreamRunStats> get copyWith =>
      _$UpstreamRunStatsCopyWithImpl<UpstreamRunStats>(
          this as UpstreamRunStats, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpstreamRunStats &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.deferred, deferred) ||
                other.deferred == deferred) &&
            (identical(other.conflicts, conflicts) ||
                other.conflicts == conflicts) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, delivered, rescheduled, deferred, conflicts, rejected);

  @override
  String toString() {
    return 'UpstreamRunStats(delivered: $delivered, rescheduled: $rescheduled, deferred: $deferred, conflicts: $conflicts, rejected: $rejected)';
  }
}

/// @nodoc
abstract mixin class $UpstreamRunStatsCopyWith<$Res> {
  factory $UpstreamRunStatsCopyWith(
          UpstreamRunStats value, $Res Function(UpstreamRunStats) _then) =
      _$UpstreamRunStatsCopyWithImpl;
  @useResult
  $Res call(
      {int delivered,
      int rescheduled,
      int deferred,
      int conflicts,
      int rejected});
}

/// @nodoc
class _$UpstreamRunStatsCopyWithImpl<$Res>
    implements $UpstreamRunStatsCopyWith<$Res> {
  _$UpstreamRunStatsCopyWithImpl(this._self, this._then);

  final UpstreamRunStats _self;
  final $Res Function(UpstreamRunStats) _then;

  /// Create a copy of UpstreamRunStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivered = null,
    Object? rescheduled = null,
    Object? deferred = null,
    Object? conflicts = null,
    Object? rejected = null,
  }) {
    return _then(_self.copyWith(
      delivered: null == delivered
          ? _self.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      rescheduled: null == rescheduled
          ? _self.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as int,
      deferred: null == deferred
          ? _self.deferred
          : deferred // ignore: cast_nullable_to_non_nullable
              as int,
      conflicts: null == conflicts
          ? _self.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      rejected: null == rejected
          ? _self.rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpstreamRunStats].
extension UpstreamRunStatsPatterns on UpstreamRunStats {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpstreamRunStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_UpstreamRunStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpstreamRunStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int delivered, int rescheduled, int deferred,
            int conflicts, int rejected)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats() when $default != null:
        return $default(_that.delivered, _that.rescheduled, _that.deferred,
            _that.conflicts, _that.rejected);
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
  TResult when<TResult extends Object?>(
    TResult Function(int delivered, int rescheduled, int deferred,
            int conflicts, int rejected)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats():
        return $default(_that.delivered, _that.rescheduled, _that.deferred,
            _that.conflicts, _that.rejected);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int delivered, int rescheduled, int deferred,
            int conflicts, int rejected)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpstreamRunStats() when $default != null:
        return $default(_that.delivered, _that.rescheduled, _that.deferred,
            _that.conflicts, _that.rejected);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpstreamRunStats extends UpstreamRunStats {
  const _UpstreamRunStats(
      {this.delivered = 0,
      this.rescheduled = 0,
      this.deferred = 0,
      this.conflicts = 0,
      this.rejected = 0})
      : super._();

  @override
  @JsonKey()
  final int delivered;
  @override
  @JsonKey()
  final int rescheduled;
  @override
  @JsonKey()
  final int deferred;
  @override
  @JsonKey()
  final int conflicts;
  @override
  @JsonKey()
  final int rejected;

  /// Create a copy of UpstreamRunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpstreamRunStatsCopyWith<_UpstreamRunStats> get copyWith =>
      __$UpstreamRunStatsCopyWithImpl<_UpstreamRunStats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpstreamRunStats &&
            (identical(other.delivered, delivered) ||
                other.delivered == delivered) &&
            (identical(other.rescheduled, rescheduled) ||
                other.rescheduled == rescheduled) &&
            (identical(other.deferred, deferred) ||
                other.deferred == deferred) &&
            (identical(other.conflicts, conflicts) ||
                other.conflicts == conflicts) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, delivered, rescheduled, deferred, conflicts, rejected);

  @override
  String toString() {
    return 'UpstreamRunStats(delivered: $delivered, rescheduled: $rescheduled, deferred: $deferred, conflicts: $conflicts, rejected: $rejected)';
  }
}

/// @nodoc
abstract mixin class _$UpstreamRunStatsCopyWith<$Res>
    implements $UpstreamRunStatsCopyWith<$Res> {
  factory _$UpstreamRunStatsCopyWith(
          _UpstreamRunStats value, $Res Function(_UpstreamRunStats) _then) =
      __$UpstreamRunStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int delivered,
      int rescheduled,
      int deferred,
      int conflicts,
      int rejected});
}

/// @nodoc
class __$UpstreamRunStatsCopyWithImpl<$Res>
    implements _$UpstreamRunStatsCopyWith<$Res> {
  __$UpstreamRunStatsCopyWithImpl(this._self, this._then);

  final _UpstreamRunStats _self;
  final $Res Function(_UpstreamRunStats) _then;

  /// Create a copy of UpstreamRunStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? delivered = null,
    Object? rescheduled = null,
    Object? deferred = null,
    Object? conflicts = null,
    Object? rejected = null,
  }) {
    return _then(_UpstreamRunStats(
      delivered: null == delivered
          ? _self.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      rescheduled: null == rescheduled
          ? _self.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as int,
      deferred: null == deferred
          ? _self.deferred
          : deferred // ignore: cast_nullable_to_non_nullable
              as int,
      conflicts: null == conflicts
          ? _self.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      rejected: null == rejected
          ? _self.rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$UpstreamRunResult {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpstreamRunResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpstreamRunResult()';
  }
}

/// @nodoc
class $UpstreamRunResultCopyWith<$Res> {
  $UpstreamRunResultCopyWith(
      UpstreamRunResult _, $Res Function(UpstreamRunResult) __);
}

/// Adds pattern-matching-related methods to [UpstreamRunResult].
extension UpstreamRunResultPatterns on UpstreamRunResult {
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
    TResult Function(UpstreamOffline value)? offline,
    TResult Function(UpstreamCompleted value)? completed,
    TResult Function(UpstreamHalted value)? halted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline() when offline != null:
        return offline(_that);
      case UpstreamCompleted() when completed != null:
        return completed(_that);
      case UpstreamHalted() when halted != null:
        return halted(_that);
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
    required TResult Function(UpstreamOffline value) offline,
    required TResult Function(UpstreamCompleted value) completed,
    required TResult Function(UpstreamHalted value) halted,
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline():
        return offline(_that);
      case UpstreamCompleted():
        return completed(_that);
      case UpstreamHalted():
        return halted(_that);
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
    TResult? Function(UpstreamOffline value)? offline,
    TResult? Function(UpstreamCompleted value)? completed,
    TResult? Function(UpstreamHalted value)? halted,
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline() when offline != null:
        return offline(_that);
      case UpstreamCompleted() when completed != null:
        return completed(_that);
      case UpstreamHalted() when halted != null:
        return halted(_that);
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
    TResult Function()? offline,
    TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline() when offline != null:
        return offline();
      case UpstreamCompleted() when completed != null:
        return completed(_that.stats, _that.nextDueAt);
      case UpstreamHalted() when halted != null:
        return halted(
            _that.reason, _that.message, _that.stats, _that.nextDueAt);
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
    required TResult Function() offline,
    required TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)
        completed,
    required TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)
        halted,
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline():
        return offline();
      case UpstreamCompleted():
        return completed(_that.stats, _that.nextDueAt);
      case UpstreamHalted():
        return halted(
            _that.reason, _that.message, _that.stats, _that.nextDueAt);
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
    TResult? Function()? offline,
    TResult? Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult? Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
  }) {
    final _that = this;
    switch (_that) {
      case UpstreamOffline() when offline != null:
        return offline();
      case UpstreamCompleted() when completed != null:
        return completed(_that.stats, _that.nextDueAt);
      case UpstreamHalted() when halted != null:
        return halted(
            _that.reason, _that.message, _that.stats, _that.nextDueAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class UpstreamOffline implements UpstreamRunResult {
  const UpstreamOffline();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpstreamOffline);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UpstreamRunResult.offline()';
  }
}

/// @nodoc

class UpstreamCompleted implements UpstreamRunResult {
  const UpstreamCompleted({required this.stats, this.nextDueAt});

  final UpstreamRunStats stats;
  final DateTime? nextDueAt;

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpstreamCompletedCopyWith<UpstreamCompleted> get copyWith =>
      _$UpstreamCompletedCopyWithImpl<UpstreamCompleted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpstreamCompleted &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.nextDueAt, nextDueAt) ||
                other.nextDueAt == nextDueAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stats, nextDueAt);

  @override
  String toString() {
    return 'UpstreamRunResult.completed(stats: $stats, nextDueAt: $nextDueAt)';
  }
}

/// @nodoc
abstract mixin class $UpstreamCompletedCopyWith<$Res>
    implements $UpstreamRunResultCopyWith<$Res> {
  factory $UpstreamCompletedCopyWith(
          UpstreamCompleted value, $Res Function(UpstreamCompleted) _then) =
      _$UpstreamCompletedCopyWithImpl;
  @useResult
  $Res call({UpstreamRunStats stats, DateTime? nextDueAt});

  $UpstreamRunStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$UpstreamCompletedCopyWithImpl<$Res>
    implements $UpstreamCompletedCopyWith<$Res> {
  _$UpstreamCompletedCopyWithImpl(this._self, this._then);

  final UpstreamCompleted _self;
  final $Res Function(UpstreamCompleted) _then;

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stats = null,
    Object? nextDueAt = freezed,
  }) {
    return _then(UpstreamCompleted(
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UpstreamRunStats,
      nextDueAt: freezed == nextDueAt
          ? _self.nextDueAt
          : nextDueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpstreamRunStatsCopyWith<$Res> get stats {
    return $UpstreamRunStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// @nodoc

class UpstreamHalted implements UpstreamRunResult {
  const UpstreamHalted(
      {required this.reason,
      required this.message,
      required this.stats,
      this.nextDueAt});

  final UpstreamHaltReason reason;
  final String message;
  final UpstreamRunStats stats;
  final DateTime? nextDueAt;

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpstreamHaltedCopyWith<UpstreamHalted> get copyWith =>
      _$UpstreamHaltedCopyWithImpl<UpstreamHalted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpstreamHalted &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.nextDueAt, nextDueAt) ||
                other.nextDueAt == nextDueAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reason, message, stats, nextDueAt);

  @override
  String toString() {
    return 'UpstreamRunResult.halted(reason: $reason, message: $message, stats: $stats, nextDueAt: $nextDueAt)';
  }
}

/// @nodoc
abstract mixin class $UpstreamHaltedCopyWith<$Res>
    implements $UpstreamRunResultCopyWith<$Res> {
  factory $UpstreamHaltedCopyWith(
          UpstreamHalted value, $Res Function(UpstreamHalted) _then) =
      _$UpstreamHaltedCopyWithImpl;
  @useResult
  $Res call(
      {UpstreamHaltReason reason,
      String message,
      UpstreamRunStats stats,
      DateTime? nextDueAt});

  $UpstreamRunStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$UpstreamHaltedCopyWithImpl<$Res>
    implements $UpstreamHaltedCopyWith<$Res> {
  _$UpstreamHaltedCopyWithImpl(this._self, this._then);

  final UpstreamHalted _self;
  final $Res Function(UpstreamHalted) _then;

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
    Object? message = null,
    Object? stats = null,
    Object? nextDueAt = freezed,
  }) {
    return _then(UpstreamHalted(
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as UpstreamHaltReason,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UpstreamRunStats,
      nextDueAt: freezed == nextDueAt
          ? _self.nextDueAt
          : nextDueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UpstreamRunResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpstreamRunStatsCopyWith<$Res> get stats {
    return $UpstreamRunStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

// dart format on
