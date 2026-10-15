// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upstream_sync_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DispatchOutcome {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DispatchDelivered value)? delivered,
    TResult Function(DispatchUnreachable value)? unreachable,
    TResult Function(DispatchTransient value)? transient,
    TResult Function(DispatchUnauthorized value)? unauthorized,
    TResult Function(DispatchConflict value)? conflict,
    TResult Function(DispatchRejected value)? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DispatchOutcomeCopyWith<$Res> {
  factory $DispatchOutcomeCopyWith(
          DispatchOutcome value, $Res Function(DispatchOutcome) then) =
      _$DispatchOutcomeCopyWithImpl<$Res, DispatchOutcome>;
}

/// @nodoc
class _$DispatchOutcomeCopyWithImpl<$Res, $Val extends DispatchOutcome>
    implements $DispatchOutcomeCopyWith<$Res> {
  _$DispatchOutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DispatchDeliveredImplCopyWith<$Res> {
  factory _$$DispatchDeliveredImplCopyWith(_$DispatchDeliveredImpl value,
          $Res Function(_$DispatchDeliveredImpl) then) =
      __$$DispatchDeliveredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? erpId});
}

/// @nodoc
class __$$DispatchDeliveredImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchDeliveredImpl>
    implements _$$DispatchDeliveredImplCopyWith<$Res> {
  __$$DispatchDeliveredImplCopyWithImpl(_$DispatchDeliveredImpl _value,
      $Res Function(_$DispatchDeliveredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? erpId = freezed,
  }) {
    return _then(_$DispatchDeliveredImpl(
      erpId: freezed == erpId
          ? _value.erpId
          : erpId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DispatchDeliveredImpl implements DispatchDelivered {
  const _$DispatchDeliveredImpl({this.erpId});

  @override
  final String? erpId;

  @override
  String toString() {
    return 'DispatchOutcome.delivered(erpId: $erpId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchDeliveredImpl &&
            (identical(other.erpId, erpId) || other.erpId == erpId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, erpId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchDeliveredImplCopyWith<_$DispatchDeliveredImpl> get copyWith =>
      __$$DispatchDeliveredImplCopyWithImpl<_$DispatchDeliveredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return delivered(erpId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return delivered?.call(erpId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(erpId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return delivered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return delivered?.call(this);
  }

  @override
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
    if (delivered != null) {
      return delivered(this);
    }
    return orElse();
  }
}

abstract class DispatchDelivered implements DispatchOutcome {
  const factory DispatchDelivered({final String? erpId}) =
      _$DispatchDeliveredImpl;

  String? get erpId;
  @JsonKey(ignore: true)
  _$$DispatchDeliveredImplCopyWith<_$DispatchDeliveredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DispatchUnreachableImplCopyWith<$Res> {
  factory _$$DispatchUnreachableImplCopyWith(_$DispatchUnreachableImpl value,
          $Res Function(_$DispatchUnreachableImpl) then) =
      __$$DispatchUnreachableImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, bool ambiguous});
}

/// @nodoc
class __$$DispatchUnreachableImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchUnreachableImpl>
    implements _$$DispatchUnreachableImplCopyWith<$Res> {
  __$$DispatchUnreachableImplCopyWithImpl(_$DispatchUnreachableImpl _value,
      $Res Function(_$DispatchUnreachableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? ambiguous = null,
  }) {
    return _then(_$DispatchUnreachableImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ambiguous: null == ambiguous
          ? _value.ambiguous
          : ambiguous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DispatchUnreachableImpl implements DispatchUnreachable {
  const _$DispatchUnreachableImpl(
      {required this.message, this.ambiguous = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool ambiguous;

  @override
  String toString() {
    return 'DispatchOutcome.unreachable(message: $message, ambiguous: $ambiguous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchUnreachableImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ambiguous, ambiguous) ||
                other.ambiguous == ambiguous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, ambiguous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchUnreachableImplCopyWith<_$DispatchUnreachableImpl> get copyWith =>
      __$$DispatchUnreachableImplCopyWithImpl<_$DispatchUnreachableImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return unreachable(message, ambiguous);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return unreachable?.call(message, ambiguous);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (unreachable != null) {
      return unreachable(message, ambiguous);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return unreachable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return unreachable?.call(this);
  }

  @override
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
    if (unreachable != null) {
      return unreachable(this);
    }
    return orElse();
  }
}

abstract class DispatchUnreachable implements DispatchOutcome {
  const factory DispatchUnreachable(
      {required final String message,
      final bool ambiguous}) = _$DispatchUnreachableImpl;

  String get message;
  bool get ambiguous;
  @JsonKey(ignore: true)
  _$$DispatchUnreachableImplCopyWith<_$DispatchUnreachableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DispatchTransientImplCopyWith<$Res> {
  factory _$$DispatchTransientImplCopyWith(_$DispatchTransientImpl value,
          $Res Function(_$DispatchTransientImpl) then) =
      __$$DispatchTransientImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, bool ambiguous, Duration? retryAfter});
}

/// @nodoc
class __$$DispatchTransientImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchTransientImpl>
    implements _$$DispatchTransientImplCopyWith<$Res> {
  __$$DispatchTransientImplCopyWithImpl(_$DispatchTransientImpl _value,
      $Res Function(_$DispatchTransientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? ambiguous = null,
    Object? retryAfter = freezed,
  }) {
    return _then(_$DispatchTransientImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ambiguous: null == ambiguous
          ? _value.ambiguous
          : ambiguous // ignore: cast_nullable_to_non_nullable
              as bool,
      retryAfter: freezed == retryAfter
          ? _value.retryAfter
          : retryAfter // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$DispatchTransientImpl implements DispatchTransient {
  const _$DispatchTransientImpl(
      {required this.message, required this.ambiguous, this.retryAfter});

  @override
  final String message;
  @override
  final bool ambiguous;
  @override
  final Duration? retryAfter;

  @override
  String toString() {
    return 'DispatchOutcome.transient(message: $message, ambiguous: $ambiguous, retryAfter: $retryAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchTransientImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ambiguous, ambiguous) ||
                other.ambiguous == ambiguous) &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, ambiguous, retryAfter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchTransientImplCopyWith<_$DispatchTransientImpl> get copyWith =>
      __$$DispatchTransientImplCopyWithImpl<_$DispatchTransientImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return transient(message, ambiguous, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return transient?.call(message, ambiguous, retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (transient != null) {
      return transient(message, ambiguous, retryAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return transient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return transient?.call(this);
  }

  @override
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
    if (transient != null) {
      return transient(this);
    }
    return orElse();
  }
}

abstract class DispatchTransient implements DispatchOutcome {
  const factory DispatchTransient(
      {required final String message,
      required final bool ambiguous,
      final Duration? retryAfter}) = _$DispatchTransientImpl;

  String get message;
  bool get ambiguous;
  Duration? get retryAfter;
  @JsonKey(ignore: true)
  _$$DispatchTransientImplCopyWith<_$DispatchTransientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DispatchUnauthorizedImplCopyWith<$Res> {
  factory _$$DispatchUnauthorizedImplCopyWith(_$DispatchUnauthorizedImpl value,
          $Res Function(_$DispatchUnauthorizedImpl) then) =
      __$$DispatchUnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DispatchUnauthorizedImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchUnauthorizedImpl>
    implements _$$DispatchUnauthorizedImplCopyWith<$Res> {
  __$$DispatchUnauthorizedImplCopyWithImpl(_$DispatchUnauthorizedImpl _value,
      $Res Function(_$DispatchUnauthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DispatchUnauthorizedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DispatchUnauthorizedImpl implements DispatchUnauthorized {
  const _$DispatchUnauthorizedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DispatchOutcome.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchUnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchUnauthorizedImplCopyWith<_$DispatchUnauthorizedImpl>
      get copyWith =>
          __$$DispatchUnauthorizedImplCopyWithImpl<_$DispatchUnauthorizedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return unauthorized?.call(this);
  }

  @override
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
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class DispatchUnauthorized implements DispatchOutcome {
  const factory DispatchUnauthorized({required final String message}) =
      _$DispatchUnauthorizedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DispatchUnauthorizedImplCopyWith<_$DispatchUnauthorizedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DispatchConflictImplCopyWith<$Res> {
  factory _$$DispatchConflictImplCopyWith(_$DispatchConflictImpl value,
          $Res Function(_$DispatchConflictImpl) then) =
      __$$DispatchConflictImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DispatchConflictImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchConflictImpl>
    implements _$$DispatchConflictImplCopyWith<$Res> {
  __$$DispatchConflictImplCopyWithImpl(_$DispatchConflictImpl _value,
      $Res Function(_$DispatchConflictImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DispatchConflictImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DispatchConflictImpl implements DispatchConflict {
  const _$DispatchConflictImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DispatchOutcome.conflict(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchConflictImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchConflictImplCopyWith<_$DispatchConflictImpl> get copyWith =>
      __$$DispatchConflictImplCopyWithImpl<_$DispatchConflictImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return conflict(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return conflict?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return conflict?.call(this);
  }

  @override
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
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class DispatchConflict implements DispatchOutcome {
  const factory DispatchConflict({required final String message}) =
      _$DispatchConflictImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DispatchConflictImplCopyWith<_$DispatchConflictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DispatchRejectedImplCopyWith<$Res> {
  factory _$$DispatchRejectedImplCopyWith(_$DispatchRejectedImpl value,
          $Res Function(_$DispatchRejectedImpl) then) =
      __$$DispatchRejectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DispatchRejectedImplCopyWithImpl<$Res>
    extends _$DispatchOutcomeCopyWithImpl<$Res, _$DispatchRejectedImpl>
    implements _$$DispatchRejectedImplCopyWith<$Res> {
  __$$DispatchRejectedImplCopyWithImpl(_$DispatchRejectedImpl _value,
      $Res Function(_$DispatchRejectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DispatchRejectedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DispatchRejectedImpl implements DispatchRejected {
  const _$DispatchRejectedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DispatchOutcome.rejected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DispatchRejectedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DispatchRejectedImplCopyWith<_$DispatchRejectedImpl> get copyWith =>
      __$$DispatchRejectedImplCopyWithImpl<_$DispatchRejectedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? erpId) delivered,
    required TResult Function(String message, bool ambiguous) unreachable,
    required TResult Function(
            String message, bool ambiguous, Duration? retryAfter)
        transient,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) conflict,
    required TResult Function(String message) rejected,
  }) {
    return rejected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? erpId)? delivered,
    TResult? Function(String message, bool ambiguous)? unreachable,
    TResult? Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? rejected,
  }) {
    return rejected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? erpId)? delivered,
    TResult Function(String message, bool ambiguous)? unreachable,
    TResult Function(String message, bool ambiguous, Duration? retryAfter)?
        transient,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? conflict,
    TResult Function(String message)? rejected,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DispatchDelivered value) delivered,
    required TResult Function(DispatchUnreachable value) unreachable,
    required TResult Function(DispatchTransient value) transient,
    required TResult Function(DispatchUnauthorized value) unauthorized,
    required TResult Function(DispatchConflict value) conflict,
    required TResult Function(DispatchRejected value) rejected,
  }) {
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DispatchDelivered value)? delivered,
    TResult? Function(DispatchUnreachable value)? unreachable,
    TResult? Function(DispatchTransient value)? transient,
    TResult? Function(DispatchUnauthorized value)? unauthorized,
    TResult? Function(DispatchConflict value)? conflict,
    TResult? Function(DispatchRejected value)? rejected,
  }) {
    return rejected?.call(this);
  }

  @override
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
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class DispatchRejected implements DispatchOutcome {
  const factory DispatchRejected({required final String message}) =
      _$DispatchRejectedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DispatchRejectedImplCopyWith<_$DispatchRejectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskStep {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skipped,
    required TResult Function(String reason) deferred,
    required TResult Function(DispatchOutcome outcome) attempted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? skipped,
    TResult? Function(String reason)? deferred,
    TResult? Function(DispatchOutcome outcome)? attempted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skipped,
    TResult Function(String reason)? deferred,
    TResult Function(DispatchOutcome outcome)? attempted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskSkipped value) skipped,
    required TResult Function(TaskDeferred value) deferred,
    required TResult Function(TaskAttempted value) attempted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskSkipped value)? skipped,
    TResult? Function(TaskDeferred value)? deferred,
    TResult? Function(TaskAttempted value)? attempted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskSkipped value)? skipped,
    TResult Function(TaskDeferred value)? deferred,
    TResult Function(TaskAttempted value)? attempted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStepCopyWith<$Res> {
  factory $TaskStepCopyWith(TaskStep value, $Res Function(TaskStep) then) =
      _$TaskStepCopyWithImpl<$Res, TaskStep>;
}

/// @nodoc
class _$TaskStepCopyWithImpl<$Res, $Val extends TaskStep>
    implements $TaskStepCopyWith<$Res> {
  _$TaskStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TaskSkippedImplCopyWith<$Res> {
  factory _$$TaskSkippedImplCopyWith(
          _$TaskSkippedImpl value, $Res Function(_$TaskSkippedImpl) then) =
      __$$TaskSkippedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskSkippedImplCopyWithImpl<$Res>
    extends _$TaskStepCopyWithImpl<$Res, _$TaskSkippedImpl>
    implements _$$TaskSkippedImplCopyWith<$Res> {
  __$$TaskSkippedImplCopyWithImpl(
      _$TaskSkippedImpl _value, $Res Function(_$TaskSkippedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TaskSkippedImpl implements TaskSkipped {
  const _$TaskSkippedImpl();

  @override
  String toString() {
    return 'TaskStep.skipped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskSkippedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skipped,
    required TResult Function(String reason) deferred,
    required TResult Function(DispatchOutcome outcome) attempted,
  }) {
    return skipped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? skipped,
    TResult? Function(String reason)? deferred,
    TResult? Function(DispatchOutcome outcome)? attempted,
  }) {
    return skipped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skipped,
    TResult Function(String reason)? deferred,
    TResult Function(DispatchOutcome outcome)? attempted,
    required TResult orElse(),
  }) {
    if (skipped != null) {
      return skipped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskSkipped value) skipped,
    required TResult Function(TaskDeferred value) deferred,
    required TResult Function(TaskAttempted value) attempted,
  }) {
    return skipped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskSkipped value)? skipped,
    TResult? Function(TaskDeferred value)? deferred,
    TResult? Function(TaskAttempted value)? attempted,
  }) {
    return skipped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskSkipped value)? skipped,
    TResult Function(TaskDeferred value)? deferred,
    TResult Function(TaskAttempted value)? attempted,
    required TResult orElse(),
  }) {
    if (skipped != null) {
      return skipped(this);
    }
    return orElse();
  }
}

abstract class TaskSkipped implements TaskStep {
  const factory TaskSkipped() = _$TaskSkippedImpl;
}

/// @nodoc
abstract class _$$TaskDeferredImplCopyWith<$Res> {
  factory _$$TaskDeferredImplCopyWith(
          _$TaskDeferredImpl value, $Res Function(_$TaskDeferredImpl) then) =
      __$$TaskDeferredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$TaskDeferredImplCopyWithImpl<$Res>
    extends _$TaskStepCopyWithImpl<$Res, _$TaskDeferredImpl>
    implements _$$TaskDeferredImplCopyWith<$Res> {
  __$$TaskDeferredImplCopyWithImpl(
      _$TaskDeferredImpl _value, $Res Function(_$TaskDeferredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$TaskDeferredImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskDeferredImpl implements TaskDeferred {
  const _$TaskDeferredImpl({required this.reason});

  @override
  final String reason;

  @override
  String toString() {
    return 'TaskStep.deferred(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDeferredImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDeferredImplCopyWith<_$TaskDeferredImpl> get copyWith =>
      __$$TaskDeferredImplCopyWithImpl<_$TaskDeferredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skipped,
    required TResult Function(String reason) deferred,
    required TResult Function(DispatchOutcome outcome) attempted,
  }) {
    return deferred(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? skipped,
    TResult? Function(String reason)? deferred,
    TResult? Function(DispatchOutcome outcome)? attempted,
  }) {
    return deferred?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skipped,
    TResult Function(String reason)? deferred,
    TResult Function(DispatchOutcome outcome)? attempted,
    required TResult orElse(),
  }) {
    if (deferred != null) {
      return deferred(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskSkipped value) skipped,
    required TResult Function(TaskDeferred value) deferred,
    required TResult Function(TaskAttempted value) attempted,
  }) {
    return deferred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskSkipped value)? skipped,
    TResult? Function(TaskDeferred value)? deferred,
    TResult? Function(TaskAttempted value)? attempted,
  }) {
    return deferred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskSkipped value)? skipped,
    TResult Function(TaskDeferred value)? deferred,
    TResult Function(TaskAttempted value)? attempted,
    required TResult orElse(),
  }) {
    if (deferred != null) {
      return deferred(this);
    }
    return orElse();
  }
}

abstract class TaskDeferred implements TaskStep {
  const factory TaskDeferred({required final String reason}) =
      _$TaskDeferredImpl;

  String get reason;
  @JsonKey(ignore: true)
  _$$TaskDeferredImplCopyWith<_$TaskDeferredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskAttemptedImplCopyWith<$Res> {
  factory _$$TaskAttemptedImplCopyWith(
          _$TaskAttemptedImpl value, $Res Function(_$TaskAttemptedImpl) then) =
      __$$TaskAttemptedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DispatchOutcome outcome});

  $DispatchOutcomeCopyWith<$Res> get outcome;
}

/// @nodoc
class __$$TaskAttemptedImplCopyWithImpl<$Res>
    extends _$TaskStepCopyWithImpl<$Res, _$TaskAttemptedImpl>
    implements _$$TaskAttemptedImplCopyWith<$Res> {
  __$$TaskAttemptedImplCopyWithImpl(
      _$TaskAttemptedImpl _value, $Res Function(_$TaskAttemptedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outcome = null,
  }) {
    return _then(_$TaskAttemptedImpl(
      null == outcome
          ? _value.outcome
          : outcome // ignore: cast_nullable_to_non_nullable
              as DispatchOutcome,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DispatchOutcomeCopyWith<$Res> get outcome {
    return $DispatchOutcomeCopyWith<$Res>(_value.outcome, (value) {
      return _then(_value.copyWith(outcome: value));
    });
  }
}

/// @nodoc

class _$TaskAttemptedImpl implements TaskAttempted {
  const _$TaskAttemptedImpl(this.outcome);

  @override
  final DispatchOutcome outcome;

  @override
  String toString() {
    return 'TaskStep.attempted(outcome: $outcome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskAttemptedImpl &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @override
  int get hashCode => Object.hash(runtimeType, outcome);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskAttemptedImplCopyWith<_$TaskAttemptedImpl> get copyWith =>
      __$$TaskAttemptedImplCopyWithImpl<_$TaskAttemptedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skipped,
    required TResult Function(String reason) deferred,
    required TResult Function(DispatchOutcome outcome) attempted,
  }) {
    return attempted(outcome);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? skipped,
    TResult? Function(String reason)? deferred,
    TResult? Function(DispatchOutcome outcome)? attempted,
  }) {
    return attempted?.call(outcome);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skipped,
    TResult Function(String reason)? deferred,
    TResult Function(DispatchOutcome outcome)? attempted,
    required TResult orElse(),
  }) {
    if (attempted != null) {
      return attempted(outcome);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskSkipped value) skipped,
    required TResult Function(TaskDeferred value) deferred,
    required TResult Function(TaskAttempted value) attempted,
  }) {
    return attempted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskSkipped value)? skipped,
    TResult? Function(TaskDeferred value)? deferred,
    TResult? Function(TaskAttempted value)? attempted,
  }) {
    return attempted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskSkipped value)? skipped,
    TResult Function(TaskDeferred value)? deferred,
    TResult Function(TaskAttempted value)? attempted,
    required TResult orElse(),
  }) {
    if (attempted != null) {
      return attempted(this);
    }
    return orElse();
  }
}

abstract class TaskAttempted implements TaskStep {
  const factory TaskAttempted(final DispatchOutcome outcome) =
      _$TaskAttemptedImpl;

  DispatchOutcome get outcome;
  @JsonKey(ignore: true)
  _$$TaskAttemptedImplCopyWith<_$TaskAttemptedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpstreamRunStats {
  int get delivered => throw _privateConstructorUsedError;
  int get rescheduled => throw _privateConstructorUsedError;
  int get deferred => throw _privateConstructorUsedError;
  int get conflicts => throw _privateConstructorUsedError;
  int get rejected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpstreamRunStatsCopyWith<UpstreamRunStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpstreamRunStatsCopyWith<$Res> {
  factory $UpstreamRunStatsCopyWith(
          UpstreamRunStats value, $Res Function(UpstreamRunStats) then) =
      _$UpstreamRunStatsCopyWithImpl<$Res, UpstreamRunStats>;
  @useResult
  $Res call(
      {int delivered,
      int rescheduled,
      int deferred,
      int conflicts,
      int rejected});
}

/// @nodoc
class _$UpstreamRunStatsCopyWithImpl<$Res, $Val extends UpstreamRunStats>
    implements $UpstreamRunStatsCopyWith<$Res> {
  _$UpstreamRunStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivered = null,
    Object? rescheduled = null,
    Object? deferred = null,
    Object? conflicts = null,
    Object? rejected = null,
  }) {
    return _then(_value.copyWith(
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      rescheduled: null == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as int,
      deferred: null == deferred
          ? _value.deferred
          : deferred // ignore: cast_nullable_to_non_nullable
              as int,
      conflicts: null == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      rejected: null == rejected
          ? _value.rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpstreamRunStatsImplCopyWith<$Res>
    implements $UpstreamRunStatsCopyWith<$Res> {
  factory _$$UpstreamRunStatsImplCopyWith(_$UpstreamRunStatsImpl value,
          $Res Function(_$UpstreamRunStatsImpl) then) =
      __$$UpstreamRunStatsImplCopyWithImpl<$Res>;
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
class __$$UpstreamRunStatsImplCopyWithImpl<$Res>
    extends _$UpstreamRunStatsCopyWithImpl<$Res, _$UpstreamRunStatsImpl>
    implements _$$UpstreamRunStatsImplCopyWith<$Res> {
  __$$UpstreamRunStatsImplCopyWithImpl(_$UpstreamRunStatsImpl _value,
      $Res Function(_$UpstreamRunStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delivered = null,
    Object? rescheduled = null,
    Object? deferred = null,
    Object? conflicts = null,
    Object? rejected = null,
  }) {
    return _then(_$UpstreamRunStatsImpl(
      delivered: null == delivered
          ? _value.delivered
          : delivered // ignore: cast_nullable_to_non_nullable
              as int,
      rescheduled: null == rescheduled
          ? _value.rescheduled
          : rescheduled // ignore: cast_nullable_to_non_nullable
              as int,
      deferred: null == deferred
          ? _value.deferred
          : deferred // ignore: cast_nullable_to_non_nullable
              as int,
      conflicts: null == conflicts
          ? _value.conflicts
          : conflicts // ignore: cast_nullable_to_non_nullable
              as int,
      rejected: null == rejected
          ? _value.rejected
          : rejected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpstreamRunStatsImpl extends _UpstreamRunStats {
  const _$UpstreamRunStatsImpl(
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

  @override
  String toString() {
    return 'UpstreamRunStats(delivered: $delivered, rescheduled: $rescheduled, deferred: $deferred, conflicts: $conflicts, rejected: $rejected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpstreamRunStatsImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpstreamRunStatsImplCopyWith<_$UpstreamRunStatsImpl> get copyWith =>
      __$$UpstreamRunStatsImplCopyWithImpl<_$UpstreamRunStatsImpl>(
          this, _$identity);
}

abstract class _UpstreamRunStats extends UpstreamRunStats {
  const factory _UpstreamRunStats(
      {final int delivered,
      final int rescheduled,
      final int deferred,
      final int conflicts,
      final int rejected}) = _$UpstreamRunStatsImpl;
  const _UpstreamRunStats._() : super._();

  @override
  int get delivered;
  @override
  int get rescheduled;
  @override
  int get deferred;
  @override
  int get conflicts;
  @override
  int get rejected;
  @override
  @JsonKey(ignore: true)
  _$$UpstreamRunStatsImplCopyWith<_$UpstreamRunStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpstreamRunResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() offline,
    required TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)
        completed,
    required TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)
        halted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? offline,
    TResult? Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult? Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? offline,
    TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpstreamOffline value) offline,
    required TResult Function(UpstreamCompleted value) completed,
    required TResult Function(UpstreamHalted value) halted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpstreamOffline value)? offline,
    TResult? Function(UpstreamCompleted value)? completed,
    TResult? Function(UpstreamHalted value)? halted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpstreamOffline value)? offline,
    TResult Function(UpstreamCompleted value)? completed,
    TResult Function(UpstreamHalted value)? halted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpstreamRunResultCopyWith<$Res> {
  factory $UpstreamRunResultCopyWith(
          UpstreamRunResult value, $Res Function(UpstreamRunResult) then) =
      _$UpstreamRunResultCopyWithImpl<$Res, UpstreamRunResult>;
}

/// @nodoc
class _$UpstreamRunResultCopyWithImpl<$Res, $Val extends UpstreamRunResult>
    implements $UpstreamRunResultCopyWith<$Res> {
  _$UpstreamRunResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpstreamOfflineImplCopyWith<$Res> {
  factory _$$UpstreamOfflineImplCopyWith(_$UpstreamOfflineImpl value,
          $Res Function(_$UpstreamOfflineImpl) then) =
      __$$UpstreamOfflineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpstreamOfflineImplCopyWithImpl<$Res>
    extends _$UpstreamRunResultCopyWithImpl<$Res, _$UpstreamOfflineImpl>
    implements _$$UpstreamOfflineImplCopyWith<$Res> {
  __$$UpstreamOfflineImplCopyWithImpl(
      _$UpstreamOfflineImpl _value, $Res Function(_$UpstreamOfflineImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpstreamOfflineImpl implements UpstreamOffline {
  const _$UpstreamOfflineImpl();

  @override
  String toString() {
    return 'UpstreamRunResult.offline()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpstreamOfflineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() offline,
    required TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)
        completed,
    required TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)
        halted,
  }) {
    return offline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? offline,
    TResult? Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult? Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
  }) {
    return offline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? offline,
    TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpstreamOffline value) offline,
    required TResult Function(UpstreamCompleted value) completed,
    required TResult Function(UpstreamHalted value) halted,
  }) {
    return offline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpstreamOffline value)? offline,
    TResult? Function(UpstreamCompleted value)? completed,
    TResult? Function(UpstreamHalted value)? halted,
  }) {
    return offline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpstreamOffline value)? offline,
    TResult Function(UpstreamCompleted value)? completed,
    TResult Function(UpstreamHalted value)? halted,
    required TResult orElse(),
  }) {
    if (offline != null) {
      return offline(this);
    }
    return orElse();
  }
}

abstract class UpstreamOffline implements UpstreamRunResult {
  const factory UpstreamOffline() = _$UpstreamOfflineImpl;
}

/// @nodoc
abstract class _$$UpstreamCompletedImplCopyWith<$Res> {
  factory _$$UpstreamCompletedImplCopyWith(_$UpstreamCompletedImpl value,
          $Res Function(_$UpstreamCompletedImpl) then) =
      __$$UpstreamCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpstreamRunStats stats, DateTime? nextDueAt});

  $UpstreamRunStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$UpstreamCompletedImplCopyWithImpl<$Res>
    extends _$UpstreamRunResultCopyWithImpl<$Res, _$UpstreamCompletedImpl>
    implements _$$UpstreamCompletedImplCopyWith<$Res> {
  __$$UpstreamCompletedImplCopyWithImpl(_$UpstreamCompletedImpl _value,
      $Res Function(_$UpstreamCompletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? nextDueAt = freezed,
  }) {
    return _then(_$UpstreamCompletedImpl(
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UpstreamRunStats,
      nextDueAt: freezed == nextDueAt
          ? _value.nextDueAt
          : nextDueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UpstreamRunStatsCopyWith<$Res> get stats {
    return $UpstreamRunStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc

class _$UpstreamCompletedImpl implements UpstreamCompleted {
  const _$UpstreamCompletedImpl({required this.stats, this.nextDueAt});

  @override
  final UpstreamRunStats stats;
  @override
  final DateTime? nextDueAt;

  @override
  String toString() {
    return 'UpstreamRunResult.completed(stats: $stats, nextDueAt: $nextDueAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpstreamCompletedImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.nextDueAt, nextDueAt) ||
                other.nextDueAt == nextDueAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stats, nextDueAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpstreamCompletedImplCopyWith<_$UpstreamCompletedImpl> get copyWith =>
      __$$UpstreamCompletedImplCopyWithImpl<_$UpstreamCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() offline,
    required TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)
        completed,
    required TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)
        halted,
  }) {
    return completed(stats, nextDueAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? offline,
    TResult? Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult? Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
  }) {
    return completed?.call(stats, nextDueAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? offline,
    TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(stats, nextDueAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpstreamOffline value) offline,
    required TResult Function(UpstreamCompleted value) completed,
    required TResult Function(UpstreamHalted value) halted,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpstreamOffline value)? offline,
    TResult? Function(UpstreamCompleted value)? completed,
    TResult? Function(UpstreamHalted value)? halted,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpstreamOffline value)? offline,
    TResult Function(UpstreamCompleted value)? completed,
    TResult Function(UpstreamHalted value)? halted,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class UpstreamCompleted implements UpstreamRunResult {
  const factory UpstreamCompleted(
      {required final UpstreamRunStats stats,
      final DateTime? nextDueAt}) = _$UpstreamCompletedImpl;

  UpstreamRunStats get stats;
  DateTime? get nextDueAt;
  @JsonKey(ignore: true)
  _$$UpstreamCompletedImplCopyWith<_$UpstreamCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpstreamHaltedImplCopyWith<$Res> {
  factory _$$UpstreamHaltedImplCopyWith(_$UpstreamHaltedImpl value,
          $Res Function(_$UpstreamHaltedImpl) then) =
      __$$UpstreamHaltedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UpstreamHaltReason reason,
      String message,
      UpstreamRunStats stats,
      DateTime? nextDueAt});

  $UpstreamRunStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$UpstreamHaltedImplCopyWithImpl<$Res>
    extends _$UpstreamRunResultCopyWithImpl<$Res, _$UpstreamHaltedImpl>
    implements _$$UpstreamHaltedImplCopyWith<$Res> {
  __$$UpstreamHaltedImplCopyWithImpl(
      _$UpstreamHaltedImpl _value, $Res Function(_$UpstreamHaltedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
    Object? message = null,
    Object? stats = null,
    Object? nextDueAt = freezed,
  }) {
    return _then(_$UpstreamHaltedImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as UpstreamHaltReason,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UpstreamRunStats,
      nextDueAt: freezed == nextDueAt
          ? _value.nextDueAt
          : nextDueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UpstreamRunStatsCopyWith<$Res> get stats {
    return $UpstreamRunStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc

class _$UpstreamHaltedImpl implements UpstreamHalted {
  const _$UpstreamHaltedImpl(
      {required this.reason,
      required this.message,
      required this.stats,
      this.nextDueAt});

  @override
  final UpstreamHaltReason reason;
  @override
  final String message;
  @override
  final UpstreamRunStats stats;
  @override
  final DateTime? nextDueAt;

  @override
  String toString() {
    return 'UpstreamRunResult.halted(reason: $reason, message: $message, stats: $stats, nextDueAt: $nextDueAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpstreamHaltedImpl &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.nextDueAt, nextDueAt) ||
                other.nextDueAt == nextDueAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reason, message, stats, nextDueAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpstreamHaltedImplCopyWith<_$UpstreamHaltedImpl> get copyWith =>
      __$$UpstreamHaltedImplCopyWithImpl<_$UpstreamHaltedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() offline,
    required TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)
        completed,
    required TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)
        halted,
  }) {
    return halted(reason, message, stats, nextDueAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? offline,
    TResult? Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult? Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
  }) {
    return halted?.call(reason, message, stats, nextDueAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? offline,
    TResult Function(UpstreamRunStats stats, DateTime? nextDueAt)? completed,
    TResult Function(UpstreamHaltReason reason, String message,
            UpstreamRunStats stats, DateTime? nextDueAt)?
        halted,
    required TResult orElse(),
  }) {
    if (halted != null) {
      return halted(reason, message, stats, nextDueAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpstreamOffline value) offline,
    required TResult Function(UpstreamCompleted value) completed,
    required TResult Function(UpstreamHalted value) halted,
  }) {
    return halted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpstreamOffline value)? offline,
    TResult? Function(UpstreamCompleted value)? completed,
    TResult? Function(UpstreamHalted value)? halted,
  }) {
    return halted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpstreamOffline value)? offline,
    TResult Function(UpstreamCompleted value)? completed,
    TResult Function(UpstreamHalted value)? halted,
    required TResult orElse(),
  }) {
    if (halted != null) {
      return halted(this);
    }
    return orElse();
  }
}

abstract class UpstreamHalted implements UpstreamRunResult {
  const factory UpstreamHalted(
      {required final UpstreamHaltReason reason,
      required final String message,
      required final UpstreamRunStats stats,
      final DateTime? nextDueAt}) = _$UpstreamHaltedImpl;

  UpstreamHaltReason get reason;
  String get message;
  UpstreamRunStats get stats;
  DateTime? get nextDueAt;
  @JsonKey(ignore: true)
  _$$UpstreamHaltedImplCopyWith<_$UpstreamHaltedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
