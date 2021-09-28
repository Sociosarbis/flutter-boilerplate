import 'dart:math';
import 'dart:ui';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/models/weather_one_day.dart';
import 'package:flutter_boilerplate/models/weather.dart';
import 'package:flutter_boilerplate/components/transition.dart';
import 'package:flutter_boilerplate/utils/date.dart';
import 'package:flutter_boilerplate/services/weather.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

bool isNight(DateDart date) {
  final lo = date.setHour(18).setMinute(0).setSecond(0);
  final hi = date.setHour(7).setMinute(0).setSecond(0);
  return date.isAfter(lo) || date.isBefore(hi);
}

class IconFontIcons {
  static final fontFamily = 'iconfont';
  static final sunnyDay =
      IconData(0xe61e, fontFamily: IconFontIcons.fontFamily);
  static final sunnyNight =
      IconData(0xe606, fontFamily: IconFontIcons.fontFamily);
  static final cloudyDay =
      IconData(0xe639, fontFamily: IconFontIcons.fontFamily);
  static final cloudyNight =
      IconData(0xe605, fontFamily: IconFontIcons.fontFamily);
  static final modRain = IconData(0xe620, fontFamily: IconFontIcons.fontFamily);
  // 阵雨
  static final shower = IconData(0xe664, fontFamily: IconFontIcons.fontFamily);

  static IconData? renderIcon(String phenomenon, {bool? night}) {
    final _isNight = night == null ? isNight(DateDart.now()) : night;
    switch (phenomenon) {
      case '晴':
        return _isNight ? IconFontIcons.sunnyNight : IconFontIcons.sunnyDay;
      case '多云':
      case '阴':
        return _isNight ? IconFontIcons.cloudyNight : IconFontIcons.cloudyDay;
      case '阵雨':
        return IconFontIcons.shower;
      case '中雨':
        return IconFontIcons.modRain;
      default:
    }
    return null;
  }
}

class MyClipper extends CustomClipper<Rect> {
  final double ratio;
  MyClipper({this.ratio = 0.0}) : super();
  @override
  Rect getClip(Size size) {
    final _size = Size.square(max(size.width, size.height));
    return Offset(-_size.width, -_size.height) & (_size * 2.4 * ratio);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class WeatherController {
  bool visible;
  List<dynamic>? data;
  WeatherController({this.visible = false, this.data = const []});
}

final phenomenonToColor = <String, Color>{
  '晴': Colors.orange,
  '多云': Colors.blueGrey,
  '阵雨': Colors.grey,
  '中雨': Colors.grey.shade700,
  '阴': Colors.blueGrey
};

class FreeScrollPhysics extends PageScrollPhysics {
  final double viewportFraction;
  const FreeScrollPhysics({ScrollPhysics? parent, this.viewportFraction = 1})
      : super(parent: parent);
  @override
  FreeScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return FreeScrollPhysics(
        parent: buildParent(ancestor), viewportFraction: viewportFraction);
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / (position.viewportDimension * 0.75);
  }

  double _getPixels(ScrollMetrics position, double page) {
    return page * (position.viewportDimension * 0.75);
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity || velocity > tolerance.velocity)
      page += (velocity / tolerance.velocity) * 0.005;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }
}

class WeatherCard extends HookWidget {
  final dynamic data;
  WeatherCard({required this.data});

  Weather selectDayOrNight(WeatherOneDay oneDayData, {required bool isNight}) {
    return Weather(
        time: oneDayData.date,
        relativeHumidity: oneDayData.humidity,
        phenomenon: !isNight ? oneDayData.textDay : oneDayData.textNight,
        clouds: oneDayData.cloud,
        windPower:
            isNight ? oneDayData.windScaleDay : oneDayData.windScaleNight,
        tempRange: Range(min: oneDayData.tempMin, max: oneDayData.tempMax),
        windDirection:
            isNight ? oneDayData.windDirDay : oneDayData.windDirNight);
  }

