// @JsonKey en parámetros de factory freezed: patrón documentado por freezed.
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'sync_task_collection.dart';

part 'catalog_dtos.freezed.dart';
part 'catalog_dtos.g.dart';

/// Valor de `Cliente.regimeniva` para Recargo de Equivalencia en FacturaScripts.
const _surchargeTaxRegime = 'Recargo';

/// IVA de reserva si el producto no tiene impuesto asignado. Solo afecta a la
/// previsualización local: el ERP recalcula el impuesto real al crear el documento.
const _fallbackVatPercent = 21.0;

/// FIX (Contrato API): DTO de `/api/3/clientes` con los campos REALES del
/// modelo `Cliente`. Antes se leían `deuda` y `recargo`, que no existen: el
/// control de riesgo siempre veía deuda 0 y el R.E. nunca se aplicaba.
@freezed
class FacturaScriptsClientDto with _$FacturaScriptsClientDto {
  const FacturaScriptsClientDto._();

  const factory FacturaScriptsClientDto({
    required String codcliente,
    required String nombre,
    @JsonKey(fromJson: lenientString) @Default('') String cifnif,
    String? telefono1,
    String? email,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double riesgomax,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double riesgoalcanzado,
    String? codtarifa,
    String? regimeniva,
    @JsonKey(fromJson: lenientBool) @Default(false) bool debaja,
  }) = _FacturaScriptsClientDto;

  factory FacturaScriptsClientDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsClientDtoFromJson(json);

  ClientEntity toEntity() => ClientEntity()
    ..codcliente = codcliente
    ..nombre = nombre
    ..cifnif = cifnif
    ..telefono = telefono1
    ..email = email
    ..riesgomax = riesgomax
    ..deuda = riesgoalcanzado
    ..codtarifa = codtarifa
    ..recargo = regimeniva == _surchargeTaxRegime
    ..updatedAt = DateTime.now();
}

/// FIX (Contrato API): DTO de `/api/3/productos` (el recurso `articulos` no
/// existe en FacturaScripts 2018+). El IVA llega como `codimpuesto` y el stock
/// físico global como `stockfis`.
@freezed
class FacturaScriptsProductDto with _$FacturaScriptsProductDto {
  const factory FacturaScriptsProductDto({
    required String referencia,
    @JsonKey(fromJson: lenientString) @Default('') String descripcion,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double precio,
    String? codimpuesto,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double stockfis,
    @JsonKey(fromJson: lenientBool) @Default(false) bool bloqueado,
    @JsonKey(fromJson: lenientBoolTrue) @Default(true) bool sevende,
  }) = _FacturaScriptsProductDto;

  factory FacturaScriptsProductDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsProductDtoFromJson(json);
}

/// DTO de `/api/3/impuestos`.
@freezed
class FacturaScriptsTaxDto with _$FacturaScriptsTaxDto {
  const factory FacturaScriptsTaxDto({
    required String codimpuesto,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double iva,
  }) = _FacturaScriptsTaxDto;

  factory FacturaScriptsTaxDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsTaxDtoFromJson(json);
}

/// DTO de `/api/3/stocks` (stock por almacén: el de la furgoneta en autoventa).
@freezed
class FacturaScriptsStockDto with _$FacturaScriptsStockDto {
  const factory FacturaScriptsStockDto({
    required String referencia,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double cantidad,
    @JsonKey(fromJson: lenientDouble) @Default(0.0) double disponible,
  }) = _FacturaScriptsStockDto;

  factory FacturaScriptsStockDto.fromJson(Map<String, dynamic> json) =>
      _$FacturaScriptsStockDtoFromJson(json);
}

/// Filas JSON crudas del ERP. `stocks == null` → sin almacén configurado.
typedef RawCatalog = ({
  List<Object?> clients,
  List<Object?> products,
  List<Object?> taxes,
  List<Object?>? stocks,
});

typedef MappedCatalog = ({
  List<ClientEntity> clients,
  List<ProductEntity> products,
});

