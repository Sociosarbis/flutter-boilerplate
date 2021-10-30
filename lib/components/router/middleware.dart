class RouteMiddleware {
  Future<bool> canPop() async => true; 
}

class RouteMiddlewareBuilder extends RouteMiddleware {
  final Future<bool> Function()? canPopFunc;
  RouteMiddlewareBuilder({
    this.canPopFunc
  });

  @override
  Future<bool> canPop() async {
    return this.canPopFunc?.call() ?? super.canPop();
  }
}