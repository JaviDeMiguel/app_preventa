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
      cifnif: json['cifnif'] as String? ?? '',
      telefono1: json['telefono1'] as String?,
      email: json['email'] as String?,
      direccion: json['direccion'] as String?,
      codpostal: json['codpostal'] as String?,
      ciudad: json['ciudad'] as String?,
      riesgomax: (json['riesgomax'] as num?)?.toDouble() ?? 0.0,
      deuda: (json['deuda'] as num?)?.toDouble() ?? 0.0,
      codtarifa: json['codtarifa'] as String?,
      recargo: json['recargo'] as bool? ?? false,
      fechaModificacion: json['fechaModificacion'] as String?,
    );

Map<String, dynamic> _$$FacturaScriptsClientDtoImplToJson(
        _$FacturaScriptsClientDtoImpl instance) =>
    <String, dynamic>{
      'codcliente': instance.codcliente,
      'nombre': instance.nombre,
      'cifnif': instance.cifnif,
      'telefono1': instance.telefono1,
      'email': instance.email,
      'direccion': instance.direccion,
      'codpostal': instance.codpostal,
      'ciudad': instance.ciudad,
      'riesgomax': instance.riesgomax,
      'deuda': instance.deuda,
      'codtarifa': instance.codtarifa,
      'recargo': instance.recargo,
      'fechaModificacion': instance.fechaModificacion,
    };

_$FacturaScriptsProductDtoImpl _$$FacturaScriptsProductDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FacturaScriptsProductDtoImpl(
      referencia: json['referencia'] as String,
      descripcion: json['descripcion'] as String,
      precio: (json['precio'] as num?)?.toDouble() ?? 0.0,
      iva: (json['iva'] as num?)?.toDouble() ?? 21.0,
      stockfisico: (json['stockfisico'] as num?)?.toInt() ?? 0,
      stockdisponible: (json['stockdisponible'] as num?)?.toInt() ?? 0,
      bloqueado: json['bloqueado'] as bool? ?? false,
      fechaModificacion: json['fechaModificacion'] as String?,
    );

Map<String, dynamic> _$$FacturaScriptsProductDtoImplToJson(
        _$FacturaScriptsProductDtoImpl instance) =>
    <String, dynamic>{
      'referencia': instance.referencia,
      'descripcion': instance.descripcion,
      'precio': instance.precio,
      'iva': instance.iva,
      'stockfisico': instance.stockfisico,
      'stockdisponible': instance.stockdisponible,
      'bloqueado': instance.bloqueado,
      'fechaModificacion': instance.fechaModificacion,
    };