typedef _StockLevel = ({double cantidad, double disponible});

const _noStock = (cantidad: 0.0, disponible: 0.0);

/// Une productos + impuestos + stock del almacén en entidades locales.
/// Pura y sin `this`: se ejecuta dentro de `Isolate.run`.
MappedCatalog mapCatalog(RawCatalog raw) {
  final vatByTax = {
    for (final tax in _mapRows(raw.taxes, FacturaScriptsTaxDto.fromJson))
      tax.codimpuesto: tax.iva,
  };

  final warehouseStock = switch (raw.stocks) {
    final List<Object?> rows =>
      _sumStockByReference(_mapRows(rows, FacturaScriptsStockDto.fromJson)),
    null => null,
  };

  final clients = [
    for (final dto in _mapRows(raw.clients, FacturaScriptsClientDto.fromJson))
      if (!dto.debaja) dto.toEntity(),
  ];

  final products = [
    for (final dto in _mapRows(raw.products, FacturaScriptsProductDto.fromJson))
      if (dto.sevende)
        _toProductEntity(
          dto,
          vatPercent: vatByTax[dto.codimpuesto] ?? _fallbackVatPercent,
          stock: switch (warehouseStock) {
            // Sin fila de stock en el almacén de la furgoneta → 0 unidades.
            final Map<String, _StockLevel> byReference =>
              byReference[dto.referencia] ?? _noStock,
            null => (cantidad: dto.stockfis, disponible: dto.stockfis),
          },
        ),
  ];

  return (clients: clients, products: products);
}

ProductEntity _toProductEntity(
  FacturaScriptsProductDto dto, {
  required double vatPercent,
  required _StockLevel stock,
}) =>
    ProductEntity()
      ..referencia = dto.referencia
      ..descripcion = dto.descripcion
      ..precio = dto.precio
      ..iva = vatPercent
      ..stockFisico = stock.cantidad.floor()
      ..stockDisponible = stock.disponible.floor()
      ..bloqueado = dto.bloqueado
      ..updatedAt = DateTime.now();

Map<String, _StockLevel> _sumStockByReference(
  List<FacturaScriptsStockDto> stocks,
) {
  final byReference = <String, _StockLevel>{};
  for (final stock in stocks) {
    final previous = byReference[stock.referencia] ?? _noStock;
    byReference[stock.referencia] = (
      cantidad: previous.cantidad + stock.cantidad,
      disponible: previous.disponible + stock.disponible,
    );
  }
  return byReference;
}

List<T> _mapRows<T>(
  List<Object?> rows,
  T Function(Map<String, dynamic> json) fromJson,
) =>
    [
      for (final row in rows)
        switch (row) {
          final Map<String, dynamic> json => _mapRow(json, fromJson),
          _ => throw FormatException(
              'Registro del ERP no es un objeto JSON: ${row.runtimeType}',
            ),
        },
    ];

T _mapRow<T>(
  Map<String, dynamic> json,
  T Function(Map<String, dynamic> json) fromJson,
) {
  try {
    return fromJson(json);
  }
  // json_serializable señala campos requeridos ausentes con TypeError; en la
  // frontera de datos externos se convierte en FormatException tipada.
  on TypeError catch (error) {
    throw FormatException('Registro del ERP inválido: $error');
  }
}

// ── Conversores tolerantes: PHP/PDO puede serializar números y booleanos
// como texto ("12.50", "1", "t") según el motor de base de datos. ──

double lenientDouble(Object? value) => switch (value) {
      final num number => number.toDouble(),
      final String text => double.tryParse(text.trim()) ?? 0.0,
      _ => 0.0,
    };

bool lenientBool(Object? value) => switch (value) {
      final bool flag => flag,
      final num number => number != 0,
      final String text => const {'1', 'true', 't', 'yes', 'si', 'sí'}
          .contains(text.trim().toLowerCase()),
      _ => false,
    };

bool lenientBoolTrue(Object? value) => value == null || lenientBool(value);

String lenientString(Object? value) => value?.toString() ?? '';