  Widget renderCardContent(Weather weather,
      {required bool isOneDay, required bool isNight}) {
    final fgColor = isNight
        ? ColorTween(
                begin: phenomenonToColor[weather.phenomenon], end: Colors.white)
            .lerp(0.3)
        : phenomenonToColor[weather.phenomenon];
    final blackWhite = isNight ? Colors.white : Colors.black;
    final icon = IconFontIcons.renderIcon(weather.phenomenon, night: isNight);
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            isOneDay
                ? "${weather.time.month}月${weather.time.day}日"
                : "${weather.time.day}日${weather.time.hour}时",
            style: TextStyle(fontSize: 20, color: blackWhite)),
        if (icon != null) Icon(icon, size: 48, color: fgColor),
        Text(
            "天气：${weather.phenomenon}\n" +
                "温度：${isOneDay ? "${weather.tempRange.min} ~ ${weather.tempRange.max}" : weather.temperature}℃\n" +
                "相对湿度：${weather.relativeHumidity}%\n" +
                "云量：${weather.clouds}%\n" +
                "风力：${weather.windPower}\n" +
                "风向：${weather.windDirection}",
            style: TextStyle(fontSize: 18, color: blackWhite))
      ],
    ));
  }

  @override
  Widget build(context) {
    final isOneDay = useMemoized(() {
      return data is WeatherOneDay;
    }, [data]);
    final showDay = useWatchState(() => isOneDay
        ? true
        : !isNight(DateDart.fromDateTime((data as Weather).time)), [isOneDay]);

    final weather = useMemoized(() {
      final oneDayData = isOneDay ? data as WeatherOneDay : null;
      return oneDayData != null
          ? selectDayOrNight(oneDayData, isNight: false)
          : data as Weather;
    }, [isOneDay]);

    return Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: 200,
            height: 275,
            child: Transition(
                isEnter: !showDay.value,
                builder: (context, progress) {
                  final ratio = progress * 0.3;
                  final bgColor = ColorTween(
                          begin: phenomenonToColor[weather.phenomenon],
                          end: Colors.black)
                      .lerp(ratio);
                  return Stack(children: [
                    Positioned.fill(
                        left: -20,
                        right: -20,
                        top: -20,
                        bottom: -20,
                        child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                                tileMode: TileMode.decal),
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                      0,
                                      0.25,
                                      1
                                    ],
                                        colors: [
                                      bgColor!,
                                      ColorTween(
                                              begin: Colors.white,
                                              end: Colors.black)
                                          .lerp(progress)!,
                                      bgColor
                                    ])),
                                child: SizedBox.expand()))),
                    isOneDay
                        ? AnimatedCrossFade(
                            layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
                              return Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                    key: bottomChildKey,
                                    child: bottomChild,
                                  ),
                                  Positioned(
                                    key: topChildKey,
                                    child: topChild,
                                  ),
                                ],
                              );
                            },
                            crossFadeState: showDay.value
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            firstChild: renderCardContent(weather,
                                isOneDay: isOneDay, isNight: false),
                            secondChild: renderCardContent(weather,
                                isOneDay: isOneDay, isNight: true),
                            duration: Duration(milliseconds: 250),
                            reverseDuration: Duration(milliseconds: 200),
                          )
                        : renderCardContent(weather,
                            isOneDay: isOneDay, isNight: !showDay.value),
                    if (isOneDay)
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Switch(
                              activeColor: Colors.black,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade100,
                              value: showDay.value,
                              onChanged: (v) {
                                showDay.value = v;
                              }))
                  ]);
                })));
  }
}

class WeatherPage extends HookWidget {
  static double viewportFraction = 0.75;
  @override
  Widget build(context) {
    final position = useProviderContext<Position?>(true);
    final mapController = useRef<BMFMapController?>(null);
    final controller =
        useAnimationController(duration: Duration(milliseconds: 1000));
    useAnimation(controller);
    final ratio =
        CurvedAnimation(parent: controller, curve: Curves.easeInCubic).value;
    final weather = useState(WeatherController());
    final index = useState(0);
    final pageController = useRef(PageController(
        initialPage: index.value,
        viewportFraction: WeatherPage.viewportFraction));

    final weatherMode = useState(-1);
    usePreviousEffect((keys) {
      if (keys != null) {
        if (keys[1] == null || keys[0] == null) {
          if (mapController.value != null && position != null) {
            final coord = BMFCoordinate(position.latitude, position.longitude);
            mapController.value!
              ..showUserLocation(true)
              ..updateLocationData(
                  BMFUserLocation(location: BMFLocation(coordinate: coord)))
              ..setCenterCoordinate(coord, true, animateDurationMs: 250);
            if (weatherMode.value == -1) {
              weatherMode.value = 0;
            }
          }
        }
      }
      return () {};
    }, [mapController.value, position]);

    useEffect(() {
      if (position != null) {
        var isValid = true;
        switch (weatherMode.value) {
          case 1:
            WeatherService.forecast(position).then((data) {
              if (data != null && isValid) {
                if (pageController.value.hasClients)
                  pageController.value.jumpToPage(0);
                weather.value = WeatherController(visible: true, data: data);
              }
            });
            break;
          case 0:
            WeatherService.forecastHourly(position).then((data) {
              if (data != null && isValid) {
                if (pageController.value.hasClients)
                  pageController.value.jumpToPage(0);
                weather.value = WeatherController(visible: true, data: data);
              }
            });
            break;
        }
        return () {
          isValid = false;
        };
      }
    }, [weatherMode.value]);
    return Scaffold(
        body: ClipOval(
            clipper: MyClipper(ratio: ratio),
            child: Stack(
              children: [
                BMFMapWidget(
                  onBMFMapCreated: (_controller) {
                    mapController.value = _controller;
                    controller.forward(from: 0);
                  },
                  mapOptions: BMFMapOptions(
                      center: BMFCoordinate(39.917215, 116.380341),
                      zoomLevel: 12,
                      mapPadding: BMFEdgeInsets(
                          left: 30, top: 0, right: 30, bottom: 0)),
                ),
                if (weather.value.visible) ...[
                  Container(
                      color:
                          (weatherMode.value == 0 ? Colors.blue : Colors.orange)
                              .withOpacity(0.5)),
                  Center(
                      child: PageView.builder(
                          physics: FreeScrollPhysics(
                              viewportFraction: WeatherPage.viewportFraction),
                          pageSnapping: false,
                          controller: pageController.value,
                          itemCount: weather.value.data?.length ??
                              weather.value.data?.length,
                          onPageChanged: (i) {
                            index.value = i;
                          },
                          itemBuilder: (context, i) {
                            return Center(
                                child: Transition(
                                    isEnter: i == index.value,
                                    builder: (context, progress) {
                                      return Transform.scale(
                                          scale: 1 + progress * 0.5,
                                          child: WeatherCard(
                                              data: weather.value.data![i]));
                                    }));
                          }))
                ]
              ],
            )),
        bottomNavigationBar: weatherMode.value != -1
            ? BottomNavigationBar(
                selectedItemColor:
                    weatherMode.value == 0 ? null : Colors.orange,
                currentIndex: weatherMode.value,
                onTap: (i) {
                  weatherMode.value = i;
                },
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.hourglass_bottom), label: '24小时'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.holiday_village), label: '7天')
                  ])
            : null);
  }
}
