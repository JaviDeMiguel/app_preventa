import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';

import 'package:app_preventa/core/sync/engine/erp_payloads.dart';
import 'package:app_preventa/core/sync/engine/erp_resource.dart';
import 'package:app_preventa/core/sync/engine/sync_engine.dart';
import 'package:app_preventa/core/sync/models/sync_task.dart';
import 'package:app_preventa/core/sync/models/sync_task_collection.dart';
import 'package:app_preventa/features/orders/presentation/states/order_save_state.dart';
import 'package:app_preventa/features/orders/presentation/widgets/digital_receipt_dialog.dart';
import 'package:app_preventa/features/orders/presentation/widgets/signature_pad_dialog.dart';
import 'package:app_preventa/features/orders/presentation/widgets/signature_preview_card.dart';

class OrderSubmissionScreen extends StatefulWidget {
  // [ECC: Inyección de Dependencias]
  final SyncEngine syncEngine;
  final Isar isar;
  final String codcliente;
  final ClientEntity? client;
  final List<Map<String, dynamic>> orderLines;
  final DocumentType documentType;

  const OrderSubmissionScreen({
    super.key,
    required this.syncEngine,
    required this.isar,
    required this.codcliente,
    this.client,
    required this.orderLines,
    this.documentType = DocumentType.pedido,
  });

  @override
  State<OrderSubmissionScreen> createState() => _OrderSubmissionScreenState();
}

class _OrderSubmissionScreenState extends State<OrderSubmissionScreen> {
  // [ECC: Estados jerárquicos] Estado gestionado mediante sealed class, no flags booleanos
  OrderSaveState _state = const OrderSaveState.initial();
  PaymentMethod _paymentMethod = PaymentMethod.efectivo;
  bool _isPaid = false;
  SignatureData? _signatureData;
  OrderEntity? _savedOrder;

  double get _totalNetoCalculated {
    return widget.orderLines.fold(0.0, (sum, line) {
      final pvpTotal = (line['pvptotal'] as num?)?.toDouble() ?? 0.0;
      return sum + pvpTotal;
    });
  }

  double get _totalIvaCalculated {
    return widget.orderLines.fold(0.0, (sum, line) {
      final pvpTotal = (line['pvptotal'] as num?)?.toDouble() ?? 0.0;
      final ivaPct = (line['iva'] as num?)?.toDouble() ?? 21.0;
      return sum + (pvpTotal * (ivaPct / 100));
    });
  }

  double get _totalFinalCalculated =>
      _totalNetoCalculated + _totalIvaCalculated;

  Future<void> _openSignatureDialog() async {
    final result = await SignaturePadDialog.show(
      context,
      initialSignerName: widget.client?.nombre ?? widget.codcliente,
      initialSignerDni: widget.client?.cifnif ?? '',
    );
    // FIX: [ECC: Seguridad de Contexto] setState tras await sin comprobar mounted.
    if (!mounted || result == null) return;
    setState(() => _signatureData = result);
  }

