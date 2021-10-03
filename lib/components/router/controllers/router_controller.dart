import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/components/router/context.dart';
import 'package:flutter_boilerplate/components/router/pages/page.dart';
import 'package:flutter_boilerplate/components/router/params.dart';
import '../route.dart';
import '../key.dart';
import './pages_controller.dart';
import './match_controller.dart';
import '../types/pop_result.dart';
import '../history.dart';

abstract class AppNavigator extends ChangeNotifier {
  Future<PopResult> removeLast({ bool allowEmptyPages = false, bool notify = true });
  Future<AppRouteInternal> findPath(String path);
  void updateUrl(String url,
      {Map<String, String>? params,
      UniqKey? mKey,
      String? navigator = '',
      bool addHistory = false});
  Future<void> popUntilOrPush(String path);
  Future<void> replaceLast(String path);
  Future<void> push(String path);
  void dispose();
}

class AppRouterController extends AppNavigator {
  final UniqKey key;
  GlobalKey<NavigatorState>? navKey;
  final AppRouteChildren routes;
  bool isDisposed = false;
  final _pagesController = PagesController();

  AppRouterController(this.key, this.routes,
      {String? initPath, AppRouteInternal? initRoute}) {
    if (initRoute != null) {
      addRouteAsync(initRoute);
    } else if (initPath != null) {
      push(initPath);
    }
  }

  List<AppPageInternal> get pages => List.unmodifiable(_pagesController.pages);

  @override
  Future<PopResult> removeLast({ bool allowEmptyPages = false, bool notify = true }) async {
    final isPopped = await _pagesController.removeLast(allowEmptyPages: allowEmptyPages);
    if (notify && isPopped == PopResult.Popped) {
      update(withParams: true);
    }
    return isPopped;
  }

  @override
  Future<void> replaceLast(String path) async {
    if ((await _pagesController.removeLast(allowEmptyPages: true)) !=
        PopResult.Popped) return;
    push(path);
  }

  @override
  Future<AppRouteInternal> findPath(String path) =>
      MatchController(path, routes.parentFullPath, routes).match;
  @override
  Future<void> push(String path) async {
    final match = await findPath(path);
    await addRouteAsync(match);
  }

  void update({withParams = false}) {
    if (withParams) {
      routerContext.params.updateParams(routerContext.history.current.params);
    }
    notifyListeners();
  }

  @override
  void updateUrl(String url,
      {Map<String, String>? params,
      UniqKey? mKey,
      String? navigator = '',
      bool addHistory = false}) {
    if (key.name != RouterContext.rootRouterName) {
      return;
    }
    routerContext.history.add(AppHistoryEntry(
        mKey ?? UniqKey('Out Route'),
        url,
        AppParams(params: {})..addAll(params ?? Uri.parse(url).queryParameters),
        navigator ?? 'Out Route',
        false));
    if (!addHistory) {
      routerContext.history.removeLast();
    }
  }

  @override
  Future<void> popUntilOrPush(String path) async {
    await popUntilOrPushMatch(await findPath(path));
  }

  Future<void> popUntilOrPushMatch(AppRouteInternal match,
      {bool checkChild = true}) async {
    final index = _pagesController.routes
        .indexWhere((element) => element.key.key == match.key.key);
    if (index == -1) {
      await addRouteAsync(match, checkChild: checkChild);
      return;
    }
    if (match.hasChild) {
      if (checkChild) {
        await popUntilOrPushMatch(match.child!);
      }
    }
    if (index == _pagesController.pages.length - 1) {
      if ((await _pagesController.removeLast(allowEmptyPages: true)) !=
          PopResult.Popped) return;
      await addRouteAsync(match, checkChild: checkChild);
      return;
    }
    final pagesLength = _pagesController.pages.length;
    for (var i = index + 1; i < pagesLength; i++) {
      if (await _pagesController.removeLast() != PopResult.Popped) return;
    }
    update();
  }

  Future<void> addRouteAsync(AppRouteInternal match,
      {bool checkChild = true, bool notify = true}) async {
    routerContext.params.updateParams(match.params!);
    await _addRoute(match);
    while (checkChild && match.hasChild && !match.route.withChildRouter) {
      await _addRoute(match.child!);
      match = match.child!;
    }
    if (notify && !isDisposed) {
      update();
      updatePathIfNeeded(match);
    }
  }

  void updatePathIfNeeded(AppRouteInternal match) {
    if (key.name != RouterContext.rootRouterName) {
      routerContext.updateUrlInfo(match.activePath!,
          mKey: match.key,
          params: match.params!.asStringMap(),
          navigator: key.name);
    }
  }

  Future<void> _addRoute(AppRouteInternal route) async {
    if (_pagesController.exist(route) && route.hasChild) {
      return;
    }
    routerContext.history.add(AppHistoryEntry(
        route.key, route.activePath!, route.params!, key.name, route.hasChild));
    await _pagesController.add(route);
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
