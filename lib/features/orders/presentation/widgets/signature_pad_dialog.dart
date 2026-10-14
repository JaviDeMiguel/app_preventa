import 'dart:convert';
import 'package:flutter/material.dart';

/// Resultado inmutable de la captura de firma en pantalla
class SignatureData {
  final String svg;
  final String signerName;
  final String signerDni;
  final String pointsJson;

  const SignatureData({
    required this.svg,
    required this.signerName,
    required this.signerDni,
    required this.pointsJson,
  });
}

/// Diálogo modal interactivo para la captura de firma manuscrita digital (Autoventa / Preventa)
class SignaturePadDialog extends StatefulWidget {
  final String initialSignerName;
  final String initialSignerDni;

  const SignaturePadDialog({
    super.key,
    this.initialSignerName = '',
    this.initialSignerDni = '',
  });

  static Future<SignatureData?> show(
    BuildContext context, {
    String initialSignerName = '',
    String initialSignerDni = '',
  }) {
    return showDialog<SignatureData>(
      context: context,
      barrierDismissible: false,
      builder: (_) => SignaturePadDialog(
        initialSignerName: initialSignerName,
        initialSignerDni: initialSignerDni,
      ),
    );
  }

  @override
  State<SignaturePadDialog> createState() => _SignaturePadDialogState();
}

class _SignaturePadDialogState extends State<SignaturePadDialog> {
  final List<List<Offset>> _strokes = [];
  List<Offset> _currentStroke = [];

  late final TextEditingController _nameController;
  late final TextEditingController _dniController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialSignerName);
    _dniController = TextEditingController(text: widget.initialSignerDni);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dniController.dispose();
    super.dispose();
  }

  bool get _hasSignature => _strokes.isNotEmpty || _currentStroke.isNotEmpty;

  void _clear() {
    setState(() {
      _strokes.clear();
      _currentStroke.clear();
    });
  }

  void _undo() {
    setState(() {
      if (_strokes.isNotEmpty) {
        _strokes.removeLast();
      }
    });
  }

  String _generateSvg(double width, double height) {
    final buffer = StringBuffer();
    buffer.write('<svg xmlns="http://www.w3.org/2000/svg" ');
    buffer.write(
        'viewBox="0 0 ${width.toInt()} ${height.toInt()}" width="${width.toInt()}" height="${height.toInt()}">\n');

    for (final stroke in _strokes) {
      if (stroke.isEmpty) continue;
      buffer.write(
          '  <path d="M ${stroke.first.dx.toStringAsFixed(1)} ${stroke.first.dy.toStringAsFixed(1)} ');
      for (int i = 1; i < stroke.length; i++) {
        buffer.write(
            'L ${stroke[i].dx.toStringAsFixed(1)} ${stroke[i].dy.toStringAsFixed(1)} ');
      }
      buffer.write(
          '" stroke="#1e293b" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round" />\n');
    }

    buffer.write('</svg>');
    return buffer.toString();
  }

  String _generatePointsJson() {
    final list = _strokes.map((stroke) {
      return stroke.map((pt) => [pt.dx, pt.dy]).toList();
    }).toList();
    return jsonEncode(list);
  }

  void _confirm(double width, double height) {
    if (!_hasSignature) return;

    final svg = _generateSvg(width, height);
    final pointsJson = _generatePointsJson();

    Navigator.of(context).pop(
      SignatureData(
        svg: svg,
        signerName: _nameController.text.trim(),
        signerDni: _dniController.text.trim(),
        pointsJson: pointsJson,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const canvasHeight = 180.0;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.draw, color: Colors.indigo),
                  const SizedBox(width: 8),
                  Text(
                    'Firma de Conformidad',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Datos del receptor / firmante
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Receptor',
                        isDense: true,
                        prefixIcon: Icon(Icons.person, size: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _dniController,
                      decoration: const InputDecoration(
                        labelText: 'NIF / DNI',
                        isDense: true,
                        prefixIcon: Icon(Icons.badge, size: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Firme en el recuadro inferior con su dedo o puntero:',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 8),
              // Lienzo de dibujo táctil
              LayoutBuilder(
                builder: (context, constraints) {
                  final canvasWidth = constraints.maxWidth;

                  return Container(
                    height: canvasHeight,
                    width: canvasWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: Colors.indigo.shade200, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          // Línea guía de base
                          Positioned(
                            bottom: 35,
                            left: 20,
                            right: 20,
                            child: Row(
                              children: [
                                const Text('✕ ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onPanStart: (details) {
                              setState(() {
                                _currentStroke = [details.localPosition];
                              });
                            },
                            onPanUpdate: (details) {
                              setState(() {
                                _currentStroke.add(details.localPosition);
                              });
                            },
                            onPanEnd: (details) {
                              setState(() {
                                if (_currentStroke.isNotEmpty) {
                                  _strokes.add(List.from(_currentStroke));
                                  _currentStroke.clear();
                                }
                              });
                            },
                            child: CustomPaint(
                              size: Size(canvasWidth, canvasHeight),
                              painter: _SignaturePainter(
                                strokes: _strokes,
                                activeStroke: _currentStroke,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              // Botones de acción del lienzo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: _strokes.isNotEmpty ? _undo : null,
                        icon: const Icon(Icons.undo, size: 18),
                        label: const Text('Deshacer'),
                      ),
                      TextButton.icon(
                        onPressed: _hasSignature ? _clear : null,
                        icon: const Icon(Icons.clear, size: 18),
                        label: const Text('Borrar'),
                      ),
                    ],
                  ),
                  Text(
                    _strokes.isNotEmpty
                        ? '${_strokes.length} trazos'
                        : 'Esperando firma',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Botones de diálogo (Cancelar / Confirmar)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.icon(
                    onPressed: _hasSignature
                        ? () {
                            _confirm(400, canvasHeight);
                          }
                        : null,
                    icon: const Icon(Icons.check),
                    label: const Text('Aceptar Firma'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> activeStroke;

  _SignaturePainter({
    required this.strokes,
    required this.activeStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0F172A)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.8
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) {
        if (stroke.isNotEmpty) {
          canvas.drawCircle(
              stroke.first, 1.4, paint..style = PaintingStyle.fill);
          paint.style = PaintingStyle.stroke;
        }
        continue;
      }
      final path = Path();
      path.moveTo(stroke.first.dx, stroke.first.dy);
      for (int i = 1; i < stroke.length; i++) {
        path.lineTo(stroke[i].dx, stroke[i].dy);
      }
      canvas.drawPath(path, paint);
    }

    if (activeStroke.isNotEmpty) {
      if (activeStroke.length < 2) {
        canvas.drawCircle(
            activeStroke.first, 1.4, paint..style = PaintingStyle.fill);
        paint.style = PaintingStyle.stroke;
      } else {
        final path = Path();
        path.moveTo(activeStroke.first.dx, activeStroke.first.dy);
        for (int i = 1; i < activeStroke.length; i++) {
          path.lineTo(activeStroke[i].dx, activeStroke[i].dy);
        }
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SignaturePainter oldDelegate) => true;
}
