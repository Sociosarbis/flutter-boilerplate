import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/components/router/context.dart';
import 'package:flutter_boilerplate/components/router/route.dart';
import '../key.dart';
import 'page.dart';

abstract class _PageConverter {
  final String? pageName;
  final MatchKey matchKey;
  final key = ValueKey<int>(Random().nextInt(1000));
  _PageConverter(this.pageName, this.matchKey);

  AppPageInternal createWithChild(Widget child);
}

class PageCreator extends _PageConverter {
  final AppRouteInternal _route;
  AppRoute get route => _route.route;
  PageCreator(this._route) : super(_route.route.name, _route.key);
  AppPageInternal create() => createWithChild(build());
  Widget build() {
    if (route.withChildRouter) {
      final router = routerContext.createNavigator(
        route.name ?? route.path,
        cRoutes: _route.children,
        initPath: route.initRoute ?? '/',
        initRoute: _route.child,
      );
      if (route.initRoute != null && _route.child == null) {
        _route.activePath = '${_route.activePath}${route.initRoute}';
      }
      return route.builderChild!(router);
    }
    return route.builder!();
  }

  @override
  AppPageInternal createWithChild(Widget child) {
    return _getCustomPage(child);
  }

  AppPage _getCustomPage(Widget child) {
    final pageSettings =
        (route.pageSettings ?? CustomPageSettings()) as CustomPageSettings;
    return AppPage(
        child: child,
        matchKey: matchKey,
        key: key,
        name: pageName,
        transitionsBuilder: pageSettings.transitionsBuilder,
        transitionDuration: pageSettings.transitionDuration,
        reverseTransitionDuration: pageSettings.reverseTransitionDuration);
  }
}
