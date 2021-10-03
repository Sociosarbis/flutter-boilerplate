import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../key.dart';

abstract class AppPageInternal<T> extends Page {
  final UniqKey matchKey;
  const AppPageInternal({
    required this.matchKey,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) : super(
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);
}

class AppPage extends AppPageInternal {
  final Widget child;

  const AppPage({
    required this.child,
    required UniqKey matchKey,
    LocalKey? key,
    String? restorationId,
    String? name,
    Object? arguments,
  }) : super(
            matchKey: matchKey,
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);

  @override
  Route createRoute(context) {
    return PageRouteBuilder(pageBuilder: (c, a1, a2) => child, settings: this);
  }
}
