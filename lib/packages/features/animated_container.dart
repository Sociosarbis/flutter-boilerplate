import 'dart:math';

import 'package:flutter/material.dart';

class _MainState extends State<Main> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer Demo'),
      ),
      body: Center(
          child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn)),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              final random = Random();
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                  random.nextInt(256), 1);

              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          }),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}
