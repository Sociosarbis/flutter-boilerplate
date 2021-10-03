import 'components/router/lib.dart';
import 'packages/features/physis_animation.dart' as PhysisAnimation;
import 'packages/features/animated_container.dart' as AnimatedContainer;
import 'packages/features/login.dart' as Login;
import 'packages/bgm/components/login.dart' as BGMLogin;
import 'packages/comment/main.dart' as Comment;
import 'packages/weather/weather_page.dart';
import 'my_app.dart';

final routes = [
  AppRoute(path: '/', builder: () => Main()),
  AppRoute(
      path: '/bgm/login',
      builder: () => BGMLogin.Main(
          onLogin: (cookie) {
            final params = routerContext.params.asStringMap();
            if (params.containsKey('redirect_from')) {
              routerContext.replace(Uri.decodeComponent(params['redirect_from']!));
            } else {
              routerContext.back();
            }
          },
          onScrollBound: (touchDetails) {})),
  AppRoute(path: '/physisAnimation', builder: () => PhysisAnimation.Main()),
  AppRoute(path: '/animatedContainer', builder: () => AnimatedContainer.Main()),
  AppRoute(path: '/login', builder: () => Login.Main()),
  AppRoute(path: '/comment', builder: () => Comment.Main()),
  AppRoute(path: '/weather', builder: () => WeatherPage()),
];
