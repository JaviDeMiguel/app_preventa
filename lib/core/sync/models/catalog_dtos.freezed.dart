// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacturaScriptsClientDto {
  String get codcliente;
  String get nombre;
  @JsonKey(fromJson: lenientString)
  String get cifnif;
  String? get telefono1;
  String? get email;
  @JsonKey(fromJson: lenientDouble)
  double get riesgomax;
  @JsonKey(fromJson: lenientDouble)
  double get riesgoalcanzado;
  String? get codtarifa;
  String? get regimeniva;
  @JsonKey(fromJson: lenientBool)
  bool get debaja;

  /// Create a copy of FacturaScriptsClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacturaScriptsClientDtoCopyWith<FacturaScriptsClientDto> get copyWith =>
      _$FacturaScriptsClientDtoCopyWithImpl<FacturaScriptsClientDto>(
          this as FacturaScriptsClientDto, _$identity);

  /// Serializes this FacturaScriptsClientDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacturaScriptsClientDto &&
            (identical(other.codcliente, codcliente) ||
                other.codcliente == codcliente) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.cifnif, cifnif) || other.cifnif == cifnif) &&
            (identical(other.telefono1, telefono1) ||
                other.telefono1 == telefono1) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.riesgomax, riesgomax) ||
                other.riesgomax == riesgomax) &&
            (identical(other.riesgoalcanzado, riesgoalcanzado) ||
                other.riesgoalcanzado == riesgoalcanzado) &&
            (identical(other.codtarifa, codtarifa) ||
                other.codtarifa == codtarifa) &&
            (identical(other.regimeniva, regimeniva) ||
                other.regimeniva == regimeniva) &&
            (identical(other.debaja, debaja) || other.debaja == debaja));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codcliente,
      nombre,
      cifnif,
      telefono1,
      email,
      riesgomax,
      riesgoalcanzado,
      codtarifa,
      regimeniva,
      debaja);

  @override
  String toString() {
    return 'FacturaScriptsClientDto(codcliente: $codcliente, nombre: $nombre, cifnif: $cifnif, telefono1: $telefono1, email: $email, riesgomax: $riesgomax, riesgoalcanzado: $riesgoalcanzado, codtarifa: $codtarifa, regimeniva: $regimeniva, debaja: $debaja)';
  }
}

/// @nodoc
abstract mixin class $FacturaScriptsClientDtoCopyWith<$Res> {
  factory $FacturaScriptsClientDtoCopyWith(FacturaScriptsClientDto value,
          $Res Function(FacturaScriptsClientDto) _then) =
      _$FacturaScriptsClientDtoCopyWithImpl;
  @useResult
  $Res call(
      {String codcliente,
      String nombre,
      @JsonKey(fromJson: lenientString) String cifnif,
      String? telefono1,
      String? email,
      @JsonKey(fromJson: lenientDouble) double riesgomax,
      @JsonKey(fromJson: lenientDouble) double riesgoalcanzado,
      String? codtarifa,
      String? regimeniva,
      @JsonKey(fromJson: lenientBool) bool debaja});
}

