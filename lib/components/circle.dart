import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Circle extends StatelessWidget {
  final Color color;
  Circle({this.color = Colors.transparent});
  @override
  Widget build(context) {
    return DecoratedBox(decoration: ShapeDecoration(color: color, shape: CircleBorder()));
  }
}