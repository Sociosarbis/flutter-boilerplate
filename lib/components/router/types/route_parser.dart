import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../context.dart';

class AppRouteInformationParser extends RouteInformationParser<String> {
  const AppRouteInformationParser();
  @override
  Future<String> parseRouteInformation(
          RouteInformation routeInformation) async =>
      SynchronousFuture(routeInformation.location ?? '/');

  @override
  RouteInformation restoreRouteInformation(String match) =>
      RouteInformation(location: routerContext.currentPath);
}