/// @nodoc
class _$FacturaScriptsClientDtoCopyWithImpl<$Res>
    implements $FacturaScriptsClientDtoCopyWith<$Res> {
  _$FacturaScriptsClientDtoCopyWithImpl(this._self, this._then);

  final FacturaScriptsClientDto _self;
  final $Res Function(FacturaScriptsClientDto) _then;

  /// Create a copy of FacturaScriptsClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codcliente = null,
    Object? nombre = null,
    Object? cifnif = null,
    Object? telefono1 = freezed,
    Object? email = freezed,
    Object? riesgomax = null,
    Object? riesgoalcanzado = null,
    Object? codtarifa = freezed,
    Object? regimeniva = freezed,
    Object? debaja = null,
  }) {
    return _then(_self.copyWith(
      codcliente: null == codcliente
          ? _self.codcliente
          : codcliente // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      cifnif: null == cifnif
          ? _self.cifnif
          : cifnif // ignore: cast_nullable_to_non_nullable
              as String,
      telefono1: freezed == telefono1
          ? _self.telefono1
          : telefono1 // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      riesgomax: null == riesgomax
          ? _self.riesgomax
          : riesgomax // ignore: cast_nullable_to_non_nullable
              as double,
      riesgoalcanzado: null == riesgoalcanzado
          ? _self.riesgoalcanzado
          : riesgoalcanzado // ignore: cast_nullable_to_non_nullable
              as double,
      codtarifa: freezed == codtarifa
          ? _self.codtarifa
          : codtarifa // ignore: cast_nullable_to_non_nullable
              as String?,
      regimeniva: freezed == regimeniva
          ? _self.regimeniva
          : regimeniva // ignore: cast_nullable_to_non_nullable
              as String?,
      debaja: null == debaja
          ? _self.debaja
          : debaja // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacturaScriptsClientDto].
extension FacturaScriptsClientDtoPatterns on FacturaScriptsClientDto {
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
    TResult Function(_FacturaScriptsClientDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto() when $default != null:
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
    TResult Function(_FacturaScriptsClientDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto():
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
    TResult? Function(_FacturaScriptsClientDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto() when $default != null:
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
            String codcliente,
            String nombre,
            @JsonKey(fromJson: lenientString) String cifnif,
            String? telefono1,
            String? email,
            @JsonKey(fromJson: lenientDouble) double riesgomax,
            @JsonKey(fromJson: lenientDouble) double riesgoalcanzado,
            String? codtarifa,
            String? regimeniva,
            @JsonKey(fromJson: lenientBool) bool debaja)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto() when $default != null:
        return $default(
            _that.codcliente,
            _that.nombre,
            _that.cifnif,
            _that.telefono1,
            _that.email,
            _that.riesgomax,
            _that.riesgoalcanzado,
            _that.codtarifa,
            _that.regimeniva,
            _that.debaja);
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
            String codcliente,
            String nombre,
            @JsonKey(fromJson: lenientString) String cifnif,
            String? telefono1,
            String? email,
            @JsonKey(fromJson: lenientDouble) double riesgomax,
            @JsonKey(fromJson: lenientDouble) double riesgoalcanzado,
            String? codtarifa,
            String? regimeniva,
            @JsonKey(fromJson: lenientBool) bool debaja)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto():
        return $default(
            _that.codcliente,
            _that.nombre,
            _that.cifnif,
            _that.telefono1,
            _that.email,
            _that.riesgomax,
            _that.riesgoalcanzado,
            _that.codtarifa,
            _that.regimeniva,
            _that.debaja);
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
            String codcliente,
            String nombre,
            @JsonKey(fromJson: lenientString) String cifnif,
            String? telefono1,
            String? email,
            @JsonKey(fromJson: lenientDouble) double riesgomax,
            @JsonKey(fromJson: lenientDouble) double riesgoalcanzado,
            String? codtarifa,
            String? regimeniva,
            @JsonKey(fromJson: lenientBool) bool debaja)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsClientDto() when $default != null:
        return $default(
            _that.codcliente,
            _that.nombre,
            _that.cifnif,
            _that.telefono1,
            _that.email,
            _that.riesgomax,
            _that.riesgoalcanzado,
            _that.codtarifa,
            _that.regimeniva,
            _that.debaja);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacturaScriptsClientDto extends FacturaScriptsClientDto {
  const _FacturaScriptsClientDto(
      {required this.codcliente,
      required this.nombre,
      @JsonKey(fromJson: lenientString) this.cifnif = '',
      this.telefono1,
      this.email,
      @JsonKey(fromJson: lenientDouble) this.riesgomax = 0.0,
      @JsonKey(fromJson: lenientDouble) this.riesgoalcanzado = 0.0,
      this.codtarifa,
      this.regimeniva,
      @JsonKey(fromJson: lenientBool) this.debaja = false})
      : super._();
  factory _FacturaScriptsClientDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsClientDtoFromJson(json);

  @override
  final String codcliente;
  @override
  final String nombre;
  @override
  @JsonKey(fromJson: lenientString)
  final String cifnif;
  @override
  final String? telefono1;
  @override
  final String? email;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double riesgomax;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double riesgoalcanzado;
  @override
  final String? codtarifa;
  @override
  final String? regimeniva;
  @override
  @JsonKey(fromJson: lenientBool)
  final bool debaja;

  /// Create a copy of FacturaScriptsClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacturaScriptsClientDtoCopyWith<_FacturaScriptsClientDto> get copyWith =>
      __$FacturaScriptsClientDtoCopyWithImpl<_FacturaScriptsClientDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacturaScriptsClientDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacturaScriptsClientDto &&
            (identical(other.codcliente, codcliente) ||
                other.codcliente == codcliente) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.cifnif, cifnif) || other.cifnif == cifnif) &&
            (identical(other.telefono1, telefono1) ||
                other.telefono1 == telefono1) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.riesgomax, riesgomax) ||
                other.riesgomax == riesgomax) &&
            (identical(other.riesgoalcanzado, riesgoalcanzado) ||
                other.riesgoalcanzado == riesgoalcanzado) &&
            (identical(other.codtarifa, codtarifa) ||
                other.codtarifa == codtarifa) &&
            (identical(other.regimeniva, regimeniva) ||
                other.regimeniva == regimeniva) &&
            (identical(other.debaja, debaja) || other.debaja == debaja));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      codcliente,
      nombre,
      cifnif,
      telefono1,
      email,
      riesgomax,
      riesgoalcanzado,
      codtarifa,
      regimeniva,
      debaja);

  @override
  String toString() {
    return 'FacturaScriptsClientDto(codcliente: $codcliente, nombre: $nombre, cifnif: $cifnif, telefono1: $telefono1, email: $email, riesgomax: $riesgomax, riesgoalcanzado: $riesgoalcanzado, codtarifa: $codtarifa, regimeniva: $regimeniva, debaja: $debaja)';
  }
}

