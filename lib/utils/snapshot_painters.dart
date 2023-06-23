import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class GlitchSnapshotPainter implements SnapshotPainter {
  final double time;

  final ui.FragmentProgram program;

  const GlitchSnapshotPainter({required this.time, required this.program});

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  bool get hasListeners => false;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void paint(PaintingContext context, Offset offset, Size size,
      PaintingContextCallback painter) {
    painter(context, offset);
  }

  @override
  void paintSnapshot(PaintingContext context, Offset offset, Size size,
      ui.Image image, Size sourceSize, double pixelRatio) {
    const double overdrawPx = 30;
    final shader = program.fragmentShader();
    [size.width, size.height, offset.dx, offset.dy, time]
        .asMap()
        .forEach((key, value) {
      shader.setFloat(key, value);
    });
    shader
      .setImageSampler(0, image);
    Rect rect = Rect.fromLTWH(offset.dx - overdrawPx, offset.dy - overdrawPx,
        size.width + overdrawPx, size.height + overdrawPx);
    context.canvas.drawRect(rect, Paint()..shader = shader);
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  bool shouldRepaint(GlitchSnapshotPainter oldPainter) {
    return oldPainter.time != time || oldPainter.program != program;
  }
}
