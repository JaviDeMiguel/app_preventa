// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncTask {
  String get id;
  String get endpoint;
  HttpMethod get method;
  Map<String, dynamic> get payload;
  int get retries;
  int get maxRetries;
  SyncStatus get status;
  DateTime get createdAt;
  DateTime?
      get lastAttemptAt; // FEAT: Instante a partir del cual la tarea es elegible (Exponential Backoff).
  DateTime?
      get nextAttemptAt; // FIX: true si el ERP pudo haber recibido la petición sin confirmarlo.
  bool get deliveryUncertain;
  String? get errorMessage;

  /// Create a copy of SyncTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncTaskCopyWith<SyncTask> get copyWith =>
      _$SyncTaskCopyWithImpl<SyncTask>(this as SyncTask, _$identity);

  /// Serializes this SyncTask to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncTask &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            (identical(other.retries, retries) || other.retries == retries) &&
            (identical(other.maxRetries, maxRetries) ||
                other.maxRetries == maxRetries) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastAttemptAt, lastAttemptAt) ||
                other.lastAttemptAt == lastAttemptAt) &&
            (identical(other.nextAttemptAt, nextAttemptAt) ||
                other.nextAttemptAt == nextAttemptAt) &&
            (identical(other.deliveryUncertain, deliveryUncertain) ||
                other.deliveryUncertain == deliveryUncertain) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      endpoint,
      method,
      const DeepCollectionEquality().hash(payload),
      retries,
      maxRetries,
      status,
      createdAt,
      lastAttemptAt,
      nextAttemptAt,
      deliveryUncertain,
      errorMessage);

  @override
  String toString() {
    return 'SyncTask(id: $id, endpoint: $endpoint, method: $method, payload: $payload, retries: $retries, maxRetries: $maxRetries, status: $status, createdAt: $createdAt, lastAttemptAt: $lastAttemptAt, nextAttemptAt: $nextAttemptAt, deliveryUncertain: $deliveryUncertain, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $SyncTaskCopyWith<$Res> {
  factory $SyncTaskCopyWith(SyncTask value, $Res Function(SyncTask) _then) =
      _$SyncTaskCopyWithImpl;
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
      DateTime? nextAttemptAt,
      bool deliveryUncertain,
      String? errorMessage});
}

/// @nodoc
class _$SyncTaskCopyWithImpl<$Res> implements $SyncTaskCopyWith<$Res> {
  _$SyncTaskCopyWithImpl(this._self, this._then);

  final SyncTask _self;
  final $Res Function(SyncTask) _then;

