import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FloatingRollMenu extends HookWidget {
  final void Function(String)? onSelect;
  FloatingRollMenu({this.onSelect});
  @override
  Widget build(context) {
    final isOpen = useState(false);
    final controller = useAnimationController(
        duration: Duration(milliseconds: 250),
        reverseDuration: Duration(milliseconds: 200));
    useAnimation(controller);
    final move = CurvedAnimation(
            parent: controller, curve: Interval(0.25, 1, curve: Curves.easeIn))
        .value;
    final translateX = 50 + pi * 50 * move;
    final toggleOpen = useCallback(() async {
      if (!isOpen.value) {
        isOpen.value = true;
        controller.reset();
        controller.forward();
      } else {
        await controller.reverse();
        isOpen.value = false;
      }
    }, []);
    return SizedBox.fromSize(
        size: Size(500, 50),
        child: Stack(alignment: Alignment.centerRight, children: [
          if (isOpen.value) ...[
            Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(-translateX)
                  ..rotateZ(-4 * pi * move),
                child: ElevatedButton(
                      child: ShaderMask(
                        child: Icon(Icons.cloud, size: 15),
                        shaderCallback: (rect) {
                          return LinearGradient(
                                  colors: [Colors.orange, Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              .createShader(Offset.zero & rect.size);
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          fixedSize: Size.square(50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          minimumSize: Size.square(15)),
                      onPressed: () {
                        onSelect?.call('weather');
                        toggleOpen();
                      },
                    )),
          ],
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.all(0),
                  fixedSize: Size.square(50),
                  alignment: Alignment.center),
              onPressed: toggleOpen,
              child: Icon(Icons.work)),
        ]));
  }
}
