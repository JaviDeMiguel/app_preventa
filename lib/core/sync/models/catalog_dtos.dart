import 'package:freezed_annotation/freezed_annotation.dart';

import 'sync_task_collection.dart';

part 'catalog_dtos.freezed.dart';
part 'catalog_dtos.g.dart';

/// DTO inmutable para mapeo de Clientes desde la API de FacturaScripts v3 (/api/3/clientes).
@freezed
class FacturaScriptsClientDto with _$FacturaScriptsClientDto {
  const FacturaScriptsClientDto._();

  const factory FacturaScriptsClientDto({
    required String codcliente,
    required String nombre,
    @Default('') String cifnif,
    String? telefono1,
    String? email,
    String? direccion,
    String? codpostal,
    String? ciudad,
    @Default(0.0) double riesgomax,
    @Default(0.0) double deuda,
    String? codtarifa,
    @Default(false) bool recargo,
    String? fechaModificacion,
  }) = _FacturaScriptsClientDto;

  factory FacturaScriptsClientDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsClientDtoFromJson(json);

  ClientEntity toEntity() => ClientEntity()
    ..codcliente = codcliente
    ..nombre = nombre
    ..cifnif = cifnif
    ..telefono = telefono1
    ..email = email
    ..direccion = direccion
    ..codpostal = codpostal
    ..ciudad = ciudad
    ..riesgomax = riesgomax
    ..deuda = deuda
    ..codtarifa = codtarifa
    ..recargo = recargo
    ..updatedAt = fechaModificacion != null
        ? DateTime.tryParse(fechaModificacion!)
        : DateTime.now();
}

/// DTO inmutable para mapeo de Artículos desde la API de FacturaScripts v3 (/api/3/articulos).
@freezed
class FacturaScriptsProductDto with _$FacturaScriptsProductDto {
  const FacturaScriptsProductDto._();

  const factory FacturaScriptsProductDto({
    required String referencia,
    required String descripcion,
    @Default(0.0) double precio,
    @Default(21.0) double iva,
    @Default(0) int stockfisico,
    @Default(0) int stockdisponible,
    @Default(false) bool bloqueado,
    String? fechaModificacion,
  }) = _FacturaScriptsProductDto;

  factory FacturaScriptsProductDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsProductDtoFromJson(json);

  ProductEntity toEntity() => ProductEntity()
    ..referencia = referencia
    ..descripcion = descripcion
    ..precio = precio
    ..iva = iva
    ..stockFisico = stockfisico
    ..stockDisponible = stockdisponible
    ..bloqueado = bloqueado
    ..updatedAt = fechaModificacion != null
        ? DateTime.tryParse(fechaModificacion!)
        : DateTime.now();
}
