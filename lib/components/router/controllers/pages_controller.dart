import 'package:flutter_boilerplate/components/router/key.dart';

import '../route.dart';
import '../pages/page.dart';
import '../pages/page_creator.dart';
import '../context.dart';
import '../types/pop_result.dart';

class PagesController {
  final routes = <AppRouteInternal>[];
  final pages = <AppPageInternal>[
    AppPage.defaultSettings(matchKey: MatchKey(RouterContext.INIT_PAGE_NAME), child: routerContext.settings.iniPage)
  ];

  bool exist(AppRouteInternal route) =>
    routes.any((element) => element.key.isSame(route.key));

  Future<void> add(AppRouteInternal route) async {
    routes.add(route);
    pages.add(PageCreator(route).create());
    pages.removeWhere((element) => element.matchKey.name == RouterContext.INIT_PAGE_NAME);
  }

  Future<PopResult> removeLast({ bool allowEmptyPages = false}) async {
    if (routes.isEmpty) {
      return PopResult.NotPopped;
    }

    final route = routes.last;
    if (allowEmptyPages == false && routes.length == 1) {
      return PopResult.NotPopped;
    }
    if (routerContext.removeNavigator(route.name)) {
      routerContext.history.removeWithNavigator(route.name);
    }
    routerContext.history.removeLast();
    if (routerContext.history.hasLast && routerContext.history.current.path == route.fullPath) {
      routerContext.history.removeLast();
    }
    routes.removeLast();
    pages.removeLast();
    return PopResult.Popped;
  }
}