import 'package:flutter/widgets.dart';
import 'components/router/lib.dart';
import 'packages/features/physis_animation.dart' as PhysisAnimation;
import 'packages/features/animated_container.dart' as AnimatedContainer;
import 'packages/features/login.dart' as Login;
import 'packages/bgm/components/login.dart' as BGMLogin;
import 'packages/comment/main.dart' as Comment;
import 'packages/weather/weather_page.dart';
import 'my_app.dart';

final slidePageSettings = CustomPageSettings(
    transitionDuration: Duration(milliseconds: 250),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, page) {
      final begin = Offset(1.0, 0.0);
      final end = Offset.zero;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: page);
    });

final routes = [
  AppRoute(path: '/', builder: () => Main()),
  AppRoute(
      path: '/bgm/login',
      pageSettings: slidePageSettings,
      builder: () => BGMLogin.Main(
          onLogin: (cookie) {
            final params = routerContext.params.asStringMap();
            if (params.containsKey('redirect_from')) {
              routerContext
                  .replace(Uri.decodeComponent(params['redirect_from']!));
            } else {
              routerContext.back();
            }
          },
          onScrollBound: (touchDetails) {})),
  AppRoute(
      path: '/physisAnimation',
      pageSettings: slidePageSettings,
      builder: () => PhysisAnimation.Main()),
  AppRoute(
      path: '/animatedContainer',
      pageSettings: slidePageSettings,
      builder: () => AnimatedContainer.Main()),
  AppRoute(
      path: '/login',
      pageSettings: slidePageSettings,
      builder: () => Login.Main()),
  AppRoute(
      path: '/comment',
      pageSettings: slidePageSettings,
      builder: () => Comment.Main()),
  AppRoute(
      path: '/weather',
      pageSettings: slidePageSettings,
      builder: () => WeatherPage()),
];