import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/assets.dart';
import 'package:flutter_boilerplate/components/anime_image_view.dart';
import 'package:flutter_boilerplate/components/future_cache_builder.dart';
import 'package:flutter_boilerplate/models/bgm/res.dart';
import 'package:flutter_boilerplate/models/bgm/subject.dart';
import 'package:flutter_boilerplate/models/config/app.dart';
import 'package:flutter_boilerplate/services/bgm.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';
import 'package:flutter_boilerplate/utils/android_stretch_scroll_behavior.dart';
import 'package:flutter_boilerplate/utils/cache_disk_utils/cache_disk_utils.dart';
import 'package:flutter_boilerplate/utils/snapshot_painters.dart';
import 'package:flutter_boilerplate/utils/ticking_builder.dart';
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
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
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

  final _appRouterDelegate = AppRouterDelegate(routes);
  final _appRouteInformationParser = const AppRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider<AppConfig?>(
            create: (context) async {
              return AppConfig.init();
            },
            initialData: null,
          ),
          FutureProvider<FragmentPrograms?>(
              create: (context) async {
                return loadFragmentPrograms();
              },
              initialData: null),
          ChangeNotifierProvider.value(value: userStore!),
          Provider.value(value: bookServiceClient!),
          Provider(create: (_) => const BgmService()),
          ValueListenableProvider.value(value: geolocatorManager!.position)
        ],
        builder: (context, widget) {
          final theme = ThemeData();
          return GraphQLProvider(
              client: client!,
              child: MaterialApp.router(
                title: 'Welcome To Flutter',
                theme: ThemeData(
                    colorScheme:
                        theme.colorScheme.copyWith(secondary: Colors.red),
                    extensions: const [BgmThemeExtension()]),
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
              title: const Text('提示'),
              content: const Text('确认退出？'),
              actions: [
                TextButton(
                  child: const Text('取消'),
                  onPressed: () {
                    completer.complete(false);
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  child: const Text('确认'),
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
  const Main({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    final channel = useRef<MethodChannel?>(null);
    final snapshotController =
        useRef(SnapshotController(allowSnapshotting: true));
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
      channel.value = const MethodChannel('notification');
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

    final bookServiceClient = useProviderContext<BookServiceClient>(false);

    Widget buttonSection =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
    ]);

    final bgmService = Provider.of<BgmService>(context);
    final weekday = DateTime.now().weekday - 1;

    final controller = useRef<ScrollController>(ScrollController());
    return WillPopScope(
        onWillPop: handleBackButtonPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Consumer<FragmentPrograms?>(
                builder: (context, programs, chlid) {
              const textWidget = Text('Welcome to Flutter');
              return programs == null
                  ? textWidget
                  : TickingBuilder(builder: (context, time) {
                      return SnapshotWidget(
                          controller: snapshotController.value,
                          painter: GlitchSnapshotPainter(
                              time: time, program: programs.ui),
                          child: textWidget);
                    });
            }),
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
                  child: const Text('BGM Login')),
              ElevatedButton(
                  onPressed: () {
                    !isServiceRunning.value ? startService() : stopService();
                    isServiceRunning.value = !isServiceRunning.value;
                  },
                  child: Text(
                      '${isServiceRunning.value ? 'running' : 'stopped'} (${counter.value})')),
              ElevatedButton(onPressed: () async {
                final res = await bookServiceClient.createBook(Book(
                    isbn: "0-670-81302-9",
                    title: "白銀の墟　玄の月　第一巻　十二国記 (新潮文庫)",
                    author: Author(firstName: "不由美", lastName: "小野")));
                print(res);
              }, child: Consumer<FragmentPrograms?>(
                  builder: (context, programs, chlid) {
                const textWidget = Text('call grpc');
                return programs == null
                    ? textWidget
                    : TickingBuilder(builder: (context, time) {
                        return SnapshotWidget(
                            controller: snapshotController.value,
                            painter: GlitchSnapshotPainter(
                                time: time, program: programs.ui),
                            child: textWidget);
                      });
              })),
              SizedBox(
                  height: 200,
                  child: FutureCacheBuilder(
                      futureBuilder: () {
                        return bgmService.getCalendar();
                      },
                      cacheBuilder: () {
                        return CacheDiskUtils.getInstance()
                            .then((value) =>
                                value.getJSONArray(BgmService.calendarCacheKey))
                            .then((value) => value
                                ?.map((item) => GetCalendarItem.fromJson(item))
                                .toList());
                      },
                      deps: [weekday],
                      builder: (_, snapshot, cacheSnapshot) {
                        final hasData = snapshot.hasData ||
                            (cacheSnapshot.hasData &&
                                cacheSnapshot.data != null);
                        final data = snapshot.data ?? cacheSnapshot.data;
                        if (!hasData || weekday >= data!.length) {
                          return const SizedBox.shrink();
                        }
                        final items = data[weekday].items;
                        return ScrollConfiguration(
                            behavior: AndroidStretchScrollBehavior(),
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: items.length,
                              cacheExtent: (120 * items.length).toDouble(),
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (_, i) => AnimeImageView(
                                items[i].images?.tryGet(ImageSize.large) ?? "",
                                attention:
                                    items[i].collection?.getFollow() ?? 0,
                                width: 120,
                                title: items[i].name,
                              ),
                            ));
                      }))
            ],
          ),
        ));
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
