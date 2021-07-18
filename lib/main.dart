import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './packages/features/animated_container.dart' as AnimatedContainer;
import './packages/features/physis_animation.dart' as PhysisAnimation;
import './packages/comment/main.dart' as Comment;
import './packages/features/login.dart' as Login;
import './packages/bgm/components/login.dart' as BGMLogin;
import './stores/user.dart';
import 'package:uni_links/uni_links.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter_boilerplate/components/floatingRollMenu.dart' as FloatingRollMenu;

void main() async {
  runApp(MyApp());
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          )),
      SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ))
    ]);
  }

  void _toggleFavorite() {
    setState(() {
      _favoriteCount += _isFavorited ? -1 : 1;
      _isFavorited = !_isFavorited;
    });
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  UserStore userStore;
  ValueNotifier<GraphQLClient> client;
  StreamSubscription<Uri> sub;
  @override
  void initState() {
    userStore = UserStore();
    client = ValueNotifier(GraphQLClient(
        cache: GraphQLCache(),
        link: AuthLink(
            headerKey: 'Cookie',
            getToken: () =>
                userStore.cookieStr).concat(HttpLink(
            "https://sociosarbis-media-player.netlify.app/.netlify/functions/graphql"))));
    getInitialUri().then(onLaunch);
    sub = uriLinkStream.listen(onLaunch);
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  void onLaunch(Uri uri) {
    if (uri != null) {
      switch (uri.host) {
        case 'episodetopic':
          _myAppRouterDelegate.pushRoute('/comment?${uri.query}');
          break;
        default:
      }
    }
  }

  MyAppRouteInformationParser _appRouteInformationParser =
      MyAppRouteInformationParser();
  MyAppRouterDelegate _myAppRouterDelegate = MyAppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: userStore,
        child: GraphQLProvider(
            client: client,
            child: MaterialApp.router(
              title: 'Welcome To Flutter',
              theme: ThemeData(accentColor: Colors.red),
              debugShowCheckedModeBanner: false,
              routeInformationParser: _appRouteInformationParser,
              routerDelegate: _myAppRouterDelegate,
            )));
  }
}

class RouteConfig {
  String path;
  Page page;
  List<RouteConfig> children;
}

class MyAppRoutePath {
  Uri uri;
  MyAppRoutePath({this.uri});

  bool get isAnimatedContainer {
    return MyAppRoutePath.testAnimatedContainer(uri);
  }

  static bool testAnimatedContainer(Uri uri) {
    return uri != null &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments[0] == 'animatedContainer';
  }

  bool get isPhysisAnimation {
    return MyAppRoutePath.testPhysisAnimation(uri);
  }

  static bool testPhysisAnimation(Uri uri) {
    return uri != null &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments[0] == 'physisAnimation';
  }

  bool get isLogin {
    return MyAppRoutePath.testLogin(uri);
  }

  static bool testLogin(Uri uri) {
    return uri != null &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments[0] == 'login';
  }

  get isComment {
    return MyAppRoutePath.testComment(uri);
  }

  static bool testComment(Uri uri) {
    return uri != null &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments[0] == 'comment';
  }
}

class MyAppRouteInformationParser extends RouteInformationParser {
  @override
  Future<MyAppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return MyAppRoutePath(uri: Uri.parse(routeInformation.location));
  }

  @override
  RouteInformation restoreRouteInformation(dynamic path) {
    if (path.isAnimatedContainer) {
      return RouteInformation(location: '/animatedContainer');
    }
    if (path.isPhysisAnimation) {
      return RouteInformation(location: '/physisAnimation');
    }
    if (path.isLogin) {
      return RouteInformation(location: '/login');
    }
    if (path.isComment) {
      return RouteInformation(location: '/comment');
    }
    return RouteInformation(location: '/');
  }
}

class RouteDefinition {
  bool Function(Uri uri) test;
  String name;
  Page<dynamic> Function(BuildContext context) builder;
  RouteDefinition({this.test, this.name, this.builder});
}

class PageManager with ChangeNotifier {
  List<RouteDefinition> pages;
  List<RouteDefinition> configs;

  PageManager({@required this.pages, @required this.configs});

  Uri push<T>(T location) {
    Uri uri;
    if (location is Uri) {
      uri = location;
    } else {
      uri = Uri.parse(location as String);
    }
    for (var c in configs) {
      if (c.test(uri)) {
        pages.add(c);
        notifyListeners();
        break;
      }
    }
    return uri;
  }

  RouteDefinition pop() {
    final last = pages.removeLast();
    notifyListeners();
    return last;
  }

  void popUntil(bool Function(RouteDefinition) test) {
    while (pages.isNotEmpty && !test(pages.last)) {
      pages.removeLast();
    }
  }

  Uri replace<T>(T location) {
    pages.removeLast();
    return push<T>(location);
  }
}

class MyAppBackButtonDispatcher extends BackButtonDispatcher {}

class MyAppRouterDelegate extends RouterDelegate<MyAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppRoutePath> {
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');

  Uri uri;

  MyAppRouterDelegate() {
    pageManager.addListener(notifyListeners);
  }