/// @nodoc
abstract mixin class _$FacturaScriptsClientDtoCopyWith<$Res>
    implements $FacturaScriptsClientDtoCopyWith<$Res> {
  factory _$FacturaScriptsClientDtoCopyWith(_FacturaScriptsClientDto value,
          $Res Function(_FacturaScriptsClientDto) _then) =
      __$FacturaScriptsClientDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String codcliente,
      String nombre,
      @JsonKey(fromJson: lenientString) String cifnif,
      String? telefono1,
      String? email,
      @JsonKey(fromJson: lenientDouble) double riesgomax,
      @JsonKey(fromJson: lenientDouble) double riesgoalcanzado,
      String? codtarifa,
      String? regimeniva,
      @JsonKey(fromJson: lenientBool) bool debaja});
}

/// @nodoc
class __$FacturaScriptsClientDtoCopyWithImpl<$Res>
    implements _$FacturaScriptsClientDtoCopyWith<$Res> {
  __$FacturaScriptsClientDtoCopyWithImpl(this._self, this._then);

  final _FacturaScriptsClientDto _self;
  final $Res Function(_FacturaScriptsClientDto) _then;

  /// Create a copy of FacturaScriptsClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? codcliente = null,
    Object? nombre = null,
    Object? cifnif = null,
    Object? telefono1 = freezed,
    Object? email = freezed,
    Object? riesgomax = null,
    Object? riesgoalcanzado = null,
    Object? codtarifa = freezed,
    Object? regimeniva = freezed,
    Object? debaja = null,
  }) {
    return _then(_FacturaScriptsClientDto(
      codcliente: null == codcliente
          ? _self.codcliente
          : codcliente // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      cifnif: null == cifnif
          ? _self.cifnif
          : cifnif // ignore: cast_nullable_to_non_nullable
              as String,
      telefono1: freezed == telefono1
          ? _self.telefono1
          : telefono1 // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      riesgomax: null == riesgomax
          ? _self.riesgomax
          : riesgomax // ignore: cast_nullable_to_non_nullable
              as double,
      riesgoalcanzado: null == riesgoalcanzado
          ? _self.riesgoalcanzado
          : riesgoalcanzado // ignore: cast_nullable_to_non_nullable
              as double,
      codtarifa: freezed == codtarifa
          ? _self.codtarifa
          : codtarifa // ignore: cast_nullable_to_non_nullable
              as String?,
      regimeniva: freezed == regimeniva
          ? _self.regimeniva
          : regimeniva // ignore: cast_nullable_to_non_nullable
              as String?,
      debaja: null == debaja
          ? _self.debaja
          : debaja // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FacturaScriptsProductDto {
  String get referencia;
  @JsonKey(fromJson: lenientString)
  String get descripcion;
  @JsonKey(fromJson: lenientDouble)
  double get precio;
  String? get codimpuesto;
  @JsonKey(fromJson: lenientDouble)
  double get stockfis;
  @JsonKey(fromJson: lenientBool)
  bool get bloqueado;
  @JsonKey(fromJson: lenientBoolTrue)
  bool get sevende;

  /// Create a copy of FacturaScriptsProductDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacturaScriptsProductDtoCopyWith<FacturaScriptsProductDto> get copyWith =>
      _$FacturaScriptsProductDtoCopyWithImpl<FacturaScriptsProductDto>(
          this as FacturaScriptsProductDto, _$identity);

  /// Serializes this FacturaScriptsProductDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacturaScriptsProductDto &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.precio, precio) || other.precio == precio) &&
            (identical(other.codimpuesto, codimpuesto) ||
                other.codimpuesto == codimpuesto) &&
            (identical(other.stockfis, stockfis) ||
                other.stockfis == stockfis) &&
            (identical(other.bloqueado, bloqueado) ||
                other.bloqueado == bloqueado) &&
            (identical(other.sevende, sevende) || other.sevende == sevende));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referencia, descripcion, precio,
      codimpuesto, stockfis, bloqueado, sevende);

  @override
  String toString() {
    return 'FacturaScriptsProductDto(referencia: $referencia, descripcion: $descripcion, precio: $precio, codimpuesto: $codimpuesto, stockfis: $stockfis, bloqueado: $bloqueado, sevende: $sevende)';
  }
}

