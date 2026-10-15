// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacturaScriptsClientDtoImpl _$$FacturaScriptsClientDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FacturaScriptsClientDtoImpl(
      codcliente: json['codcliente'] as String,
      nombre: json['nombre'] as String,
      cifnif: json['cifnif'] == null ? '' : lenientString(json['cifnif']),
      telefono1: json['telefono1'] as String?,
      email: json['email'] as String?,
      riesgomax:
          json['riesgomax'] == null ? 0.0 : lenientDouble(json['riesgomax']),
      riesgoalcanzado: json['riesgoalcanzado'] == null
          ? 0.0
          : lenientDouble(json['riesgoalcanzado']),
      codtarifa: json['codtarifa'] as String?,
      regimeniva: json['regimeniva'] as String?,
      debaja: json['debaja'] == null ? false : lenientBool(json['debaja']),
    );

Map<String, dynamic> _$$FacturaScriptsClientDtoImplToJson(
        _$FacturaScriptsClientDtoImpl instance) =>
    <String, dynamic>{
      'codcliente': instance.codcliente,
      'nombre': instance.nombre,
      'cifnif': instance.cifnif,
      'telefono1': instance.telefono1,
      'email': instance.email,
      'riesgomax': instance.riesgomax,
      'riesgoalcanzado': instance.riesgoalcanzado,
      'codtarifa': instance.codtarifa,
      'regimeniva': instance.regimeniva,
      'debaja': instance.debaja,
    };

_$FacturaScriptsProductDtoImpl _$$FacturaScriptsProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FacturaScriptsProductDtoImpl(
      referencia: json['referencia'] as String,
      descripcion:
          json['descripcion'] == null ? '' : lenientString(json['descripcion']),
      precio: json['precio'] == null ? 0.0 : lenientDouble(json['precio']),
      codimpuesto: json['codimpuesto'] as String?,
      stockfis:
          json['stockfis'] == null ? 0.0 : lenientDouble(json['stockfis']),
      bloqueado:
          json['bloqueado'] == null ? false : lenientBool(json['bloqueado']),
      sevende:
          json['sevende'] == null ? true : lenientBoolTrue(json['sevende']),
    );

Map<String, dynamic> _$$FacturaScriptsProductDtoImplToJson(
        _$FacturaScriptsProductDtoImpl instance) =>
    <String, dynamic>{
      'referencia': instance.referencia,
      'descripcion': instance.descripcion,
      'precio': instance.precio,
      'codimpuesto': instance.codimpuesto,
      'stockfis': instance.stockfis,
      'bloqueado': instance.bloqueado,
      'sevende': instance.sevende,
    };

_$FacturaScriptsTaxDtoImpl _$$FacturaScriptsTaxDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FacturaScriptsTaxDtoImpl(
      codimpuesto: json['codimpuesto'] as String,
      iva: json['iva'] == null ? 0.0 : lenientDouble(json['iva']),
    );

Map<String, dynamic> _$$FacturaScriptsTaxDtoImplToJson(
        _$FacturaScriptsTaxDtoImpl instance) =>
    <String, dynamic>{
      'codimpuesto': instance.codimpuesto,
      'iva': instance.iva,
    };

_$FacturaScriptsStockDtoImpl _$$FacturaScriptsStockDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FacturaScriptsStockDtoImpl(
      referencia: json['referencia'] as String,
      cantidad:
          json['cantidad'] == null ? 0.0 : lenientDouble(json['cantidad']),
      disponible:
          json['disponible'] == null ? 0.0 : lenientDouble(json['disponible']),
    );

Map<String, dynamic> _$$FacturaScriptsStockDtoImplToJson(
        _$FacturaScriptsStockDtoImpl instance) =>
    <String, dynamic>{
      'referencia': instance.referencia,
      'cantidad': instance.cantidad,
      'disponible': instance.disponible,
    };
