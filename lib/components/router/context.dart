class RouterContext {
  static const rootRouterName = 'Root';
  final treeInfo = _RouteTreeInfo();
}

class _RouteTreeInfo {
  final Map<String, String> namePath = { RouterContext.rootRouterName: '/' };
  int routeIndexer = -1;
}


final routerContext = RouterContext();