  PageManager pageManager = PageManager(pages: [
    RouteDefinition(
        test: (Uri uri) => true,
        name: '/',
        builder: (BuildContext context) =>
            SlidePage(key: Key('root'), child: Main())),
  ], configs: [
    RouteDefinition(
        test: MyAppRoutePath.testPhysisAnimation,
        name: '/physisAnimation',
        builder: (BuildContext context) => SlidePage(
            key: Key('physisAnimation'), child: PhysisAnimation.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testAnimatedContainer,
        name: '/animatedContainer',
        builder: (BuildContext context) => SlidePage(
            key: Key('animatedContainer'), child: AnimatedContainer.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testLogin,
        name: '/login',
        builder: (BuildContext context) =>
            SlidePage(key: Key('login'), child: Login.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testComment,
        name: '/comment',
        builder: (BuildContext context) =>
            SlidePage(key: Key('comment'), child: Comment.Main()))
  ]);

  MyAppRoutePath get currentConfiguration {
    return MyAppRoutePath(uri: uri);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: this,
        child: Navigator(
          key: navigatorKey,
          pages: [for (var def in pageManager.pages) def.builder(context)],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            pageManager.pop();

            return true;
          },
        ));
  }

  @override
  Future<void> setNewRoutePath(MyAppRoutePath path) async {
    uri = path.uri;
    if (pageManager.pages.isNotEmpty) {
      final i = pageManager.pages.indexWhere((routeDefinition) {
        return routeDefinition.test(path.uri);
      });
      if (i != -1) {
        pageManager.pages.add(pageManager.pages.removeAt(i));
      } else {
        pageManager.push(path.uri);
      }
    }
  }

  void pushRoute(String location) {
    uri = Uri.parse(location);
    pageManager.push(uri);
  }

  void popRouteUntil(bool Function(RouteDefinition) test) {
    pageManager.popUntil(test);
  }

  void replaceRoute(String location) {
    uri = Uri.parse(location);
    pageManager.replace(uri);
  }
}

void Function(String) useRoutePush() {
  final router = useProviderContext<MyAppRouterDelegate>(false);
  return useCallback((String route) {
    router.pushRoute(route);
  }, [router]);
}

Future<bool> Function() useBackButtonPressed() {
  final isOpened = useRef(false);
  final context = useContext();
  return useCallback(() async {
    if (isOpened.value) return false;
    isOpened.value = true;
    final completer = Completer<bool>();
    showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('提示'),
              content: Text('确认退出？'),
              actions: [
                TextButton(
                  child: Text('取消'),
                  onPressed: () {
                    completer.complete(false);
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: Text('确认'),
                  onPressed: () {
                    completer.complete(true);
                    Navigator.pop(context, true);
                  },
                )
              ]);
        }).then((res) async {
      completer.complete(res ?? false);
      isOpened.value = false;
    });
    return await completer.future;
  }, [context]);
}

class Main extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final channel = useRef<MethodChannel>(null);
    final counter = useState(0);
    final isServiceRunning = useState(false);
    final startService = useCallback(() async {
      try {
        await channel.value?.invokeMethod('create');
      } catch (error) {
        print(error);
      }
    }, [channel]);

    final stopService = useCallback(() async {
      try {
        await channel.value.invokeMethod('destroy');
      } catch (error) {
        print(error);
      }
    }, [channel]);

    useEffect(() {
      channel.value = MethodChannel('notification');
      channel.value.setMethodCallHandler((call) {
        if (call.method == 'increase') {
          counter.value++;
        } else if (call.method == 'decrease') {
          counter.value--;
        }
        return;
      });
      return stopService;
    }, [stopService]);

    final handleBackButtonPressed = useBackButtonPressed();

    final goToDetails = useRoutePush();

    final userStore = useProviderContext<UserStore>(true);

    final router = useProviderContext<MyAppRouterDelegate>(false);

    Widget buttonSection = Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ButtonColumn(
          color: color,
          icon: Icons.call,
          label: 'CALL',
          onPress: () => goToDetails('animatedContainer')),
      ButtonColumn(
          color: color,
          icon: Icons.near_me,
          label: 'ROUTE',
          onPress: () => goToDetails('physisAnimation')),
      ButtonColumn(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
          onPress: () => goToDetails('login'))
    ]));

    return WillPopScope(
      onWillPop: handleBackButtonPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          floatingActionButton: FloatingRollMenu.Main(),
          body: Login.Loading(
              visible: userStore.isLogining,
              text: '登录中',
              child: ListView(
                children: [
                  Container(
                    height: userStore.cookie.containsKey('chii_auth') ? 0 : 400,
                    child: BGMLogin.Main(onLogin: (cookie) {
                      final uri = router.uri;
                      if (uri.queryParameters.containsKey('redirect_from')) {
                        router.pushRoute(Uri.decodeComponent(
                            uri.queryParameters['redirect_from']));
                      }
                    }),
                  ),
                  buttonSection,
                  ElevatedButton(
                      onPressed: () {
                        // goToDetails('comment?id=436209&subject_id=104906');
                      },
                      child: Text('Comment Section')),
                  ElevatedButton(
                      onPressed: () {
                        /*!isServiceRunning.value
                            ? startService()
                            : stopService();
                        isServiceRunning.value = !isServiceRunning.value;*/
                      },
                      child: Text(
                          '${isServiceRunning.value ? 'running' : 'stopped'} (${counter.value})'))
                ],
              ))),
    );
  }
}

class ButtonColumn extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final Function onPress;

  ButtonColumn({this.color, this.icon, this.label, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: onPress,
        ),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    );
  }
}

class SlidePage<T> extends Page<T> {
  final Widget child;
  SlidePage({@required this.child, LocalKey key}) : super(key: key);
  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (_, __, ___) {
          return child;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, page) {
          final begin = Offset(1.0, 0.0);
          final end = Offset.zero;
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.ease));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: page);
        });
  }
}
