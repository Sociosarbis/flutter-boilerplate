import '../route.dart';

class MiddlewareController {
  AppRouteInternal route;
  MiddlewareController(this.route);

  Future<bool> runCanPop() async {
    if (!route.route.hasMiddlewares) return true;
    for (final middleware in route.route.middlewares!) {
      if (!await middleware.canPop()) return false;
    }
    return true;
  }
}