  Future<void> _handleSaveAndQueueOrder() async {
    setState(() {
      _state = const OrderSaveState.submitting(
        statusMessage: 'Persistiendo pedido en base de datos local...',
      );
    });

    try {
      final isAlbaran = widget.documentType == DocumentType.albaran;
      final generatedOrderId =
          '${isAlbaran ? "ALB" : "ORD"}-${DateTime.now().millisecondsSinceEpoch}';
      final syncTaskUuid = 'TASK-${DateTime.now().microsecondsSinceEpoch}';
      final issuedAt = DateTime.now();
      final resource = isAlbaran ? ErpResource.albaranes : ErpResource.pedidos;

      // 1. Guardar atómicamente el documento y encolar la tarea en Isar
      final syncTaskEntity = SyncTaskCollection()
        ..uuid = syncTaskUuid
        // FIX (Contrato API): crearPedidoCliente/crearAlbaranCliente guardan
        // cabecera + líneas en una transacción; los endpoints anteriores no
        // existían y las líneas anidadas nunca llegaban al ERP.
        ..endpoint = resource.createPath
        ..method = HttpMethod.post
        ..payloadJson = jsonEncode(
          buildSalesDocumentPayload(
            codcliente: widget.codcliente,
            localDocumentId: generatedOrderId,
            issuedAt: issuedAt,
            // Autoventa: el albarán descuenta del almacén de la furgoneta.
            warehouseCode: widget.syncEngine.warehouseCode,
            signerName: _signatureData?.signerName,
            signerDni: _signatureData?.signerDni,
            lines: [
              for (final line in widget.orderLines)
                (
                  referencia: line['referencia'] as String?,
                  descripcion: line['descripcion'] as String?,
                  cantidad: line['cantidad'] as num,
                  pvpunitario: line['pvpunitario'] as num,
                  dtopor: (line['dsc'] as num?) ?? 0,
                ),
            ],
          ),
        )
        ..retries = 0
        ..maxRetries = defaultTaskMaxRetries
        ..status = SyncStatus.pending
        ..createdAt = issuedAt;

      double totalNeto = 0.0;
      double totalIva = 0.0;
      final embeddedLines = widget.orderLines.map((line) {
        final pvpTotal = (line['pvptotal'] as num).toDouble();
        final ivaPct = (line['iva'] as num).toDouble();
        final dsc = (line['dsc'] as num?)?.toDouble() ?? 0.0;
        final ivaAmount = pvpTotal * (ivaPct / 100);
        totalNeto += pvpTotal;
        totalIva += ivaAmount;

        return OrderLineEmbedded()
          ..referencia = line['referencia'] as String?
          ..descripcion = line['descripcion'] as String?
          ..cantidad = (line['cantidad'] as num).toInt()
          ..pvpunitario = (line['pvpunitario'] as num).toDouble()
          ..dsc = dsc
          ..iva = ivaPct
          ..pvptotal = pvpTotal;
      }).toList();

      final totalCalculated = totalNeto + totalIva;

      final orderEntity = OrderEntity()
        ..localId = generatedOrderId
        ..codcliente = widget.codcliente
        ..nombreCliente = widget.client?.nombre ?? widget.codcliente
        ..fecha = DateTime.now()
        ..totalNeto = totalNeto
        ..totalIva = totalIva
        ..totalFinal = totalCalculated
        ..syncStatus = SyncStatus.pending
        ..documentType = widget.documentType
        ..paymentMethod = _paymentMethod
        ..isPaid = _isPaid
        ..paidAmount = _isPaid ? totalCalculated : 0.0
        ..syncTaskId = syncTaskUuid
        ..firmaSvg = _signatureData?.svg
        ..firmanteNombre = _signatureData?.signerName
        ..firmanteDni = _signatureData?.signerDni
        ..lineas = embeddedLines;

      _savedOrder = orderEntity;

      await widget.isar.writeTxn(() async {
        // [ECC: Autoventa] Descuento inmediato de stock del vehículo para venta directa
        if (isAlbaran) {
          for (final line in widget.orderLines) {
            final ref = line['referencia'] as String?;
            final qty = (line['cantidad'] as num).toInt();
            if (ref != null) {
              final prod = await widget.isar.productEntitys
                  .where()
                  .referenciaEqualTo(ref)
                  .findFirst();
              if (prod != null) {
                prod.stockDisponible -= qty;
                prod.stockFisico -= qty;
                await widget.isar.productEntitys.put(prod);
              }
            }
          }
        }

        await widget.isar.orderEntitys.put(orderEntity);
        await widget.isar.syncTaskCollections.put(syncTaskEntity);
      });

      // 2. Disparar sincronización oportunista en segundo plano
      unawaited(widget.syncEngine.processUpstreamQueue());

      // FIX: [ECC: Seguridad de Contexto] setState tras await sin mounted.
      if (!mounted) return;
      setState(() {
        _state = OrderSaveState.success(
          orderId: generatedOrderId,
          queuedTaskId: syncTaskUuid,
          isOnlineSynced: false,
        );
      });
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() {
        _state = OrderSaveState.failure(
          errorMessage:
              'Error al persistir el pedido en almacenamiento local: $e',
          canRetryLocally: true,
        );
      });
    }

    // [ECC: Seguridad de Contexto] Comprobación obligatoria tras operaciones asíncronas
    if (!mounted) {
      return;
    }

    // [ECC: Control de Flujo] Switch expression exhaustiva sobre el estado sealed
    final docLabel =
        widget.documentType == DocumentType.albaran ? 'Albarán' : 'Pedido';

    final snackBarMessage = switch (_state) {
      OrderSaveSuccess(:final orderId) =>
        '$docLabel $orderId guardado localmente y encolado para FacturaScripts.',
      OrderSaveFailure(:final errorMessage) => 'Fallo: $errorMessage',
      _ => 'Procesamiento finalizado.',
    };

