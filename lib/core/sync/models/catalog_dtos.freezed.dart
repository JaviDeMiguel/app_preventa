// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacturaScriptsClientDto _$FacturaScriptsClientDtoFromJson(
    Map<String, dynamic> json) {
  return _FacturaScriptsClientDto.fromJson(json);
}

/// @nodoc
mixin _$FacturaScriptsClientDto {
  String get codcliente => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientString)
  String get cifnif => throw _privateConstructorUsedError;
  String? get telefono1 => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get riesgomax => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get riesgoalcanzado => throw _privateConstructorUsedError;
  String? get codtarifa => throw _privateConstructorUsedError;
  String? get regimeniva => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientBool)
  bool get debaja => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacturaScriptsClientDtoCopyWith<FacturaScriptsClientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacturaScriptsClientDtoCopyWith<$Res> {
  factory $FacturaScriptsClientDtoCopyWith(FacturaScriptsClientDto value,
          $Res Function(FacturaScriptsClientDto) then) =
      _$FacturaScriptsClientDtoCopyWithImpl<$Res, FacturaScriptsClientDto>;
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
class _$FacturaScriptsClientDtoCopyWithImpl<$Res,
        $Val extends FacturaScriptsClientDto>
    implements $FacturaScriptsClientDtoCopyWith<$Res> {
  _$FacturaScriptsClientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      codcliente: null == codcliente
          ? _value.codcliente
          : codcliente // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      cifnif: null == cifnif
          ? _value.cifnif
          : cifnif // ignore: cast_nullable_to_non_nullable
              as String,
      telefono1: freezed == telefono1
          ? _value.telefono1
          : telefono1 // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      riesgomax: null == riesgomax
          ? _value.riesgomax
          : riesgomax // ignore: cast_nullable_to_non_nullable
              as double,
      riesgoalcanzado: null == riesgoalcanzado
          ? _value.riesgoalcanzado
          : riesgoalcanzado // ignore: cast_nullable_to_non_nullable
              as double,
      codtarifa: freezed == codtarifa
          ? _value.codtarifa
          : codtarifa // ignore: cast_nullable_to_non_nullable
              as String?,
      regimeniva: freezed == regimeniva
          ? _value.regimeniva
          : regimeniva // ignore: cast_nullable_to_non_nullable
              as String?,
      debaja: null == debaja
          ? _value.debaja
          : debaja // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacturaScriptsClientDtoImplCopyWith<$Res>
    implements $FacturaScriptsClientDtoCopyWith<$Res> {
  factory _$$FacturaScriptsClientDtoImplCopyWith(
          _$FacturaScriptsClientDtoImpl value,
          $Res Function(_$FacturaScriptsClientDtoImpl) then) =
      __$$FacturaScriptsClientDtoImplCopyWithImpl<$Res>;
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
class __$$FacturaScriptsClientDtoImplCopyWithImpl<$Res>
    extends _$FacturaScriptsClientDtoCopyWithImpl<$Res,
        _$FacturaScriptsClientDtoImpl>
    implements _$$FacturaScriptsClientDtoImplCopyWith<$Res> {
  __$$FacturaScriptsClientDtoImplCopyWithImpl(
      _$FacturaScriptsClientDtoImpl _value,
      $Res Function(_$FacturaScriptsClientDtoImpl) _then)
      : super(_value, _then);

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
    return _then(_$FacturaScriptsClientDtoImpl(
      codcliente: null == codcliente
          ? _value.codcliente
          : codcliente // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      cifnif: null == cifnif
          ? _value.cifnif
          : cifnif // ignore: cast_nullable_to_non_nullable
              as String,
      telefono1: freezed == telefono1
          ? _value.telefono1
          : telefono1 // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      riesgomax: null == riesgomax
          ? _value.riesgomax
          : riesgomax // ignore: cast_nullable_to_non_nullable
              as double,
      riesgoalcanzado: null == riesgoalcanzado
          ? _value.riesgoalcanzado
          : riesgoalcanzado // ignore: cast_nullable_to_non_nullable
              as double,
      codtarifa: freezed == codtarifa
          ? _value.codtarifa
          : codtarifa // ignore: cast_nullable_to_non_nullable
              as String?,
      regimeniva: freezed == regimeniva
          ? _value.regimeniva
          : regimeniva // ignore: cast_nullable_to_non_nullable
              as String?,
      debaja: null == debaja
          ? _value.debaja
          : debaja // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacturaScriptsClientDtoImpl extends _FacturaScriptsClientDto {
  const _$FacturaScriptsClientDtoImpl(
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

  factory _$FacturaScriptsClientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacturaScriptsClientDtoImplFromJson(json);

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

  @override
  String toString() {
    return 'FacturaScriptsClientDto(codcliente: $codcliente, nombre: $nombre, cifnif: $cifnif, telefono1: $telefono1, email: $email, riesgomax: $riesgomax, riesgoalcanzado: $riesgoalcanzado, codtarifa: $codtarifa, regimeniva: $regimeniva, debaja: $debaja)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacturaScriptsClientDtoImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacturaScriptsClientDtoImplCopyWith<_$FacturaScriptsClientDtoImpl>
      get copyWith => __$$FacturaScriptsClientDtoImplCopyWithImpl<
          _$FacturaScriptsClientDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacturaScriptsClientDtoImplToJson(
      this,
    );
  }
}

abstract class _FacturaScriptsClientDto extends FacturaScriptsClientDto {
  const factory _FacturaScriptsClientDto(
          {required final String codcliente,
          required final String nombre,
          @JsonKey(fromJson: lenientString) final String cifnif,
          final String? telefono1,
          final String? email,
          @JsonKey(fromJson: lenientDouble) final double riesgomax,
          @JsonKey(fromJson: lenientDouble) final double riesgoalcanzado,
          final String? codtarifa,
          final String? regimeniva,
          @JsonKey(fromJson: lenientBool) final bool debaja}) =
      _$FacturaScriptsClientDtoImpl;
  const _FacturaScriptsClientDto._() : super._();

  factory _FacturaScriptsClientDto.fromJson(Map<String, dynamic> json) =
      _$FacturaScriptsClientDtoImpl.fromJson;

  @override
  String get codcliente;
  @override
  String get nombre;
  @override
  @JsonKey(fromJson: lenientString)
  String get cifnif;
  @override
  String? get telefono1;
  @override
  String? get email;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get riesgomax;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get riesgoalcanzado;
  @override
  String? get codtarifa;
  @override
  String? get regimeniva;
  @override
  @JsonKey(fromJson: lenientBool)
  bool get debaja;
  @override
  @JsonKey(ignore: true)
  _$$FacturaScriptsClientDtoImplCopyWith<_$FacturaScriptsClientDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FacturaScriptsProductDto _$FacturaScriptsProductDtoFromJson(
    Map<String, dynamic> json) {
  return _FacturaScriptsProductDto.fromJson(json);
}

/// @nodoc
mixin _$FacturaScriptsProductDto {
  String get referencia => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientString)
  String get descripcion => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get precio => throw _privateConstructorUsedError;
  String? get codimpuesto => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get stockfis => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientBool)
  bool get bloqueado => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientBoolTrue)
  bool get sevende => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacturaScriptsProductDtoCopyWith<FacturaScriptsProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacturaScriptsProductDtoCopyWith<$Res> {
  factory $FacturaScriptsProductDtoCopyWith(FacturaScriptsProductDto value,
          $Res Function(FacturaScriptsProductDto) then) =
      _$FacturaScriptsProductDtoCopyWithImpl<$Res, FacturaScriptsProductDto>;
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
class _$FacturaScriptsProductDtoCopyWithImpl<$Res,
        $Val extends FacturaScriptsProductDto>
    implements $FacturaScriptsProductDtoCopyWith<$Res> {
  _$FacturaScriptsProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _value.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codimpuesto: freezed == codimpuesto
          ? _value.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String?,
      stockfis: null == stockfis
          ? _value.stockfis
          : stockfis // ignore: cast_nullable_to_non_nullable
              as double,
      bloqueado: null == bloqueado
          ? _value.bloqueado
          : bloqueado // ignore: cast_nullable_to_non_nullable
              as bool,
      sevende: null == sevende
          ? _value.sevende
          : sevende // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacturaScriptsProductDtoImplCopyWith<$Res>
    implements $FacturaScriptsProductDtoCopyWith<$Res> {
  factory _$$FacturaScriptsProductDtoImplCopyWith(
          _$FacturaScriptsProductDtoImpl value,
          $Res Function(_$FacturaScriptsProductDtoImpl) then) =
      __$$FacturaScriptsProductDtoImplCopyWithImpl<$Res>;
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
class __$$FacturaScriptsProductDtoImplCopyWithImpl<$Res>
    extends _$FacturaScriptsProductDtoCopyWithImpl<$Res,
        _$FacturaScriptsProductDtoImpl>
    implements _$$FacturaScriptsProductDtoImplCopyWith<$Res> {
  __$$FacturaScriptsProductDtoImplCopyWithImpl(
      _$FacturaScriptsProductDtoImpl _value,
      $Res Function(_$FacturaScriptsProductDtoImpl) _then)
      : super(_value, _then);

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
    return _then(_$FacturaScriptsProductDtoImpl(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      descripcion: null == descripcion
          ? _value.descripcion
          : descripcion // ignore: cast_nullable_to_non_nullable
              as String,
      precio: null == precio
          ? _value.precio
          : precio // ignore: cast_nullable_to_non_nullable
              as double,
      codimpuesto: freezed == codimpuesto
          ? _value.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String?,
      stockfis: null == stockfis
          ? _value.stockfis
          : stockfis // ignore: cast_nullable_to_non_nullable
              as double,
      bloqueado: null == bloqueado
          ? _value.bloqueado
          : bloqueado // ignore: cast_nullable_to_non_nullable
              as bool,
      sevende: null == sevende
          ? _value.sevende
          : sevende // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacturaScriptsProductDtoImpl implements _FacturaScriptsProductDto {
  const _$FacturaScriptsProductDtoImpl(
      {required this.referencia,
      @JsonKey(fromJson: lenientString) this.descripcion = '',
      @JsonKey(fromJson: lenientDouble) this.precio = 0.0,
      this.codimpuesto,
      @JsonKey(fromJson: lenientDouble) this.stockfis = 0.0,
      @JsonKey(fromJson: lenientBool) this.bloqueado = false,
      @JsonKey(fromJson: lenientBoolTrue) this.sevende = true});

  factory _$FacturaScriptsProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacturaScriptsProductDtoImplFromJson(json);

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

  @override
  String toString() {
    return 'FacturaScriptsProductDto(referencia: $referencia, descripcion: $descripcion, precio: $precio, codimpuesto: $codimpuesto, stockfis: $stockfis, bloqueado: $bloqueado, sevende: $sevende)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacturaScriptsProductDtoImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, referencia, descripcion, precio,
      codimpuesto, stockfis, bloqueado, sevende);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacturaScriptsProductDtoImplCopyWith<_$FacturaScriptsProductDtoImpl>
      get copyWith => __$$FacturaScriptsProductDtoImplCopyWithImpl<
          _$FacturaScriptsProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacturaScriptsProductDtoImplToJson(
      this,
    );
  }
}

abstract class _FacturaScriptsProductDto implements FacturaScriptsProductDto {
  const factory _FacturaScriptsProductDto(
          {required final String referencia,
          @JsonKey(fromJson: lenientString) final String descripcion,
          @JsonKey(fromJson: lenientDouble) final double precio,
          final String? codimpuesto,
          @JsonKey(fromJson: lenientDouble) final double stockfis,
          @JsonKey(fromJson: lenientBool) final bool bloqueado,
          @JsonKey(fromJson: lenientBoolTrue) final bool sevende}) =
      _$FacturaScriptsProductDtoImpl;

  factory _FacturaScriptsProductDto.fromJson(Map<String, dynamic> json) =
      _$FacturaScriptsProductDtoImpl.fromJson;

  @override
  String get referencia;
  @override
  @JsonKey(fromJson: lenientString)
  String get descripcion;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get precio;
  @override
  String? get codimpuesto;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get stockfis;
  @override
  @JsonKey(fromJson: lenientBool)
  bool get bloqueado;
  @override
  @JsonKey(fromJson: lenientBoolTrue)
  bool get sevende;
  @override
  @JsonKey(ignore: true)
  _$$FacturaScriptsProductDtoImplCopyWith<_$FacturaScriptsProductDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FacturaScriptsTaxDto _$FacturaScriptsTaxDtoFromJson(Map<String, dynamic> json) {
  return _FacturaScriptsTaxDto.fromJson(json);
}

/// @nodoc
mixin _$FacturaScriptsTaxDto {
  String get codimpuesto => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get iva => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacturaScriptsTaxDtoCopyWith<FacturaScriptsTaxDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacturaScriptsTaxDtoCopyWith<$Res> {
  factory $FacturaScriptsTaxDtoCopyWith(FacturaScriptsTaxDto value,
          $Res Function(FacturaScriptsTaxDto) then) =
      _$FacturaScriptsTaxDtoCopyWithImpl<$Res, FacturaScriptsTaxDto>;
  @useResult
  $Res call({String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva});
}

/// @nodoc
class _$FacturaScriptsTaxDtoCopyWithImpl<$Res,
        $Val extends FacturaScriptsTaxDto>
    implements $FacturaScriptsTaxDtoCopyWith<$Res> {
  _$FacturaScriptsTaxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codimpuesto = null,
    Object? iva = null,
  }) {
    return _then(_value.copyWith(
      codimpuesto: null == codimpuesto
          ? _value.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String,
      iva: null == iva
          ? _value.iva
          : iva // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacturaScriptsTaxDtoImplCopyWith<$Res>
    implements $FacturaScriptsTaxDtoCopyWith<$Res> {
  factory _$$FacturaScriptsTaxDtoImplCopyWith(_$FacturaScriptsTaxDtoImpl value,
          $Res Function(_$FacturaScriptsTaxDtoImpl) then) =
      __$$FacturaScriptsTaxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codimpuesto, @JsonKey(fromJson: lenientDouble) double iva});
}

/// @nodoc
class __$$FacturaScriptsTaxDtoImplCopyWithImpl<$Res>
    extends _$FacturaScriptsTaxDtoCopyWithImpl<$Res, _$FacturaScriptsTaxDtoImpl>
    implements _$$FacturaScriptsTaxDtoImplCopyWith<$Res> {
  __$$FacturaScriptsTaxDtoImplCopyWithImpl(_$FacturaScriptsTaxDtoImpl _value,
      $Res Function(_$FacturaScriptsTaxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codimpuesto = null,
    Object? iva = null,
  }) {
    return _then(_$FacturaScriptsTaxDtoImpl(
      codimpuesto: null == codimpuesto
          ? _value.codimpuesto
          : codimpuesto // ignore: cast_nullable_to_non_nullable
              as String,
      iva: null == iva
          ? _value.iva
          : iva // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacturaScriptsTaxDtoImpl implements _FacturaScriptsTaxDto {
  const _$FacturaScriptsTaxDtoImpl(
      {required this.codimpuesto,
      @JsonKey(fromJson: lenientDouble) this.iva = 0.0});

  factory _$FacturaScriptsTaxDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacturaScriptsTaxDtoImplFromJson(json);

  @override
  final String codimpuesto;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double iva;

  @override
  String toString() {
    return 'FacturaScriptsTaxDto(codimpuesto: $codimpuesto, iva: $iva)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacturaScriptsTaxDtoImpl &&
            (identical(other.codimpuesto, codimpuesto) ||
                other.codimpuesto == codimpuesto) &&
            (identical(other.iva, iva) || other.iva == iva));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, codimpuesto, iva);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacturaScriptsTaxDtoImplCopyWith<_$FacturaScriptsTaxDtoImpl>
      get copyWith =>
          __$$FacturaScriptsTaxDtoImplCopyWithImpl<_$FacturaScriptsTaxDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacturaScriptsTaxDtoImplToJson(
      this,
    );
  }
}

abstract class _FacturaScriptsTaxDto implements FacturaScriptsTaxDto {
  const factory _FacturaScriptsTaxDto(
          {required final String codimpuesto,
          @JsonKey(fromJson: lenientDouble) final double iva}) =
      _$FacturaScriptsTaxDtoImpl;

  factory _FacturaScriptsTaxDto.fromJson(Map<String, dynamic> json) =
      _$FacturaScriptsTaxDtoImpl.fromJson;

  @override
  String get codimpuesto;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get iva;
  @override
  @JsonKey(ignore: true)
  _$$FacturaScriptsTaxDtoImplCopyWith<_$FacturaScriptsTaxDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FacturaScriptsStockDto _$FacturaScriptsStockDtoFromJson(
    Map<String, dynamic> json) {
  return _FacturaScriptsStockDto.fromJson(json);
}

/// @nodoc
mixin _$FacturaScriptsStockDto {
  String get referencia => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get cantidad => throw _privateConstructorUsedError;
  @JsonKey(fromJson: lenientDouble)
  double get disponible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacturaScriptsStockDtoCopyWith<FacturaScriptsStockDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacturaScriptsStockDtoCopyWith<$Res> {
  factory $FacturaScriptsStockDtoCopyWith(FacturaScriptsStockDto value,
          $Res Function(FacturaScriptsStockDto) then) =
      _$FacturaScriptsStockDtoCopyWithImpl<$Res, FacturaScriptsStockDto>;
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientDouble) double cantidad,
      @JsonKey(fromJson: lenientDouble) double disponible});
}

/// @nodoc
class _$FacturaScriptsStockDtoCopyWithImpl<$Res,
        $Val extends FacturaScriptsStockDto>
    implements $FacturaScriptsStockDtoCopyWith<$Res> {
  _$FacturaScriptsStockDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? cantidad = null,
    Object? disponible = null,
  }) {
    return _then(_value.copyWith(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      disponible: null == disponible
          ? _value.disponible
          : disponible // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacturaScriptsStockDtoImplCopyWith<$Res>
    implements $FacturaScriptsStockDtoCopyWith<$Res> {
  factory _$$FacturaScriptsStockDtoImplCopyWith(
          _$FacturaScriptsStockDtoImpl value,
          $Res Function(_$FacturaScriptsStockDtoImpl) then) =
      __$$FacturaScriptsStockDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String referencia,
      @JsonKey(fromJson: lenientDouble) double cantidad,
      @JsonKey(fromJson: lenientDouble) double disponible});
}

/// @nodoc
class __$$FacturaScriptsStockDtoImplCopyWithImpl<$Res>
    extends _$FacturaScriptsStockDtoCopyWithImpl<$Res,
        _$FacturaScriptsStockDtoImpl>
    implements _$$FacturaScriptsStockDtoImplCopyWith<$Res> {
  __$$FacturaScriptsStockDtoImplCopyWithImpl(
      _$FacturaScriptsStockDtoImpl _value,
      $Res Function(_$FacturaScriptsStockDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referencia = null,
    Object? cantidad = null,
    Object? disponible = null,
  }) {
    return _then(_$FacturaScriptsStockDtoImpl(
      referencia: null == referencia
          ? _value.referencia
          : referencia // ignore: cast_nullable_to_non_nullable
              as String,
      cantidad: null == cantidad
          ? _value.cantidad
          : cantidad // ignore: cast_nullable_to_non_nullable
              as double,
      disponible: null == disponible
          ? _value.disponible
          : disponible // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacturaScriptsStockDtoImpl implements _FacturaScriptsStockDto {
  const _$FacturaScriptsStockDtoImpl(
      {required this.referencia,
      @JsonKey(fromJson: lenientDouble) this.cantidad = 0.0,
      @JsonKey(fromJson: lenientDouble) this.disponible = 0.0});

  factory _$FacturaScriptsStockDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacturaScriptsStockDtoImplFromJson(json);

  @override
  final String referencia;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double cantidad;
  @override
  @JsonKey(fromJson: lenientDouble)
  final double disponible;

  @override
  String toString() {
    return 'FacturaScriptsStockDto(referencia: $referencia, cantidad: $cantidad, disponible: $disponible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacturaScriptsStockDtoImpl &&
            (identical(other.referencia, referencia) ||
                other.referencia == referencia) &&
            (identical(other.cantidad, cantidad) ||
                other.cantidad == cantidad) &&
            (identical(other.disponible, disponible) ||
                other.disponible == disponible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, referencia, cantidad, disponible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacturaScriptsStockDtoImplCopyWith<_$FacturaScriptsStockDtoImpl>
      get copyWith => __$$FacturaScriptsStockDtoImplCopyWithImpl<
          _$FacturaScriptsStockDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacturaScriptsStockDtoImplToJson(
      this,
    );
  }
}

abstract class _FacturaScriptsStockDto implements FacturaScriptsStockDto {
  const factory _FacturaScriptsStockDto(
          {required final String referencia,
          @JsonKey(fromJson: lenientDouble) final double cantidad,
          @JsonKey(fromJson: lenientDouble) final double disponible}) =
      _$FacturaScriptsStockDtoImpl;

  factory _FacturaScriptsStockDto.fromJson(Map<String, dynamic> json) =
      _$FacturaScriptsStockDtoImpl.fromJson;

  @override
  String get referencia;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get cantidad;
  @override
  @JsonKey(fromJson: lenientDouble)
  double get disponible;
  @override
  @JsonKey(ignore: true)
  _$$FacturaScriptsStockDtoImplCopyWith<_$FacturaScriptsStockDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
