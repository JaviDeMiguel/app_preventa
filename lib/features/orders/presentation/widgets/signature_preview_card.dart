import 'dart:convert';
import 'package:flutter/material.dart';

/// Widget visual para previsualizar una firma manuscrita capturada
class SignaturePreviewCard extends StatelessWidget {
  final String? pointsJson;
  final String? svg;
  final String? signerName;
  final String? signerDni;
  final VoidCallback? onResign;
  final VoidCallback? onRemove;

  const SignaturePreviewCard({
    super.key,
    this.pointsJson,
    this.svg,
    this.signerName,
    this.signerDni,
    this.onResign,
    this.onRemove,
  });

  List<List<Offset>> _parseStrokes() {
    if (pointsJson == null || pointsJson!.isEmpty) return [];
    try {
      final decoded = jsonDecode(pointsJson!) as List<dynamic>;
      return decoded.map((stroke) {
        final strokeList = stroke as List<dynamic>;
        return strokeList.map((pt) {
          final coords = pt as List<dynamic>;
          return Offset(
            (coords[0] as num).toDouble(),
            (coords[1] as num).toDouble(),
          );
        }).toList();
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final strokes = _parseStrokes();
    final hasData = strokes.isNotEmpty || (svg != null && svg!.isNotEmpty);

    if (!hasData) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.indigo.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified, color: Colors.indigo, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Firma de Conformidad del Cliente',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                  ),
                ),
                const Spacer(),
                if (onResign != null)
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      visualDensity: VisualDensity.compact,
                    ),
                    onPressed: onResign,
                    icon: const Icon(Icons.edit, size: 14),
                    label:
                        const Text('Re-firmar', style: TextStyle(fontSize: 12)),
                  ),
                if (onRemove != null)
                  IconButton(
                    iconSize: 18,
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: onRemove,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // Mini lienzo con los trazos
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: strokes.isNotEmpty
                    ? CustomPaint(
                        painter: _ThumbnailSignaturePainter(strokes: strokes),
                      )
                    : Center(
                        child: Text(
                          'Firma registrada (SVG)',
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade600),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (signerName != null && signerName!.isNotEmpty) ...[
                  const Icon(Icons.person, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    signerName!,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
                if (signerDni != null && signerDni!.isNotEmpty) ...[
                  const SizedBox(width: 12),
                  const Icon(Icons.badge, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'DNI: $signerDni',
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ThumbnailSignaturePainter extends CustomPainter {
  final List<List<Offset>> strokes;

  _ThumbnailSignaturePainter({required this.strokes});

  @override
  void paint(Canvas canvas, Size size) {
    if (strokes.isEmpty) return;

    // Calcular bounding box para escalar adecuadamente a la miniatura
    double minX = double.infinity, maxX = double.negativeInfinity;
    double minY = double.infinity, maxY = double.negativeInfinity;

    for (final stroke in strokes) {
      for (final pt in stroke) {
        if (pt.dx < minX) minX = pt.dx;
        if (pt.dx > maxX) maxX = pt.dx;
        if (pt.dy < minY) minY = pt.dy;
        if (pt.dy > maxY) maxY = pt.dy;
      }
    }

    final origW = (maxX - minX).clamp(1.0, 10000.0);
    final origH = (maxY - minY).clamp(1.0, 10000.0);

    final scaleX = (size.width - 24) / origW;
    final scaleY = (size.height - 16) / origH;
    final scale = (scaleX < scaleY ? scaleX : scaleY).clamp(0.1, 1.0);

    final offsetX = (size.width - origW * scale) / 2 - minX * scale;
    final offsetY = (size.height - origH * scale) / 2 - minY * scale;

    final paint = Paint()
      ..color = const Color(0xFF1E293B)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) continue;
      final path = Path();
      path.moveTo(
          stroke.first.dx * scale + offsetX, stroke.first.dy * scale + offsetY);
      for (int i = 1; i < stroke.length; i++) {
        path.lineTo(
            stroke[i].dx * scale + offsetX, stroke[i].dy * scale + offsetY);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ThumbnailSignaturePainter oldDelegate) => true;
}
