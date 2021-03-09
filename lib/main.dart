import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './packages/features/animated_container.dart' as AnimatedContainer;
import './packages/features/physis_animation.dart' as PhysisAnimation;
import './packages/comment/main.dart' as Comment;
import './packages/features/login.dart' as Login;
import './packages/bgm/components/login.dart' as BGMLogin;
import './stores/user.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
    super.initState();
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
            MaterialPage(key: UniqueKey(), child: Main())),
  ], configs: [
    RouteDefinition(
        test: MyAppRoutePath.testPhysisAnimation,
        name: '/physisAnimation',
        builder: (BuildContext context) =>
            MaterialPage(key: UniqueKey(), child: PhysisAnimation.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testAnimatedContainer,
        name: '/animatedContainer',
        builder: (BuildContext context) =>
            MaterialPage(key: UniqueKey(), child: AnimatedContainer.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testLogin,
        name: '/login',
        builder: (BuildContext context) =>
            MaterialPage(key: UniqueKey(), child: Login.Main())),
    RouteDefinition(
        test: MyAppRoutePath.testComment,
        name: '/comment',
        builder: (BuildContext context) =>
            MaterialPage(key: UniqueKey(), child: Comment.Main())),
    RouteDefinition(
        test: (Uri uri) => true,
        name: '/',
        builder: (BuildContext context) =>
            MaterialPage(key: UniqueKey(), child: Main())),
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
      if (!pageManager.pages.last.test(path.uri)) {
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

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ButtonColumn(
          color: color,
          icon: Icons.call,
          label: 'CALL',
          onPress: () => this._goToDetails(context, 'animatedContainer')),
      ButtonColumn(
          color: color,
          icon: Icons.near_me,
          label: 'ROUTE',
          onPress: () => this._goToDetails(context, 'physisAnimation')),
      ButtonColumn(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
          onPress: () => this._goToDetails(context, 'login'))
    ]));

    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView(
          children: [
            Container(
              height: Provider.of<UserStore>(context)
                      .cookie
                      .containsKey('chii_auth')
                  ? 0
                  : 400,
              child: BGMLogin.Main(onLogin: (cookie) {
                print(Provider.of<MyAppRouterDelegate>(context, listen: false)
                    .uri);
              }),
            ),
            buttonSection,
            ElevatedButton(
                onPressed: () {
                  _goToDetails(context, 'comment');
                },
                child: Text('Comment Section')),
          ],
        ));
  }

  void _goToDetails(BuildContext context, String route) {
    Provider.of<MyAppRouterDelegate>(context, listen: false)
        .pushRoute('/$route');
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
