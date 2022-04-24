import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ClickOutsideListener extends StatefulWidget {
  final Widget child;
  const ClickOutsideListener({required this.child, Key? key}) : super(key: key);

  @override
  _ClickOutsideListenerState createState() => _ClickOutsideListenerState();
}

class _ClickOutsideListenerState extends State<ClickOutsideListener> {
  late final StreamController<PointerEvent> controller;

  @override
  void initState() {
    controller = StreamController.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Listener(
        onPointerDown: ((event) {
          controller.sink.add(event);
        }),
        child: Provider.value(value: controller.stream, child: widget.child));
  }
}

class ClickOutside extends StatefulWidget {
  final Widget child;
  final void Function() onClickOutside;
  const ClickOutside(
      {required this.child, required this.onClickOutside, Key? key})
      : super(key: key);

  @override
  _ClickOutsideState createState() => _ClickOutsideState();
}

class _ClickOutsideState extends State<ClickOutside> {
  late final StreamSubscription<PointerEvent?> sub;

  @override
  void initState() {
    final stream = Provider.of<Stream<PointerEvent>>(context);
    sub = stream.listen((event) {
      final renderObj = context.findRenderObject();
      if (renderObj != null) {
        final renderBox = renderObj as RenderBox;
        final result = BoxHitTestResult();
        if (renderBox.hitTest(result,
            position: renderBox.globalToLocal(event.position))) {
          widget.onClickOutside();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(context) {
    return widget.child;
  }
}
