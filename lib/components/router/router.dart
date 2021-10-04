import 'package:flutter/widgets.dart';
import 'controllers/router_controller.dart';

class AppRouter extends StatefulWidget {
  final navKey = GlobalKey<NavigatorState>();

  final AppRouterController _controller;

  AppRouter(this._controller);
  @override
  _AppRouterState createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  @override
  void initState() {
    super.initState();
    widget._controller.addListener(update);
    widget._controller.navKey = widget.navKey;
  }

  void update() {
    setState(() {
    });
  }

  @override
  Widget build(context) {
    return Navigator(
      key: widget.navKey,
      pages: widget._controller.pages,
      onPopPage: (route, result) {
        widget._controller.removeLast();
        return false;
      },
    );
  }

  @override
  void dispose() {
    if (!widget._controller.isDisposed) {
      widget._controller.removeListener(update);
    }
    super.dispose();
  }
}