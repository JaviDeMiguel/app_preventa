import 'dart:convert';

import 'package:app_preventa/core/sync/engine/erp_resource.dart';

/// Línea de documento tal como la acepta `ApiBusinessDocumentTrait::applyLineFields`.
typedef ErpDocumentLine = ({
  String? referencia,
  String? descripcion,
  num cantidad,
  num pvpunitario,
  num dtopor,
});

/// FIX (Contrato API): payload de `crearPedidoCliente`/`crearAlbaranCliente`.
///
/// Antes se enviaban claves que FacturaScripts no conoce (`dsc`, `iva`,
/// `pvptotal`, `firma_svg`, `idpedido_origen_local`). El ERP calcula el IVA a
/// partir del producto, así que solo se envían los campos que realmente lee.
Map<String, Object?> buildSalesDocumentPayload({
  required String codcliente,
  required String localDocumentId,
  required DateTime issuedAt,
  required List<ErpDocumentLine> lines,
  String? warehouseCode,
  String? signerName,
  String? signerDni,
}) =>
    {
      'codcliente': codcliente,
      // Clave de idempotencia: campo real `numero2` de SalesDocument.
      'numero2': localDocumentId,
      'fecha': _erpDate(issuedAt),
      'hora': _erpTime(issuedAt),
      if (warehouseCode case final String code when code.isNotEmpty)
        'codalmacen': code,
      // FIX (PII): el DNI completo solo se guarda en local junto a la firma;
      // en el ERP (texto libre visible e impreso) va enmascarado.
      if (signerName case final String name when name.isNotEmpty)
        'observaciones': 'Conforme: $name'
            '${signerDni == null || signerDni.isEmpty ? '' : ' (${maskPersonalId(signerDni)})'}'
            ' · App preventa $localDocumentId',
      'lineas': [
        for (final line in lines)
          {
            if (line.referencia case final String ref when ref.isNotEmpty)
              'referencia': ref,
            if (line.descripcion case final String text when text.isNotEmpty)
              'descripcion': text,
            'cantidad': line.cantidad,
            'pvpunitario': line.pvpunitario,
            'dtopor': line.dtopor,
          },
      ],
    };

/// Payload de alta de cliente (`POST /api/3/clientes`). Solo campos del modelo
/// `Cliente` (+traits); la dirección vive en `Contacto` y queda solo en local.
Map<String, Object?> buildClientPayload({
  required String tempCode,
  required String nombre,
  required String cifnif,
  String? telefono,
  String? email,
}) =>
    {
      'nombre': nombre,
      'cifnif': cifnif,
      if (telefono case final String phone when phone.isNotEmpty)
        'telefono1': phone,
      if (email case final String mail when mail.isNotEmpty) 'email': mail,
      tempClientCodeKey: tempCode,
    };

/// FIX (Contrato API): FacturaScripts no parsea cuerpos JSON en POST; se
/// envía `application/x-www-form-urlencoded`. Las colecciones (`lineas`) se
/// serializan como JSON string, formato aceptado por `decodeLines()`.
/// Las claves locales (`_…`) y los nulos nunca salen del dispositivo.
Map<String, String> encodeFormFields(Map<String, dynamic> payload) => {
      for (final MapEntry(:key, :value) in payload.entries)
        if (!key.startsWith(localPayloadKeyPrefix) && value != null)
          key: switch (value) {
            final List<Object?> list => jsonEncode(list),
            final Map<String, Object?> map => jsonEncode(map),
            true => '1',
            false => '0',
            _ => '$value',
          },
    };

/// `12345678Z` → `***678Z`: suficiente para identificar sin exponer el DNI.
String maskPersonalId(String id) {
  final trimmed = id.trim();
  return trimmed.length <= 4
      ? '***'
      : '***${trimmed.substring(trimmed.length - 4)}';
}

String _erpDate(DateTime at) =>
    '${_two(at.day)}-${_two(at.month)}-${at.year.toString().padLeft(4, '0')}';

String _erpTime(DateTime at) =>
    '${_two(at.hour)}:${_two(at.minute)}:${_two(at.second)}';

String _two(int value) => value.toString().padLeft(2, '0');
