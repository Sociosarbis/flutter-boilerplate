import "package:flutter/widgets.dart";
import './context.dart';

typedef PageBuilder = Page Function();

class AppRoute {
  final String path;
  final String? name;
  final PageBuilder? builder;
  final List<AppRoute>? children;

  const AppRoute(
      {required this.path, required this.builder, this.name, this.children});

  AppRoute copyWith(
      {String? path,
      String? name,
      PageBuilder? builder,
      List<AppRoute>? children}) {
    return AppRoute(
        path: path ?? this.path,
        name: name ?? this.name,
        builder: builder ?? this.builder,
        children: children ?? this.children);
  }
}

class AppRouteInternal {
  final AppRoute route;
  final bool isNotFound;
  final AppRouteChildren? children;
  final String fullPath;

  AppRouteInternal(
      {required this.route,
      required this.fullPath,
      required this.isNotFound,
      this.children});

  factory AppRouteInternal.from(AppRoute route, String currentPath) {
    if (!route.path.startsWith('/')) {
      route = route.copyWith(path: '/${route.path}');
    }
    final fullPath = '$currentPath${route.path}';
    routerContext.treeInfo.namePath[route.name ?? route.path] = fullPath;
    return AppRouteInternal(
        route: route,
        fullPath: fullPath,
        isNotFound: false,
        children: route.children == null
            ? null
            : AppRouteChildren.from(route.children!, fullPath));
  }
}

class AppRouteChildren {
  final String parentFullPath;
  final List<AppRouteInternal> _routes;

  AppRouteChildren(this._routes, this.parentFullPath);

  factory AppRouteChildren.from(List<AppRoute> routes, String currentPath) {
    final result = <AppRouteInternal>[];
    for (final route in routes) {
      result.add(AppRouteInternal.from(route, currentPath));
    }
    return AppRouteChildren(result, currentPath);
  }

  void add(List<AppRoute> routes) {
    for (final route in routes) {
      if (!_routes.any((element) => element.route.path == route.path)) {
        _routes.add(AppRouteInternal.from(route, parentFullPath));
      }
    }
  }
}