/// @nodoc
abstract mixin class $FacturaScriptsProductDtoCopyWith<$Res> {
  factory $FacturaScriptsProductDtoCopyWith(FacturaScriptsProductDto value,
          $Res Function(FacturaScriptsProductDto) _then) =
      _$FacturaScriptsProductDtoCopyWithImpl;
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientString) String descripcion,
      @JsonKey(fromJson: lenientDouble) double precio,
      String? codimpuesto,
      @JsonKey(fromJson: lenientDouble) double stockfis,
      @JsonKey(fromJson: lenientBool) bool bloqueado,
      @JsonKey(fromJson: lenientBoolTrue) bool sevende});
}

/// @nodoc
class _$FacturaScriptsProductDtoCopyWithImpl<$Res>
    implements $FacturaScriptsProductDtoCopyWith<$Res> {
  _$FacturaScriptsProductDtoCopyWithImpl(this._self, this._then);

  final FacturaScriptsProductDto _self;
  final $Res Function(FacturaScriptsProductDto) _then;

  /// Create a copy of FacturaScriptsProductDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? descripcion = null,
    Object? precio = null,
    Object? codimpuesto = freezed,
    Object? stockfis = null,
    Object? bloqueado = null,
    Object? sevende = null,
  }) {
    return _then(_self.copyWith(
      referencia: null == referencia
          ? _self.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _self.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codimpuesto: freezed == codimpuesto
          ? _self.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String?,
      stockfis: null == stockfis
          ? _self.stockfis
          : stockfis // ignore: cast_nullable_to_non_nullable
              as double,
      bloqueado: null == bloqueado
          ? _self.bloqueado
          : bloqueado // ignore: cast_nullable_to_non_nullable
              as bool,
      sevende: null == sevende
          ? _self.sevende
          : sevende // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacturaScriptsProductDto].
extension FacturaScriptsProductDtoPatterns on FacturaScriptsProductDto {
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
    TResult Function(_FacturaScriptsProductDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto() when $default != null:
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
    TResult Function(_FacturaScriptsProductDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto():
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
    TResult? Function(_FacturaScriptsProductDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto() when $default != null:
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
            String referencia,
            @JsonKey(fromJson: lenientString) String descripcion,
            @JsonKey(fromJson: lenientDouble) double precio,
            String? codimpuesto,
            @JsonKey(fromJson: lenientDouble) double stockfis,
            @JsonKey(fromJson: lenientBool) bool bloqueado,
            @JsonKey(fromJson: lenientBoolTrue) bool sevende)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto() when $default != null:
        return $default(_that.referencia, _that.descripcion, _that.precio,
            _that.codimpuesto, _that.stockfis, _that.bloqueado, _that.sevende);
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
            String referencia,
            @JsonKey(fromJson: lenientString) String descripcion,
            @JsonKey(fromJson: lenientDouble) double precio,
            String? codimpuesto,
            @JsonKey(fromJson: lenientDouble) double stockfis,
            @JsonKey(fromJson: lenientBool) bool bloqueado,
            @JsonKey(fromJson: lenientBoolTrue) bool sevende)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto():
        return $default(_that.referencia, _that.descripcion, _that.precio,
            _that.codimpuesto, _that.stockfis, _that.bloqueado, _that.sevende);
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
            String referencia,
            @JsonKey(fromJson: lenientString) String descripcion,
            @JsonKey(fromJson: lenientDouble) double precio,
            String? codimpuesto,
            @JsonKey(fromJson: lenientDouble) double stockfis,
            @JsonKey(fromJson: lenientBool) bool bloqueado,
            @JsonKey(fromJson: lenientBoolTrue) bool sevende)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsProductDto() when $default != null:
        return $default(_that.referencia, _that.descripcion, _that.precio,
            _that.codimpuesto, _that.stockfis, _that.bloqueado, _that.sevende);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacturaScriptsProductDto implements FacturaScriptsProductDto {
  const _FacturaScriptsProductDto(
      {required this.referencia,
      @JsonKey(fromJson: lenientString) this.descripcion = '',
      @JsonKey(fromJson: lenientDouble) this.precio = 0.0,
      this.codimpuesto,
      @JsonKey(fromJson: lenientDouble) this.stockfis = 0.0,
      @JsonKey(fromJson: lenientBool) this.bloqueado = false,
      @JsonKey(fromJson: lenientBoolTrue) this.sevende = true});
  factory _FacturaScriptsProductDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsProductDtoFromJson(json);

  @override
  final String referencia;
  @override
  @JsonKey(fromJson: lenientString)
  final String descripcion;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double precio;
  @override
  final String? codimpuesto;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double stockfis;
  @override
  @JsonKey(fromJson: lenientBool)
  final bool bloqueado;
  @override
  @JsonKey(fromJson: lenientBoolTrue)
  final bool sevende;

  /// Create a copy of FacturaScriptsProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacturaScriptsProductDtoCopyWith<_FacturaScriptsProductDto> get copyWith =>
      __$FacturaScriptsProductDtoCopyWithImpl<_FacturaScriptsProductDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacturaScriptsProductDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacturaScriptsProductDto &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.descripcion, descripcion) ||
                other.descripcion == descripcion) &&
            (identical(other.precio, precio) || other.precio == precio) &&
            (identical(other.codimpuesto, codimpuesto) ||
                other.codimpuesto == codimpuesto) &&
            (identical(other.stockfis, stockfis) ||
                other.stockfis == stockfis) &&
            (identical(other.bloqueado, bloqueado) ||
                other.bloqueado == bloqueado) &&
            (identical(other.sevende, sevende) || other.sevende == sevende));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referencia, descripcion, precio,
      codimpuesto, stockfis, bloqueado, sevende);

  @override
  String toString() {
    return 'FacturaScriptsProductDto(referencia: $referencia, descripcion: $descripcion, precio: $precio, codimpuesto: $codimpuesto, stockfis: $stockfis, bloqueado: $bloqueado, sevende: $sevende)';
  }
}

