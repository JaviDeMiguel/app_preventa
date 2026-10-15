import 'dart:convert';

import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';

const _signatureMime = 'image/svg+xml';
const _linkModelKey = '${localPayloadKeyPrefix}link_model';
const _linkModelIdKey = '${localPayloadKeyPrefix}link_modelid';
const _linkModelCodeKey = '${localPayloadKeyPrefix}link_modelcode';

/// FEAT (Datos que no llegaban al ERP): tareas que solo pueden crearse cuando
/// el ERP confirma [deliveredEndpoint], porque necesitan ids que genera él.
///
/// - Alta de cliente → `PUT /contactos/{idcontactofact}` con la dirección
///   (`Cliente::saveInsert` crea el contacto por defecto SIN dirección).
/// - Pedido/albarán firmado → subida de la firma SVG (`attachedfiles`).
/// - Firma subida → enlace al documento (`attachedfilerelations`).
///
/// Los uuid son deterministas: replanificar nunca duplica tareas.
List<SyncTaskCollection> planFollowUpTasks({
  required String deliveredUuid,
  required String deliveredEndpoint,
  required Map<String, dynamic> deliveredPayload,
  required Map<String, Object?> erpRecord,
  required DateTime now,
  String? signatureSvg,
  String? documentLocalId,
}) =>
    switch (ErpResource.fromEndpoint(deliveredEndpoint)) {
      ErpResource.clientes => [
          if (_addressOf(deliveredPayload) case final address
              when address.isNotEmpty)
            if (erpRecord['idcontactofact'] case final Object idContacto
                when '$idContacto'.isNotEmpty && '$idContacto' != '0')
              _followUp(
                uuid: '$deliveredUuid-direccion',
                endpoint: erpContactPath(idContacto),
                method: HttpMethod.put,
                payload: address,
                now: now,
              ),
        ],
      ErpResource(:final String modelName, :final String primaryKeyField)
          when signatureSvg != null && signatureSvg.isNotEmpty =>
        [
          if (erpRecord[primaryKeyField] case final Object documentId)
            _followUp(
              uuid: '$deliveredUuid-firma',
              endpoint: ErpResource.adjuntos.createPath,
              method: HttpMethod.upload,
              payload: {
                attachmentFileNameKey:
                    'firma_${documentLocalId ?? deliveredUuid}.svg',
                attachmentContentKey: signatureSvg,
                attachmentMimeKey: _signatureMime,
                _linkModelKey: modelName,
                _linkModelIdKey: '$documentId',
                if (erpRecord['codigo'] case final Object code)
                  _linkModelCodeKey: '$code',
              },
              now: now,
            ),
        ],
      ErpResource.adjuntos => [
          if ((
            deliveredPayload[_linkModelKey],
            deliveredPayload[_linkModelIdKey],
            erpRecord['idfile'],
          )
              case (
                final String model,
                final String modelId,
                final Object idFile,
              ))
            _followUp(
              uuid: '$deliveredUuid-enlace',
              endpoint: ErpResource.adjuntoRelaciones.createPath,
              method: HttpMethod.post,
              payload: {
                'idfile': '$idFile',
                'model': model,
                'modelid': modelId,
                if (deliveredPayload[_linkModelCodeKey] case final String code)
                  'modelcode': code,
                'observations': 'Firma del cliente (app de preventa)',
              },
              now: now,
            ),
        ],
      _ => const [],
    };

Map<String, String> _addressOf(Map<String, dynamic> payload) => {
      for (final (localKey, erpField) in const [
        (addressKeyDireccion, 'direccion'),
        (addressKeyCodPostal, 'codpostal'),
        (addressKeyCiudad, 'ciudad'),
      ])
        if (payload[localKey] case final String value when value.isNotEmpty)
          erpField: value,
    };

SyncTaskCollection _followUp({
  required String uuid,
  required String endpoint,
  required HttpMethod method,
  required Map<String, Object?> payload,
  required DateTime now,
}) =>
    SyncTaskCollection()
      ..uuid = uuid
      ..endpoint = endpoint
      ..method = method
      ..payloadJson = jsonEncode(payload)
      ..retries = 0
      ..maxRetries = defaultTaskMaxRetries
      ..status = SyncStatus.pending
      ..createdAt = now;
