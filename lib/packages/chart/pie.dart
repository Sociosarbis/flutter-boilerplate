import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

extension DoubleExt on double {
  /// Checks whether this double is equal to [other], avoiding the floating point
  /// error.
  bool equalTo(double other) => (this - other).abs() < 0.0000001;
}

typedef Item = ({String name, int count});

class ShiftLabelRectShape extends RectShape {
  MarkElement _drawSectorLabel(
    Attributes item,
    Offset labelAnchor,
    PolarCoordConv coord,
  ) {
    assert(item.shape is RectShape);

    Alignment defaultAlign;
    if ((item.shape as RectShape).labelPosition == 1) {
      // Calculate default alignment according to anchor's quadrant.
      final anchorOffset = labelAnchor - coord.center;
      defaultAlign = Alignment(
        anchorOffset.dx.equalTo(0)
            ? 0
            : anchorOffset.dx / anchorOffset.dx.abs(),
        anchorOffset.dy.equalTo(0)
            ? 0
            : anchorOffset.dy / anchorOffset.dy.abs(),
      );
    } else {
      defaultAlign = Alignment.center;
    }

    return LabelElement(
      text: item.label!.text!,
      anchor: labelAnchor,
      defaultAlign: defaultAlign,
      style: item.label!.style,
      tag: item.tag,
    );
  }

  @override
  List<MarkElement> drawGroupLabels(
      List<Attributes> group, CoordConv coord, Offset origin) {
    if (coord is PolarCoordConv && coord.transposed && coord.dimCount == 1) {
      final rst = <MarkElement>[];
      for (var item in group) {
        if (item.label != null) {
          final position = item.position;
          final offsetY = (position[1].dy + position[0].dy) / 2;
          final angle = coord.convertAngle(offsetY);
          var labelAnchor = coord.convert(Offset(
            (item.shape as RectShape).labelPosition,
            offsetY,
          ));
          final startPoint =
              coord.polarToOffset(angle, coord.convertRadius(1.01));
          final shift = cos(angle) < 0
              ? const Offset(-1.0, 0.0)
              : cos(angle) > 0
                  ? const Offset(1.0, 0.0)
                  : sin(angle) > 0
                      ? const Offset(0, -1.0)
                      : const Offset(0, 1.0);
          labelAnchor += shift * 50.0;
          final label = _drawSectorLabel(
            item,
            labelAnchor,
            coord,
          ) as LabelElement;
          switch (label.defaultAlign) {
            case Alignment.topRight:
            case Alignment.topLeft:
              labelAnchor += const Offset(0, -5);
            case Alignment.bottomRight:
            case Alignment.bottomLeft:
              labelAnchor += const Offset(0, 5);
          }
          rst.add(PolylineElement(
              points: [
                startPoint,
                labelAnchor + (shift * -50),
                labelAnchor + (shift * -5),
              ],
              style: PaintStyle(
                  strokeColor: label.style.textStyle?.color, strokeWidth: 1)));
          rst.add(label);
        }
      }
      return rst;
    }
    return super.drawGroupLabels(group, coord, origin);
  }
}

class PieChartPage extends StatefulWidget {
  const PieChartPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return PieChartPageState();
  }
}

class PieChartPageState extends State<PieChartPage> {
  final _data = [
    (name: "Apples", count: 30),
    (name: "Bananas", count: 15),
    (name: "Oranges", count: 25),
    (name: "Grapes", count: 10),
    (name: "Pears", count: 20),
  ];

  final _variables = <String, Variable<Item, dynamic>>{
    "name": Variable(
      accessor: (p0) {
        return p0.name;
      },
    ),
    "count": Variable(
      accessor: (p0) {
        return p0.count;
      },
    )
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chart<Item>(
        data: _data,
        variables: _variables,
        marks: [
          IntervalMark(
              shape: ShapeEncode(
                encoder: (p0) {
                  return ShiftLabelRectShape();
                },
              ),
              label: LabelEncode(encoder: (it) {
                return Label(
                    switch (it) { {"name": String name} => name, _ => "未知" },
                    LabelStyle(textStyle: Defaults.textStyle));
              }),
              modifiers: [StackModifier()],
              color: ColorEncode(variable: "name", values: Defaults.colors10),
              position: Varset("percent") / Varset("name"))
        ],
        transforms: [Proportion(variable: "count", as: "percent")],
        coord: PolarCoord(
            endRadius: 0.5,
            startRadius: 0.2,
            dimCount: 1,
            dimFill: 1.1,
            transposed: true),
      ),
    );
  }
}
