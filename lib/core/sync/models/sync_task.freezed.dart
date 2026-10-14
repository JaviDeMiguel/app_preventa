// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncTask _$SyncTaskFromJson(Map<String, dynamic> json) {
  return _SyncTask.fromJson(json);
}

/// @nodoc
mixin _$SyncTask {
  String get id => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  HttpMethod get method => throw _privateConstructorUsedError;
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;
  int get retries => throw _privateConstructorUsedError;
  int get maxRetries => throw _privateConstructorUsedError;
  SyncStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastAttemptAt => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncTaskCopyWith<SyncTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncTaskCopyWith<$Res> {
  factory $SyncTaskCopyWith(SyncTask value, $Res Function(SyncTask) then) =
      _$SyncTaskCopyWithImpl<$Res, SyncTask>;
  @useResult
  $Res call(
      {String id,
      String endpoint,
      HttpMethod method,
      Map<String, dynamic> payload,
      int retries,
      int maxRetries,
      SyncStatus status,
      DateTime createdAt,
      DateTime? lastAttemptAt,
      String? errorMessage});
}

/// @nodoc
class _$SyncTaskCopyWithImpl<$Res, $Val extends SyncTask>
    implements $SyncTaskCopyWith<$Res> {
  _$SyncTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? endpoint = null,
    Object? method = null,
    Object? payload = null,
    Object? retries = null,
    Object? maxRetries = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastAttemptAt = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retries: null == retries
          ? _value.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      maxRetries: null == maxRetries
          ? _value.maxRetries
          : maxRetries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttemptAt: freezed == lastAttemptAt
          ? _value.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncTaskImplCopyWith<$Res>
    implements $SyncTaskCopyWith<$Res> {
  factory _$$SyncTaskImplCopyWith(
          _$SyncTaskImpl value, $Res Function(_$SyncTaskImpl) then) =
      __$$SyncTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String endpoint,
      HttpMethod method,
      Map<String, dynamic> payload,
      int retries,
      int maxRetries,
      SyncStatus status,
      DateTime createdAt,
      DateTime? lastAttemptAt,
      String? errorMessage});
}

/// @nodoc
class __$$SyncTaskImplCopyWithImpl<$Res>
    extends _$SyncTaskCopyWithImpl<$Res, _$SyncTaskImpl>
    implements _$$SyncTaskImplCopyWith<$Res> {
  __$$SyncTaskImplCopyWithImpl(
      _$SyncTaskImpl _value, $Res Function(_$SyncTaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? endpoint = null,
    Object? method = null,
    Object? payload = null,
    Object? retries = null,
    Object? maxRetries = null,
    Object? status = null,
    Object? createdAt = null,
    Object? lastAttemptAt = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SyncTaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retries: null == retries
          ? _value.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      maxRetries: null == maxRetries
          ? _value.maxRetries
          : maxRetries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttemptAt: freezed == lastAttemptAt
          ? _value.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncTaskImpl implements _SyncTask {
  const _$SyncTaskImpl(
      {required this.id,
      required this.endpoint,
      required this.method,
      required final Map<String, dynamic> payload,
      this.retries = 0,
      this.maxRetries = 3,
      this.status = SyncStatus.pending,
      required this.createdAt,
      this.lastAttemptAt,
      this.errorMessage})
      : _payload = payload;

  factory _$SyncTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String endpoint;
  @override
  final HttpMethod method;
  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  @JsonKey()
  final int retries;
  @override
  @JsonKey()
  final int maxRetries;
  @override
  @JsonKey()
  final SyncStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastAttemptAt;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SyncTask(id: $id, endpoint: $endpoint, method: $method, payload: $payload, retries: $retries, maxRetries: $maxRetries, status: $status, createdAt: $createdAt, lastAttemptAt: $lastAttemptAt, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.retries, retries) || other.retries == retries) &&
            (identical(other.maxRetries, maxRetries) ||
                other.maxRetries == maxRetries) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastAttemptAt, lastAttemptAt) ||
                other.lastAttemptAt == lastAttemptAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      endpoint,
      method,
      const DeepCollectionEquality().hash(_payload),
      retries,
      maxRetries,
      status,
      createdAt,
      lastAttemptAt,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncTaskImplCopyWith<_$SyncTaskImpl> get copyWith =>
      __$$SyncTaskImplCopyWithImpl<_$SyncTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncTaskImplToJson(
      this,
    );
  }
}

abstract class _SyncTask implements SyncTask {
  const factory _SyncTask(
      {required final String id,
      required final String endpoint,
      required final HttpMethod method,
      required final Map<String, dynamic> payload,
      final int retries,
      final int maxRetries,
      final SyncStatus status,
      required final DateTime createdAt,
      final DateTime? lastAttemptAt,
      final String? errorMessage}) = _$SyncTaskImpl;

  factory _SyncTask.fromJson(Map<String, dynamic> json) =
      _$SyncTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get endpoint;
  @override
  HttpMethod get method;
  @override
  Map<String, dynamic> get payload;
  @override
  int get retries;
  @override
  int get maxRetries;
  @override
  SyncStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastAttemptAt;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SyncTaskImplCopyWith<_$SyncTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
