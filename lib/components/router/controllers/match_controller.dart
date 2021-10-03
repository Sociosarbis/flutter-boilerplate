import '../route.dart';
import '../params.dart';

class MatchController {
  final Uri path;
  String foundPath;
  final String parentPath;
  final params = AppParams();
  final AppRouteChildren routes;
  var _searchIndex = 0;
  MatchController(String sPath, this.foundPath, this.routes)
      : path = _fixedPathUri(sPath),
        parentPath = foundPath;

  Future<AppRouteInternal> get match async {
    var searchIn = routes;
    AppRouteInternal? match;
    if (path.pathSegments.isEmpty) {
      match = await _tryFind(searchIn, -1);
      if (match == null)
        return AppRouteInternal.notFound(parentPath + path.toString());
      return match;
    }

    match = await _tryFind(searchIn, _searchIndex);
    if (match == null) {
      return AppRouteInternal.notFound(parentPath + path.toString());
    }
    final result = match;
    while (_searchIndex < path.pathSegments.length) {
      searchIn = match!.children!;
      match.child = await _tryFind(searchIn, _searchIndex);
      if (match.child == null) {
        return AppRouteInternal.notFound(parentPath + path.toString());
      }
      match = match.child!;
    }
    return result;
  }

  void updateFoundPath(String segment) {
    foundPath += "/$segment";

    if (path.pathSegments.isEmpty && foundPath.length > 2) {
      foundPath = foundPath.substring(0, foundPath.length - 1);
    }

    if (foundPath.length > 1 &&
        foundPath[foundPath.length - 1] == '/' &&
        foundPath[foundPath.length - 2] == '/') {
      foundPath = foundPath.substring(0, foundPath.length - 1);
    }
    if ((path.pathSegments.isEmpty ||
            (path.pathSegments.isNotEmpty &&
                path.pathSegments.last == segment)) &&
        path.hasQuery) {
      foundPath += '?${path.query}';
      params.addAll(path.queryParameters);
    }
  }

  Future<AppRouteInternal?> _tryFind(AppRouteChildren routes, int index) async {
    var path = index == -1 ? '' : this.path.pathSegments[index];

    var resultIndex = -1;
    resultIndex = routes.routes.indexWhere((route) => route.route.path == '/$path');
    if (resultIndex == -1) {
      final remainLength = this.path.pathSegments.length - index;
      if (remainLength > 1) {
        resultIndex = routes.routes.indexWhere((route) {
          final uri = Uri.parse(route.route.path);
          if (uri.pathSegments.length < 1 || uri.pathSegments.length > remainLength) return false;
          var i = 0;
          for (;i < uri.pathSegments.length;i++) {
            if (uri.pathSegments[i] != this.path.pathSegments[index + i]) return false;
          }
          for (;i > 0;i--) {
            updateFoundPath(this.path.pathSegments[_searchIndex++]);
          }
          return true;
        });
      }
    }
    if (resultIndex != -1) {
      if (index == -1 || _searchIndex == index) {
        updateFoundPath(path);
        _searchIndex++;
      }
      final result = routes.routes[resultIndex];
      result.clean();
      result.activePath = foundPath;
      result.params = params.copyWith();
      return result;
    }
    return null;
  }

  static Uri _fixedPathUri(String path) {
    final _fixedPath = Uri.parse(path);
    if (_fixedPath.pathSegments.isNotEmpty &&
        _fixedPath.pathSegments.last.isEmpty) {
      return _fixedPath.replace(
          pathSegments: ([..._fixedPath.pathSegments])..removeLast());
    }
    return _fixedPath;
  }
}