/// @nodoc
abstract mixin class _$FacturaScriptsProductDtoCopyWith<$Res>
    implements $FacturaScriptsProductDtoCopyWith<$Res> {
  factory _$FacturaScriptsProductDtoCopyWith(_FacturaScriptsProductDto value,
          $Res Function(_FacturaScriptsProductDto) _then) =
      __$FacturaScriptsProductDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientString) String descripcion,
      @JsonKey(fromJson: lenientDouble) double precio,
      String? codimpuesto,
      @JsonKey(fromJson: lenientDouble) double stockfis,
      @JsonKey(fromJson: lenientBool) bool bloqueado,
      @JsonKey(fromJson: lenientBoolTrue) bool sevende});
}

/// @nodoc
class __$FacturaScriptsProductDtoCopyWithImpl<$Res>
    implements _$FacturaScriptsProductDtoCopyWith<$Res> {
  __$FacturaScriptsProductDtoCopyWithImpl(this._self, this._then);

  final _FacturaScriptsProductDto _self;
  final $Res Function(_FacturaScriptsProductDto) _then;

  /// Create a copy of FacturaScriptsProductDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? referencia = null,
    Object? descripcion = null,
    Object? precio = null,
    Object? codimpuesto = freezed,
    Object? stockfis = null,
    Object? bloqueado = null,
    Object? sevende = null,
  }) {
    return _then(_FacturaScriptsProductDto(
      referencia: null == referencia
          ? _self.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _self.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _self.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codimpuesto: freezed == codimpuesto
          ? _self.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String?,
      stockfis: null == stockfis
          ? _self.stockfis
          : stockfis // ignore: cast_nullable_to_non_nullable
              as double,
      bloqueado: null == bloqueado
          ? _self.bloqueado
          : bloqueado // ignore: cast_nullable_to_non_nullable
              as bool,
      sevende: null == sevende
          ? _self.sevende
          : sevende // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FacturaScriptsTaxDto {
  String get codimpuesto;
  @JsonKey(fromJson: lenientDouble)
  double get iva;

  /// Create a copy of FacturaScriptsTaxDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacturaScriptsTaxDtoCopyWith<FacturaScriptsTaxDto> get copyWith =>
      _$FacturaScriptsTaxDtoCopyWithImpl<FacturaScriptsTaxDto>(
          this as FacturaScriptsTaxDto, _$identity);

  /// Serializes this FacturaScriptsTaxDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacturaScriptsTaxDto &&
            (identical(other.codimpuesto, codimpuesto) ||
                other.codimpuesto == codimpuesto) &&
            (identical(other.iva, iva) || other.iva == iva));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, codimpuesto, iva);

  @override
  String toString() {
    return 'FacturaScriptsTaxDto(codimpuesto: $codimpuesto, iva: $iva)';
  }
}

