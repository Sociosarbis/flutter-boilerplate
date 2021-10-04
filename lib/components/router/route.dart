import "package:flutter/widgets.dart";
import 'context.dart';
import 'params.dart';
import 'key.dart';
import 'pages/page.dart';
import 'router.dart';

typedef PageBuilder = Widget Function();
typedef PageBuilderWithChildBuilder = Widget Function(AppRouter);

class AppRoute {
  final String path;
  final String? name;
  final String? initRoute;
  final PageBuilder? builder;
  final PageSettings? pageSettings;
  final PageBuilderWithChildBuilder? builderChild;
  final List<AppRoute>? children;

  const AppRoute(
      {required this.path, required this.builder, this.name, this.children, this.initRoute, this.pageSettings})
      : builderChild = null;

  const AppRoute.withChild(
      {required this.path,
      required this.builderChild,
      this.name,
      this.initRoute,
      this.pageSettings,
      this.children})
      : builder = null;

  bool get withChildRouter => builderChild != null;

  AppRoute copyWith(
      {String? path,
      String? name,
      PageBuilder? builder,
      List<AppRoute>? children}) {
    if (withChildRouter) {
      return AppRoute.withChild(
          path: path ?? this.path,
          name: name ?? this.name,
          builderChild: builderChild ?? this.builderChild,
          children: children ?? this.children);
    }
    return AppRoute(
        path: path ?? this.path,
        name: name ?? this.name,
        builder: builder ?? this.builder,
        children: children ?? this.children);
  }
}

class AppRouteInternal {
  final MatchKey key;
  final AppRoute route;
  final bool isNotFound;
  // 匹配到本路由的当前路径
  String? activePath;
  // 匹配到本路由的当前参数
  AppParams? params;
  // 匹配到的子路由
  AppRouteInternal? child;
  final AppRouteChildren? children;
  final String fullPath;

  AppRouteInternal(
      {required this.key,
      required this.route,
      required this.fullPath,
      required this.isNotFound,
      this.activePath,
      this.params,
      this.children});

  String get name => route.name ?? route.path;
  bool get hasChild => child != null;
  factory AppRouteInternal.from(AppRoute route, String currentPath) {
    final key = MatchKey(route.name ?? route.path);
    if (!route.path.startsWith('/')) {
      route = route.copyWith(path: '/${route.path}');
    }
    final fullPath = '$currentPath${route.path}';
    routerContext.treeInfo.namePath[route.name ?? route.path] = fullPath;
    return AppRouteInternal(
        key: key,
        route: route,
        fullPath: fullPath,
        isNotFound: false,
        children: route.children == null
            ? null
            : AppRouteChildren.from(route.children!, key, fullPath));
  }

  factory AppRouteInternal.notFound(String notFoundPath) {
    final route = routerContext.settings.notFoundPage;
    final key = MatchKey(route.name ?? route.path);
    return AppRouteInternal(
        key: key,
        route: route,
        fullPath: route.path,
        isNotFound: true,
        params: AppParams(params: {}),
        activePath: notFoundPath,
        children: route.children == null
            ? null
            : AppRouteChildren.from(route.children!, key, route.path));
  }
  void clean() {
    child = null;
    activePath = null;
    params = null;
  }
}

class AppRouteChildren {
  final String parentFullPath;
  final MatchKey parentKey;
  final List<AppRouteInternal> _routes;

  List<AppRouteInternal> get routes => _routes;

  AppRouteChildren(this._routes, this.parentKey, this.parentFullPath);

  factory AppRouteChildren.from(
      List<AppRoute> routes, MatchKey key, String currentPath) {
    final result = <AppRouteInternal>[];
    for (final route in routes) {
      result.add(AppRouteInternal.from(route, currentPath));
    }
    return AppRouteChildren(result, key, currentPath);
  }

  void add(List<AppRoute> routes) {
    for (final route in routes) {
      if (!_routes.any((element) => element.route.path == route.path)) {
        _routes.add(AppRouteInternal.from(route, parentFullPath));
      }
    }
  }
}
