import "package:flutter/material.dart";
import "package:flutter/physics.dart";

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAligenment = Alignment.center;
  Animation<Alignment> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragAligenment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Phisis Animation'),
      ),
      body: GestureDetector(
          onPanDown: (details) {
            _controller.stop();
          },
          onPanUpdate: (details) {
            setState(() {
              _dragAligenment += Alignment(details.delta.dx / (size.width / 2),
                  details.delta.dy / (size.height / 2));
            });
          },
          onPanEnd: (details) {
            _runAnimation(details.velocity.pixelsPerSecond, size);
          },
          child: Align(
              alignment: _dragAligenment,
              child: Card(child: FlutterLogo(size: 128)))),
    );
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _dragAligenment, end: Alignment.center));

    final unitVelocity = Offset(
            pixelsPerSecond.dx / size.width, pixelsPerSecond.dy / size.height)
        .distance;

    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);

    _controller.animateWith(SpringSimulation(spring, 0, 1, -unitVelocity));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