/// @nodoc
abstract mixin class $FacturaScriptsTaxDtoCopyWith<$Res> {
  factory $FacturaScriptsTaxDtoCopyWith(FacturaScriptsTaxDto value,
          $Res Function(FacturaScriptsTaxDto) _then) =
      _$FacturaScriptsTaxDtoCopyWithImpl;
  @useResult
  $Res call({String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva});
}

/// @nodoc
class _$FacturaScriptsTaxDtoCopyWithImpl<$Res>
    implements $FacturaScriptsTaxDtoCopyWith<$Res> {
  _$FacturaScriptsTaxDtoCopyWithImpl(this._self, this._then);

  final FacturaScriptsTaxDto _self;
  final $Res Function(FacturaScriptsTaxDto) _then;

  /// Create a copy of FacturaScriptsTaxDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codimpuesto = null,
    Object? iva = null,
  }) {
    return _then(_self.copyWith(
      codimpuesto: null == codimpuesto
          ? _self.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String,
      iva: null == iva
          ? _self.iva
          : iva // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacturaScriptsTaxDto].
extension FacturaScriptsTaxDtoPatterns on FacturaScriptsTaxDto {
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
    TResult Function(_FacturaScriptsTaxDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto() when $default != null:
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
    TResult Function(_FacturaScriptsTaxDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto():
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
    TResult? Function(_FacturaScriptsTaxDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto() when $default != null:
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
            String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto() when $default != null:
        return $default(_that.codimpuesto, _that.iva);
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
            String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto():
        return $default(_that.codimpuesto, _that.iva);
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
            String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsTaxDto() when $default != null:
        return $default(_that.codimpuesto, _that.iva);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacturaScriptsTaxDto implements FacturaScriptsTaxDto {
  const _FacturaScriptsTaxDto(
      {required this.codimpuesto,
      @JsonKey(fromJson: lenientDouble) this.iva = 0.0});
  factory _FacturaScriptsTaxDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsTaxDtoFromJson(json);

  @override
  final String codimpuesto;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double iva;

  /// Create a copy of FacturaScriptsTaxDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacturaScriptsTaxDtoCopyWith<_FacturaScriptsTaxDto> get copyWith =>
      __$FacturaScriptsTaxDtoCopyWithImpl<_FacturaScriptsTaxDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacturaScriptsTaxDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacturaScriptsTaxDto &&
            (identical(other.codimpuesto, codimpuesto) ||
                other.codimpuesto == codimpuesto) &&
            (identical(other.iva, iva) || other.iva == iva));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, codimpuesto, iva);

  @override
  String toString() {
    return 'FacturaScriptsTaxDto(codimpuesto: $codimpuesto, iva: $iva)';
  }
}

/// @nodoc
abstract mixin class _$FacturaScriptsTaxDtoCopyWith<$Res>
    implements $FacturaScriptsTaxDtoCopyWith<$Res> {
  factory _$FacturaScriptsTaxDtoCopyWith(_FacturaScriptsTaxDto value,
          $Res Function(_FacturaScriptsTaxDto) _then) =
      __$FacturaScriptsTaxDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva});
}

/// @nodoc
class __$FacturaScriptsTaxDtoCopyWithImpl<$Res>
    implements _$FacturaScriptsTaxDtoCopyWith<$Res> {
  __$FacturaScriptsTaxDtoCopyWithImpl(this._self, this._then);

  final _FacturaScriptsTaxDto _self;
  final $Res Function(_FacturaScriptsTaxDto) _then;

  /// Create a copy of FacturaScriptsTaxDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? codimpuesto = null,
    Object? iva = null,
  }) {
    return _then(_FacturaScriptsTaxDto(
      codimpuesto: null == codimpuesto
          ? _self.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String,
      iva: null == iva
          ? _self.iva
          : iva // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$FacturaScriptsStockDto {
  String get referencia;
  @JsonKey(fromJson: lenientDouble)
  double get cantidad;
  @JsonKey(fromJson: lenientDouble)
  double get disponible;

  /// Create a copy of FacturaScriptsStockDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacturaScriptsStockDtoCopyWith<FacturaScriptsStockDto> get copyWith =>
      _$FacturaScriptsStockDtoCopyWithImpl<FacturaScriptsStockDto>(
          this as FacturaScriptsStockDto, _$identity);

  /// Serializes this FacturaScriptsStockDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacturaScriptsStockDto &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.disponible, disponible) ||
                other.disponible == disponible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, referencia, cantidad, disponible);

  @override
  String toString() {
    return 'FacturaScriptsStockDto(referencia: $referencia, cantidad: $cantidad, disponible: $disponible)';
  }
}

/// @nodoc
abstract mixin class $FacturaScriptsStockDtoCopyWith<$Res> {
  factory $FacturaScriptsStockDtoCopyWith(FacturaScriptsStockDto value,
          $Res Function(FacturaScriptsStockDto) _then) =
      _$FacturaScriptsStockDtoCopyWithImpl;
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientDouble) double cantidad,
      @JsonKey(fromJson: lenientDouble) double disponible});
}