    final isSuccess = switch (_state) {
      OrderSaveSuccess() => true,
      _ => false,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarMessage),
        backgroundColor:
            isSuccess ? Colors.green.shade800 : Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final client = widget.client;
    final totalOrder = _totalFinalCalculated;
    final hasRiskWarning = client != null &&
        client.riesgomax > 0 &&
        (client.deuda + totalOrder > client.riesgomax);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.documentType == DocumentType.albaran
            ? 'Emisión de Albarán (Autoventa)'
            : 'Confirmación de Pedido (Preventa)'),
      ),
      // [ECC: Control de Flujo & Exhaustividad] Renderizado reactivo sin ifs anidados
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: switch (_state) {
          OrderSaveInitial() => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Cabecera del cliente
                Card(
                  elevation: 0,
                  color: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          client?.nombre ?? widget.codcliente,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Código: ${widget.codcliente} • CIF/NIF: ${client?.cifnif.isNotEmpty == true ? client!.cifnif : "N/A"}',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.orderLines.length} artículo(s) seleccionados',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Alerta de riesgo financiero si aplica
                if (hasRiskWarning) ...[
                  Card(
                    elevation: 0,
                    color: Colors.amber.shade50,
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(color: Colors.amber.shade400, width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.warning_amber_rounded,
                              color: Colors.amber, size: 28),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Aviso de Crédito Excedido',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Deuda actual (${client.deuda.toStringAsFixed(2)} €) + Esta operación (${totalOrder.toStringAsFixed(2)} €) superará el límite de riesgo concedido (${client.riesgomax.toStringAsFixed(2)} €). Se recomienda cobro inmediato.',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.brown.shade800),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // Desglose de totales económicos
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.indigo.shade100),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Base Imponible (Neto):'),
                            Text('${_totalNetoCalculated.toStringAsFixed(2)} €',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Impuestos (IVA):'),
                            Text('${_totalIvaCalculated.toStringAsFixed(2)} €',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Divider(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'TOTAL A PAGAR:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              '${totalOrder.toStringAsFixed(2)} €',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Opciones de Cobro y Pago
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        DropdownButtonFormField<PaymentMethod>(
                          initialValue: _paymentMethod,
                          decoration: const InputDecoration(
                            labelText: 'Forma de Pago',
                            prefixIcon: Icon(Icons.payment),
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: PaymentMethod.efectivo,
                              child: Text('Efectivo'),
                            ),
                            DropdownMenuItem(
                              value: PaymentMethod.tarjeta,
                              child: Text('Tarjeta / TPV'),
                            ),
                            DropdownMenuItem(
                              value: PaymentMethod.transferencia,
                              child: Text('Transferencia Bancaria'),
                            ),
                            DropdownMenuItem(
                              value: PaymentMethod.pendiente,
                              child: Text('Pendiente de Pago'),
                            ),
                          ],
                          onChanged: (val) {
                            if (val != null) {
                              setState(() => _paymentMethod = val);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Cobrado en mano al cliente'),
                          subtitle: const Text(
                            'Marca como cobrado en el arqueo del día',
                            style: TextStyle(fontSize: 12),
                          ),
                          value: _isPaid,
                          onChanged: (val) {
                            setState(() => _isPaid = val);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Sección de Firma de Conformidad
                if (_signatureData != null)
                  SignaturePreviewCard(
                    pointsJson: _signatureData!.pointsJson,
                    svg: _signatureData!.svg,
                    signerName: _signatureData!.signerName,
                    signerDni: _signatureData!.signerDni,
                    onResign: _openSignatureDialog,
                    onRemove: () => setState(() => _signatureData = null),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: _openSignatureDialog,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(
                        color: widget.documentType == DocumentType.albaran
                            ? Colors.indigo
                            : Colors.grey.shade400,
                        width: widget.documentType == DocumentType.albaran
                            ? 1.5
                            : 1,
                      ),
                    ),
                    icon: Icon(
                      Icons.draw,
                      color: widget.documentType == DocumentType.albaran
                          ? Colors.indigo
                          : null,
                    ),
                    label: Text(
                      widget.documentType == DocumentType.albaran
                          ? 'Capturar Firma del Cliente (Recomendado)'
                          : 'Capturar Firma de Conformidad (Opcional)',
                      style: TextStyle(
                        fontWeight: widget.documentType == DocumentType.albaran
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                const SizedBox(height: 24),

                FilledButton.icon(
                  onPressed: _handleSaveAndQueueOrder,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.save),
                  label: Text(
                    widget.documentType == DocumentType.albaran
                        ? 'Emitir Albarán y Descontar Stock'
                        : 'Guardar y Encolar Pedido',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          OrderSaveSubmitting(:final statusMessage) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(statusMessage, textAlign: TextAlign.center),
                ],
              ),
            ),
          OrderSaveSuccess(:final orderId, :final queuedTaskId) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_outline,
                      color: Colors.green, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    widget.documentType == DocumentType.albaran
                        ? '¡Albarán emitido con éxito!'
                        : '¡Pedido registrado con éxito!',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text('ID Local: $orderId'),
                  Text('ID Cola Sync: $queuedTaskId'),
                  const SizedBox(height: 16),
                  if (_savedOrder != null) ...[
                    if (_savedOrder!.firmaSvg != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SignaturePreviewCard(
                          svg: _savedOrder!.firmaSvg,
                          signerName: _savedOrder!.firmanteNombre,
                          signerDni: _savedOrder!.firmanteDni,
                        ),
                      ),
                    FilledButton.tonalIcon(
                      onPressed: () =>
                          DigitalReceiptDialog.show(context, _savedOrder!),
                      icon: const Icon(Icons.receipt_long),
                      label: const Text('Ver / Compartir Comprobante'),
                    ),
                    const SizedBox(height: 12),
                  ],
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Volver a Clientes'),
                  ),
                ],
              ),
            ),
          OrderSaveFailure(:final errorMessage, :final canRetryLocally) =>
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 64),
                  const SizedBox(height: 16),
                  Text(errorMessage, textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  if (canRetryLocally)
                    FilledButton(
                      onPressed: _handleSaveAndQueueOrder,
                      child: const Text('Reintentar Guardado Local'),
                    ),
                ],
              ),
            ),
        },
      ),
    );
  }
}