  /// Create a copy of SyncTask
  /// with the given fields replaced by the non-null parameter values.
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
    Object? nextAttemptAt = freezed,
    Object? deliveryUncertain = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      payload: null == payload
          ? _self.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retries: null == retries
          ? _self.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      maxRetries: null == maxRetries
          ? _self.maxRetries
          : maxRetries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttemptAt: freezed == lastAttemptAt
          ? _self.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextAttemptAt: freezed == nextAttemptAt
          ? _self.nextAttemptAt
          : nextAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryUncertain: null == deliveryUncertain
          ? _self.deliveryUncertain
          : deliveryUncertain // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SyncTask].
extension SyncTaskPatterns on SyncTask {
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
    TResult Function(_SyncTask value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncTask() when $default != null:
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
    TResult Function(_SyncTask value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncTask():
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
    TResult? Function(_SyncTask value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncTask() when $default != null:
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
    TResult Function(
            String id,
            String endpoint,
            HttpMethod method,
            Map<String, dynamic> payload,
            int retries,
            int maxRetries,
            SyncStatus status,
            DateTime createdAt,
            DateTime? lastAttemptAt,
            DateTime? nextAttemptAt,
            bool deliveryUncertain,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncTask() when $default != null:
        return $default(
            _that.id,
            _that.endpoint,
            _that.method,
            _that.payload,
            _that.retries,
            _that.maxRetries,
            _that.status,
            _that.createdAt,
            _that.lastAttemptAt,
            _that.nextAttemptAt,
            _that.deliveryUncertain,
            _that.errorMessage);
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
    TResult Function(
            String id,
            String endpoint,
            HttpMethod method,
            Map<String, dynamic> payload,
            int retries,
            int maxRetries,
            SyncStatus status,
            DateTime createdAt,
            DateTime? lastAttemptAt,
            DateTime? nextAttemptAt,
            bool deliveryUncertain,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncTask():
        return $default(
            _that.id,
            _that.endpoint,
            _that.method,
            _that.payload,
            _that.retries,
            _that.maxRetries,
            _that.status,
            _that.createdAt,
            _that.lastAttemptAt,
            _that.nextAttemptAt,
            _that.deliveryUncertain,
            _that.errorMessage);
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
    TResult? Function(
            String id,
            String endpoint,
            HttpMethod method,
            Map<String, dynamic> payload,
            int retries,
            int maxRetries,
            SyncStatus status,
            DateTime createdAt,
            DateTime? lastAttemptAt,
            DateTime? nextAttemptAt,
            bool deliveryUncertain,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncTask() when $default != null:
        return $default(
            _that.id,
            _that.endpoint,
            _that.method,
            _that.payload,
            _that.retries,
            _that.maxRetries,
            _that.status,
            _that.createdAt,
            _that.lastAttemptAt,
            _that.nextAttemptAt,
            _that.deliveryUncertain,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SyncTask implements SyncTask {
  const _SyncTask(
      {required this.id,
      required this.endpoint,
      required this.method,
      required final Map<String, dynamic> payload,
      this.retries = 0,
      this.maxRetries = 3,
      this.status = SyncStatus.pending,
      required this.createdAt,
      this.lastAttemptAt,
      this.nextAttemptAt,
      this.deliveryUncertain = false,
      this.errorMessage})
      : _payload = payload;
  factory _SyncTask.fromJson(Map<String, dynamic> json) =>
      _$SyncTaskFromJson(json);

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
// FEAT: Instante a partir del cual la tarea es elegible (Exponential Backoff).
  @override
  final DateTime? nextAttemptAt;
// FIX: true si el ERP pudo haber recibido la petición sin confirmarlo.
  @override
  @JsonKey()
  final bool deliveryUncertain;
  @override
  final String? errorMessage;

  /// Create a copy of SyncTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncTaskCopyWith<_SyncTask> get copyWith =>
      __$SyncTaskCopyWithImpl<_SyncTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SyncTaskToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncTask &&
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
            (identical(other.nextAttemptAt, nextAttemptAt) ||
                other.nextAttemptAt == nextAttemptAt) &&
            (identical(other.deliveryUncertain, deliveryUncertain) ||
                other.deliveryUncertain == deliveryUncertain) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      nextAttemptAt,
      deliveryUncertain,
      errorMessage);

  @override
  String toString() {
    return 'SyncTask(id: $id, endpoint: $endpoint, method: $method, payload: $payload, retries: $retries, maxRetries: $maxRetries, status: $status, createdAt: $createdAt, lastAttemptAt: $lastAttemptAt, nextAttemptAt: $nextAttemptAt, deliveryUncertain: $deliveryUncertain, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$SyncTaskCopyWith<$Res>
    implements $SyncTaskCopyWith<$Res> {
  factory _$SyncTaskCopyWith(_SyncTask value, $Res Function(_SyncTask) _then) =
      __$SyncTaskCopyWithImpl;
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
      DateTime? nextAttemptAt,
      bool deliveryUncertain,
      String? errorMessage});
}

/// @nodoc
class __$SyncTaskCopyWithImpl<$Res> implements _$SyncTaskCopyWith<$Res> {
  __$SyncTaskCopyWithImpl(this._self, this._then);

  final _SyncTask _self;
  final $Res Function(_SyncTask) _then;

  /// Create a copy of SyncTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? nextAttemptAt = freezed,
    Object? deliveryUncertain = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_SyncTask(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      endpoint: null == endpoint
          ? _self.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod,
      payload: null == payload
          ? _self._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retries: null == retries
          ? _self.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      maxRetries: null == maxRetries
          ? _self.maxRetries
          : maxRetries // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastAttemptAt: freezed == lastAttemptAt
          ? _self.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextAttemptAt: freezed == nextAttemptAt
          ? _self.nextAttemptAt
          : nextAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryUncertain: null == deliveryUncertain
          ? _self.deliveryUncertain
          : deliveryUncertain // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
