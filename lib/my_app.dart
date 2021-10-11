import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'components/router/lib.dart';
import 'routes.dart';
import './stores/user.dart';
import 'package:uni_links/uni_links.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter_boilerplate/utils/io_transport.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';

import 'package:flutter_boilerplate/components/floating_roll_menu.dart';

import 'package:flutter_boilerplate/protos/book/book.pbgrpc.dart';
import 'env.dart';

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
  UserStore? userStore;
  ValueNotifier<GraphQLClient>? client;
  GeolocatorManager? geolocatorManager;
  BookServiceClient? bookServiceClient;
  StreamSubscription<Uri?>? sub;
  @override
  void initState() {
    userStore = UserStore();
    geolocatorManager = GeolocatorManager()..init();
    bookServiceClient = BookServiceClient(GrpcIOClientChannel(
        Uri.parse('${env!.grpcBaseUrl}/.netlify/functions/grpc')));
    client = ValueNotifier(GraphQLClient(
        cache: GraphQLCache(),
        link: AuthLink(
            headerKey: 'Cookie',
            getToken: () =>
                userStore!.cookieStr).concat(HttpLink(
            "https://sociosarbis-media-player.netlify.app/.netlify/functions/graphql"))));
    getInitialUri().then(onLaunch);
    sub = uriLinkStream.listen(onLaunch);
    super.initState();
  }

  @override
  void dispose() {
    sub?.cancel();
    geolocatorManager?.dispose();
    super.dispose();
  }

  void onLaunch(Uri? uri) {
    if (uri != null) {
      switch (uri.host) {
        case 'episodetopic':
          routerContext.to('/comment?${uri.query}');
          break;
        default:
      }
    }
  }

  AppRouterDelegate _appRouterDelegate = AppRouterDelegate(routes);
  AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: userStore!),
          Provider.value(value: bookServiceClient!),
          ValueListenableProvider.value(value: geolocatorManager!.position)
        ],
        builder: (context, widget) {
          return GraphQLProvider(
              client: client!,
              child: MaterialApp.router(
                title: 'Welcome To Flutter',
                theme: ThemeData(accentColor: Colors.red),
                debugShowCheckedModeBanner: false,
                routeInformationParser: _appRouteInformationParser,
                routerDelegate: _appRouterDelegate,
              ));
        });
  }
}

void Function(String) useRoutePush() {
  return (String route) {
    routerContext.to(route);
  };
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
  Main({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final channel = useRef<MethodChannel?>(null);
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
        await channel.value?.invokeMethod('destroy');
      } catch (error) {
        print(error);
      }
    }, [channel]);

    useEffect(() {
      channel.value = MethodChannel('notification');
      channel.value?.setMethodCallHandler((call) async {
        if (call.method == 'increase') {
          counter.value++;
        } else if (call.method == 'decrease') {
          counter.value--;
        }
      });
      return stopService;
    }, [stopService]);

    final handleBackButtonPressed = useBackButtonPressed();

    final goToDetails = useRoutePush();

    final userStore = useProviderContext<UserStore>(true);

    final bookServiceClient = useProviderContext<BookServiceClient>(false);

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
          icon: Icons.video_label,
          label: 'VIDEO',
          onPress: () => goToDetails('/bgm/video'))
    ]));

    final controller = useRef<ScrollController>(ScrollController());

    return WillPopScope(
      onWillPop: handleBackButtonPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          floatingActionButton: FloatingRollMenu(
            onSelect: goToDetails,
          ),
          body: ListView(
            controller: controller.value,
            children: [
              buttonSection,
              ElevatedButton(
                  onPressed: () {
                    routerContext.to('/bgm/login');
                  },
                  child: Text('BGM Login')),
              ElevatedButton(
                  onPressed: () {
                    !isServiceRunning.value ? startService() : stopService();
                    isServiceRunning.value = !isServiceRunning.value;
                  },
                  child: Text(
                      '${isServiceRunning.value ? 'running' : 'stopped'} (${counter.value})')),
              ElevatedButton(
                  onPressed: () async {
                    final res = await bookServiceClient.createBook(Book(
                        isbn: "0-670-81302-9",
                        title: "白銀の墟　玄の月　第一巻　十二国記 (新潮文庫)",
                        author: Author(firstName: "不由美", lastName: "小野")));
                    print(res);
                  },
                  child: Text('call grpc')),
            ],
          )),
    );
  }
}

class ButtonColumn extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;
  final Function() onPress;

  ButtonColumn(
      {required this.color,
      required this.icon,
      required this.label,
      required this.onPress});
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
