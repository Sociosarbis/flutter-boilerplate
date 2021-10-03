import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/components/router/context.dart';
import 'package:flutter_boilerplate/components/router/controllers/router_controller.dart';
import 'package:flutter_boilerplate/components/router/types/pop_result.dart';
import './route.dart';

class AppRouterDelegate extends RouterDelegate<String> with ChangeNotifier {
  final key = GlobalKey<NavigatorState>();
  final AppRouterController _controller;
  final String? initPath;
  final bool alwaysAddInitPath;
  AppRouterDelegate(List<AppRoute> routes, {
    this.initPath,
    this.alwaysAddInitPath = false
  }): _controller = routerContext.createRouterController(RouterContext.rootRouterName, routes: routes) {
    _controller.addListener(notifyListeners);
    _controller.navKey = key;
  }

  @override
  String get currentConfiguration => routerContext.currentPath;
  
  @override
  Future<void> setInitialRoutePath(String configuration) async {
    if (alwaysAddInitPath) {
      await _controller.push(initPath ?? '/');
    }
    if (configuration != '/') {
      await _controller.push(configuration);
      return;
    }
    await _controller.push(initPath ?? configuration);
  }

  @override
  Widget build(context) {
    return navigator;
  }

  Navigator get navigator => Navigator(
        key: key,
        pages: _controller.pages,
        onPopPage: (route, result) {
          _controller.removeLast();
          return false;
        },
      );

  @override
  Future<void> setNewRoutePath(String route) async {
    if (routerContext.history.hasLast &&
        routerContext.history.last.path ==
            routerContext.settings.notFoundPage.path) {
      if (routerContext.history.length > 2) {
        routerContext.history.removeLast();
      }
    }
    if (routerContext.history.hasLast &&
        route == routerContext.history.last.path) {
      routerContext.back();
      return;
    }
    await routerContext.to(route);
    return;
  }

  @override
  Future<bool> popRoute() async {
    final result = await routerContext.back();
    switch (result) {
      case PopResult.NotPopped:
        return false;
      default:
        return true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
