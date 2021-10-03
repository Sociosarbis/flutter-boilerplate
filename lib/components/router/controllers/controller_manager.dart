import 'package:flutter_boilerplate/components/router/context.dart';
import 'package:flutter_boilerplate/components/router/key.dart';

import './router_controller.dart';
import '../route.dart';

class ControllerManager {
  final controllers = <AppRouterController>[];

  bool hasController(String name) =>
    controllers.any((element) => element.key.name == name);

  AppRouterController createController(String name, { List<AppRoute>? routes, AppRouteChildren? cRoutes, String? initPath, AppRouteInternal? initRoute}) {
    if (hasController(name)) {
      return controllers.firstWhere((element) => element.key.name == name);
    }
    final routePath = routerContext.treeInfo.namePath[name];      final key = UniqKey(name);
    if (cRoutes == null) {
      cRoutes = AppRouteChildren.from(routes!, key, routePath! == '/' ? '' : routePath);
    }
    final controller = AppRouterController(key, cRoutes, initPath: initPath, initRoute: initRoute);
    controllers.add(controller);
    return controller;
  
  }

  AppRouterController withName(String name) =>
    controllers.firstWhere((element) => element.key.name == name);
  
  bool removeNavigator(String name) {
    if (!hasController(name)) {
      return false;
    }
    final controller = withName(name);
    controller.dispose();
    controllers.remove(controller);
    return true;
  }
}