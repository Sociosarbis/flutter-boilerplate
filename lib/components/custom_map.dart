import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MapPolyline extends StatefulWidget {
  final List<Offset> points;
  final double lineWidth;
  final Color color;
  const MapPolyline(
      {super.key,
      required this.points,
      required this.color,
      this.lineWidth = 1});

  @override
  State<StatefulWidget> createState() {
    return MapPolylineState();
  }
}

class MapPolylineState extends State<MapPolyline> {
  late Rect bbox;

  late List<Offset> drawPoints;

  @override
  void initState() {
    super.initState();
    setBBox();
    setDrawPoints();
  }

  void setBBox() {
    if (widget.points.isEmpty) {
      bbox = Rect.zero;
    }
    var left = widget.points.first.dx;
    var right = left;
    var bottom = widget.points.first.dy;
    var top = bottom;
    for (final pt in widget.points.skip(1)) {
      left = min(left, pt.dx);
      right = max(right, pt.dx);
      bottom = min(bottom, pt.dy);
      top = max(top, pt.dy);
    }
    bbox = Rect.fromLTRB(left, -top, right, -bottom);
  }

  void setDrawPoints() {
    if (widget.points.isEmpty) {
      drawPoints = [];
    } else {
      drawPoints = List.generate((widget.points.length - 1) * 2, (index) {
        return widget.points[index ~/ 2 + index % 2];
      });
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.points != oldWidget.points) {
      setState(() {
        setBBox();
        setDrawPoints();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: bbox.left,
        top: bbox.top,
        child: CustomPaint(
          size: bbox.size,
          painter: PolylinePainter(
              lineWidth: widget.lineWidth,
              origin: Offset(bbox.left, -bbox.top),
              points: drawPoints,
              color: widget.color),
        ));
  }
}

class PolylinePainter extends CustomPainter {
  final Offset origin;
  final List<Offset> points;
  final double lineWidth;
  final Color color;
  const PolylinePainter(
      {required this.origin,
      required this.points,
      required this.color,
      this.lineWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(1, -1);
    canvas.translate(-origin.dx, -origin.dy);
    final paint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(PointMode.lines, points, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(PolylinePainter oldDelegate) {
    return oldDelegate.origin != origin ||
        oldDelegate.points != points ||
        oldDelegate.color != color ||
        oldDelegate.lineWidth != lineWidth;
  }
}

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  CustomMapState createState() {
    return CustomMapState();
  }
}

class CustomMapState extends State<CustomMap> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer.builder(
        boundaryMargin: const EdgeInsets.all(double.infinity),
        builder: (context, quad) {
          return SizedBox.fromSize(
              size: const Size(100000, 1000000),
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                        width: 200, height: 200, color: Colors.indigo)),
                const MapPolyline(lineWidth: 10, points: [
                  Offset(100, 100),
                  Offset(200, 200),
                  Offset(300, 100)
                ], color: Colors.yellow),
              ]));
        });
  }
}
