import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class Transition extends HookWidget {
  final bool isEnter;
  // milliseconds
  final int enterDuration;
  final int leaveDuration;
  final Curve enterEasing;
  final Curve leaveEasing;
  final Widget Function(BuildContext context, double progress) builder;
  Transition({
    required this.isEnter,
    required this.builder,
    this.enterDuration = 250,
    this.leaveDuration = 200,
    this.enterEasing = Curves.easeInCubic,
    this.leaveEasing = Curves.easeOutCubic,
  });

  @override
  Widget build(context) {
    final controller = useAnimationController(duration: Duration(milliseconds: enterDuration), reverseDuration: Duration(milliseconds: leaveDuration));
    final animation = useMemoized(() {
      return CurvedAnimation(parent: controller, curve: enterEasing, reverseCurve: leaveEasing);
    }, [controller, enterEasing, leaveEasing]);
    useEffect(() {
      if (isEnter) {
        if (controller.value != 1.0) {
          controller.forward();
        }
      } else {
        if (controller.value != 0.0) {
          controller.reverse();
        }
      }
      return () {};
    }, [isEnter]);
    return builder(context, useAnimation(animation));
  }
}
