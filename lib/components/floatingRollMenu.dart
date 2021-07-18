import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Main extends HookWidget {
  @override
  Widget build(context) {
    final isOpen = useState(false);
    final controller = useAnimationController(
        duration: Duration(seconds: 1),
        reverseDuration: Duration(milliseconds: 500));
    useAnimation(controller);
    final opacity = CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.easeIn)).value;
    final move = CurvedAnimation(
        parent: controller, curve: Interval(0.25, 1, curve: Curves.easeIn)).value;
    final translateX = 50 + 2 * pi * 25 * move;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          minimumSize: Size.square(50),
        ),
        onPressed: () async {
          if (!isOpen.value) {
            isOpen.value = true;
            controller.reset();
            controller.forward();
          } else {
            await controller.reverse();
            isOpen.value = false;
          }
        },
        child: isOpen.value
            ? SizedBox.fromSize(
                size: Size(translateX, 50),
                child: Stack(children: [
                  if (controller.value >= 0.25)
                    Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateZ(-4 * pi * move),
                        child: Opacity(
                            opacity: opacity,
                            child: ElevatedButton(
                              child: Icon(Icons.cloud, size: 15),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  fixedSize: Size.square(50),
                                  minimumSize: Size.square(15)),
                              onPressed: () {
                                // todo
                                print('get weather data');
                              },
                            )))
                ]))
            : Icon(Icons.work));
  }
}
