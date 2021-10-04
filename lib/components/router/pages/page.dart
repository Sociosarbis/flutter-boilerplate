import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../key.dart';

abstract class PageSettings {
  final bool maintainState;
  final String? restorationId;
  const PageSettings(this.maintainState, this.restorationId);
}

class CustomPageSettings extends PageSettings {
  final RouteTransitionsBuilder transitionsBuilder;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;
  const CustomPageSettings(
      {this.transitionDuration = const Duration(milliseconds: 300),
      this.reverseTransitionDuration = const Duration(milliseconds: 300),
      this.transitionsBuilder = _defaultTransitionsBuilder,
      String? restorationId,
      bool maintainState = true})
      : super(maintainState, restorationId);
}

abstract class AppPageInternal<T> extends Page {
  final MatchKey matchKey;
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

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

class AppPage extends AppPageInternal {
  final Widget child;
  final RouteTransitionsBuilder transitionsBuilder;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;

  const AppPage({
    required this.child,
    required MatchKey matchKey,
    required this.transitionDuration,
    required this.reverseTransitionDuration,
    required this.transitionsBuilder,
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
    return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        settings: this,
        transitionDuration: transitionDuration,
        transitionsBuilder: transitionsBuilder,
        reverseTransitionDuration: reverseTransitionDuration);
  }

  factory AppPage.defaultSettings({
    required Widget child,
    required MatchKey matchKey,
  }) {
    final pageSettings = CustomPageSettings();
    return AppPage(
        child: child,
        matchKey: matchKey,
        transitionDuration: pageSettings.transitionDuration,
        reverseTransitionDuration: pageSettings.reverseTransitionDuration,
        transitionsBuilder: pageSettings.transitionsBuilder);
  }
}