/// @nodoc
class _$FacturaScriptsStockDtoCopyWithImpl<$Res>
    implements $FacturaScriptsStockDtoCopyWith<$Res> {
  _$FacturaScriptsStockDtoCopyWithImpl(this._self, this._then);

  final FacturaScriptsStockDto _self;
  final $Res Function(FacturaScriptsStockDto) _then;

  /// Create a copy of FacturaScriptsStockDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? cantidad = null,
    Object? disponible = null,
  }) {
    return _then(_self.copyWith(
      referencia: null == referencia
          ? _self.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _self.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      disponible: null == disponible
          ? _self.disponible
          : disponible // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [FacturaScriptsStockDto].
extension FacturaScriptsStockDtoPatterns on FacturaScriptsStockDto {
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
    TResult Function(_FacturaScriptsStockDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto() when $default != null:
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
    TResult Function(_FacturaScriptsStockDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto():
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
    TResult? Function(_FacturaScriptsStockDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto() when $default != null:
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
            String referencia,
            @JsonKey(fromJson: lenientDouble) double cantidad,
            @JsonKey(fromJson: lenientDouble) double disponible)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto() when $default != null:
        return $default(_that.referencia, _that.cantidad, _that.disponible);
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
            String referencia,
            @JsonKey(fromJson: lenientDouble) double cantidad,
            @JsonKey(fromJson: lenientDouble) double disponible)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto():
        return $default(_that.referencia, _that.cantidad, _that.disponible);
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
            String referencia,
            @JsonKey(fromJson: lenientDouble) double cantidad,
            @JsonKey(fromJson: lenientDouble) double disponible)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacturaScriptsStockDto() when $default != null:
        return $default(_that.referencia, _that.cantidad, _that.disponible);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FacturaScriptsStockDto implements FacturaScriptsStockDto {
  const _FacturaScriptsStockDto(
      {required this.referencia,
      @JsonKey(fromJson: lenientDouble) this.cantidad = 0.0,
      @JsonKey(fromJson: lenientDouble) this.disponible = 0.0});
  factory _FacturaScriptsStockDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsStockDtoFromJson(json);

  @override
  final String referencia;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double cantidad;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double disponible;

  /// Create a copy of FacturaScriptsStockDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacturaScriptsStockDtoCopyWith<_FacturaScriptsStockDto> get copyWith =>
      __$FacturaScriptsStockDtoCopyWithImpl<_FacturaScriptsStockDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FacturaScriptsStockDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacturaScriptsStockDto &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.disponible, disponible) ||
                other.disponible == disponible));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, referencia, cantidad, disponible);

  @override
  String toString() {
    return 'FacturaScriptsStockDto(referencia: $referencia, cantidad: $cantidad, disponible: $disponible)';
  }
}

/// @nodoc
abstract mixin class _$FacturaScriptsStockDtoCopyWith<$Res>
    implements $FacturaScriptsStockDtoCopyWith<$Res> {
  factory _$FacturaScriptsStockDtoCopyWith(_FacturaScriptsStockDto value,
          $Res Function(_FacturaScriptsStockDto) _then) =
      __$FacturaScriptsStockDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientDouble) double cantidad,
      @JsonKey(fromJson: lenientDouble) double disponible});
}

/// @nodoc
class __$FacturaScriptsStockDtoCopyWithImpl<$Res>
    implements _$FacturaScriptsStockDtoCopyWith<$Res> {
  __$FacturaScriptsStockDtoCopyWithImpl(this._self, this._then);

  final _FacturaScriptsStockDto _self;
  final $Res Function(_FacturaScriptsStockDto) _then;

  /// Create a copy of FacturaScriptsStockDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? referencia = null,
    Object? cantidad = null,
    Object? disponible = null,
  }) {
    return _then(_FacturaScriptsStockDto(
      referencia: null == referencia
          ? _self.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _self.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      disponible: null == disponible
          ? _self.disponible
          : disponible // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
