import 'package:flutter/material.dart';
import './packages/features/animated_container.dart' as AnimatedContainer;

void main() {
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
  MyAppRouteInformationParser _appRouteInformationParser =
      MyAppRouteInformationParser();
  MyAppRouterDelegate _myAppRouterDelegate = MyAppRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Welcome To Flutter',
      routeInformationParser: _appRouteInformationParser,
      routerDelegate: _myAppRouterDelegate,
    );
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
}

class MyAppRouteInformationParser extends RouteInformationParser {
  @override
  Future<MyAppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    return MyAppRoutePath(uri: Uri.parse(routeInformation.location));
  }
}

class MyAppRouterDelegate extends RouterDelegate<MyAppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyAppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  Uri uri;

  MyAppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  MyAppRoutePath get currentConfiguration {
    return MyAppRoutePath(uri: uri);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: ValueKey('main'),
            child: Main(
              onPushRoute: pushRoute,
            )),
        if (uri != null &&
            uri.pathSegments.isNotEmpty &&
            uri.pathSegments[0] == 'animatedContainer')
          MaterialPage(
              key: ValueKey('animatedContainer'),
              child: AnimatedContainer.Main())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        uri = uri.replace(path: '/');
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyAppRoutePath path) async {
    uri = path.uri;
  }

  void pushRoute(String location) {
    uri = uri.replace(path: location);
    notifyListeners();
  }
}

class Main extends StatelessWidget {
  final Function onPushRoute;
  // This widget is the root of your application.
  Main({@required this.onPushRoute});
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('Oeschinen Lake Campground',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Text('Kandersteg, Switzerland',
                      style: TextStyle(color: Colors.grey[500]))
                ],
              ),
            ),
            FavoriteWidget(),
          ],
        ));

    Widget buttonSection = Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ButtonColumn(
          color: color,
          icon: Icons.call,
          label: 'CALL',
          onPress: () => this._goToDetails(context)),
      ButtonColumn(
          color: color,
          icon: Icons.near_me,
          label: 'ROUTE',
          onPress: () => this._goToDetails(context)),
      ButtonColumn(
          color: color,
          icon: Icons.share,
          label: 'SHARE',
          onPress: () => this._goToDetails(context))
    ]));

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView(
          children: [
            Image.asset('images/lake.jpg',
                width: 600, height: 240, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection,
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AnimatedContainer.Main()));
                },
                child: Text('Animated Container'))
          ],
        ));
  }

  void _goToDetails(BuildContext context) {
    onPushRoute('/animatedContainer');
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
