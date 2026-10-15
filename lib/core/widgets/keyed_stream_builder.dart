import 'package:flutter/widgets.dart';

/// `StreamBuilder` que conserva su stream entre rebuilds.
///
/// FIX (Rendimiento): crear `isar...watch()` dentro de `build()` abre una
/// consulta nueva en cada rebuild (cada tecla, cada `setState` del carrito),
/// re-deserializando la colección entera en el Main Isolate. Aquí el stream
/// solo se recrea cuando cambia [streamKey] (p. ej. el texto de búsqueda).
class KeyedStreamBuilder<T> extends StatefulWidget {
  const KeyedStreamBuilder({
    super.key,
    required this.create,
    required this.builder,
    this.streamKey,
    this.initialData,
  });

  final Stream<T> Function() create;
  final AsyncWidgetBuilder<T> builder;

  /// Igualdad por valor: usar records o primitivos (`(query, onlyWithStock)`).
  final Object? streamKey;
  final T? initialData;

  @override
  State<KeyedStreamBuilder<T>> createState() => _KeyedStreamBuilderState<T>();
}

class _KeyedStreamBuilderState<T> extends State<KeyedStreamBuilder<T>> {
  late Stream<T> _stream = widget.create();

  @override
  void didUpdateWidget(KeyedStreamBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.streamKey != widget.streamKey) {
      _stream = widget.create();
    }
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<T>(
        stream: _stream,
        initialData: widget.initialData,
        builder: widget.builder,
      );
}
