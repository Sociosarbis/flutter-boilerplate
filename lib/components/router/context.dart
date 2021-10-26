import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/router/controllers/controller_manager.dart';
import 'package:flutter_boilerplate/components/router/key.dart';
import 'package:flutter_boilerplate/components/router/router.dart';

import './controllers/router_controller.dart';
import 'pages/dialog.dart';
import './history.dart';
import './params.dart';
import './route.dart';
import './types/pop_result.dart';

class RouterContext {
  static const rootRouterName = 'Root';
  static const INIT_PAGE_NAME = 'Init Page';
  final history = AppHistory();
  final settings = _AppRouterSettings();
  final params = AppParams();
  final treeInfo = _RouteTreeInfo();
  final _manager = ControllerManager();

  String get currentPath => history.isEmpty ? '/' : history.current.path;

  AppNavigator get rootNavigator => navigatorOf(RouterContext.rootRouterName);
  AppNavigator navigatorOf(String name) => _manager.withName(name);

  AppRouterController createRouterController(String name,
          {List<AppRoute>? routes,
          AppRouteChildren? cRoutes,
          String? initPath,
          AppRouteInternal? initRoute}) =>
      _manager.createController(name,
          routes: routes,
          cRoutes: cRoutes,
          initPath: initPath,
          initRoute: initRoute);

  AppRouter createNavigator(String name,
      {List<AppRoute>? routes,
      AppRouteChildren? cRoutes,
      String? initPath,
      AppRouteInternal? initRoute}) {
    final controller = createRouterController(name,
        routes: routes,
        cRoutes: cRoutes,
        initPath: initPath,
        initRoute: initRoute);
    return AppRouter(controller);
  }

  bool removeNavigator(String name) => _manager.removeNavigator(name);

  void updateUrlInfo(String url,
      {Map<String, String>? params,
      MatchKey? mKey,
      String? navigator,
      bool addHistory = false}) {
    rootNavigator.updateUrl(url,
        mKey: mKey,
        params: params,
        navigator: navigator,
        addHistory: addHistory);
  }

  Future<void> to(String path, {bool ignoreSamePath = true}) async {
    if (ignoreSamePath && currentPath == path) {
      return;
    }
    final controller = _manager.withName(rootRouterName);
    final match = await controller.findPath(path);
    await _toMatch(match);
  }

  Future<void> _toMatch(AppRouteInternal match,
      {String forController = rootRouterName}) async {
    final controller = _manager.withName(forController);
    await controller.popUntilOrPushMatch(match, checkChild: false);
    if (match.hasChild) {
      final newControllerName =
          _manager.hasController(match.name) ? match.name : forController;
      await _toMatch(match.child!, forController: newControllerName);
      return;
    }
    if (currentPath != match.activePath) {
      final samePathFromInit = match.route.withChildRouter &&
          match.route.initRoute != null &&
          currentPath == (match.activePath! + match.route.initRoute!);
      if (!samePathFromInit) {
        updateUrlInfo(match.activePath!,
            mKey: match.key,
            params: match.params!.asStringMap(),
            navigator: match.route.name ?? match.route.path,
            addHistory: true);
      }
    }
    if (forController != rootRouterName) {
      (rootNavigator as AppRouterController).update(withParams: false);
    }
  }

  Future<void> replace(String path) async {
    var lastNavi = history.current.navigator;
    if (_manager.hasController(lastNavi)) {
      if (history.hasLast && lastNavi != history.last.navigator) {
        lastNavi = history.last.navigator;
      }
      final controller = navigatorOf(lastNavi);
      await controller.removeLast(allowEmptyPages: true, notify: false);
      await to(path);
    }
  }

  Future<T?> show<T>(AppOverlay overlay, {String? name}) => name == null
      ? rootNavigator.show(overlay)
      : navigatorOf(name).show(overlay);

  Future<PopResult> back() async {
    var lastNavi = history.current.navigator;

    if (_manager.hasController(lastNavi)) {
      if (history.hasLast && lastNavi != history.last.navigator) {
        lastNavi = history.last.navigator;
      }
      final controller = navigatorOf(lastNavi);
      final popResult = await controller.removeLast();
      if (popResult != PopResult.NotPopped) {
        if (lastNavi != rootRouterName) {
          (rootNavigator as AppRouterController).update(withParams: false);
        }
        return PopResult.Popped;
      }
    }

    if (!history.hasLast) {
      return PopResult.NotPopped;
    }
    to(history.last.path);
    history.removeLast(count: 2);
    return PopResult.Popped;
  }
}

class _RouteTreeInfo {
  final Map<String, String> namePath = {RouterContext.rootRouterName: '/'};
  int routeIndexer = -1;
}

class _AppRouterSettings {
  Widget iniPage =
      Material(child: Container(child: Center(child: Text('Loading'))));
  AppRoute notFoundPage = AppRoute(
      path: '/not_found',
      builder: () => Material(child: Center(child: Text('Page Not Found'))));
}

final routerContext = RouterContext();
