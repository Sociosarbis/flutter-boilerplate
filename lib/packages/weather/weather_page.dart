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
    final isNight = night == null
        ? DateDart.now()
            .isAfter(DateDart.now().setHour(18).setMinute(0).setSecond(0))
        : night;
    switch (phenomenon) {
      case '晴':
        return isNight ? IconFontIcons.sunnyNight : IconFontIcons.sunnyDay;
      case '多云':
      case '阴':
        return isNight ? IconFontIcons.cloudyNight : IconFontIcons.cloudyDay;
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
  List<WeatherOneDay>? data;
  List<Weather>? timelyData;
  WeatherController({this.visible = false, this.data = const []});
  WeatherController.timely({this.visible = false, this.timelyData = const []});
}

final phenomenonToColor = <String, Color>{
  '晴': Colors.orange,
  '多云': Colors.blueGrey,
  '阵雨': Colors.grey,
  '中雨': Colors.grey.shade700,
  '阴': Colors.blueGrey
};

class WeatherCard extends HookWidget {
  final WeatherOneDay? data;
  final Weather? timelyData;
  WeatherCard({required this.data}): timelyData = null;
  WeatherCard.timely({required this.timelyData}): data = null;

  @override
  Widget build(context) {
    final showDay = useState(true);
    final weather = useMemoized(() {
      return data != null
          ? Weather(
              time: data!.date,
              relativeHumidity: data!.humidity,
              phenomenon: showDay.value ? data!.textDay : data!.textNight,
              clouds: data!.cloud,
              windPower:
                  showDay.value ? data!.windScaleDay : data!.windScaleNight,
              tempRange: Range(min: data!.tempMin, max: data!.tempMax),
              windDirection:
                  showDay.value ? data!.windDirDay : data!.windDirNight)
          : timelyData;
    }, [showDay.value, data == null])!;
    final icon =
        IconFontIcons.renderIcon(weather.phenomenon, night: !showDay.value);
    return Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: 200,
            height: 275,
            child: Transition(
                isEnter: !showDay.value,
                builder: (context, progress) {
                  final ratio = progress * 0.3;
                  final fgColor = ColorTween(
                          begin: phenomenonToColor[weather.phenomenon],
                          end: Colors.white)
                      .lerp(ratio);
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
                    Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(data != null ? "${weather.time.month}月${weather.time.day}日" : "${weather.time.day}日${weather.time.hour}时", style: TextStyle(fontSize: 20)),
                        if (icon != null) Icon(icon, size: 48, color: fgColor),
                        Text(
                            "天气：${weather.phenomenon}\n" +
                                "温度：${data != null ? "${weather.tempRange.min} ~ ${weather.tempRange.max}" : weather.temperature}℃\n" +
                                "相对湿度：${weather.relativeHumidity}%\n" +
                                "云量：${weather.clouds}%\n" +
                                "风力：${weather.windPower}\n" +
                                "风向：${weather.windDirection}",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorTween(
                                        begin: Colors.black, end: Colors.white)
                                    .lerp(progress)))
                      ],
                    )),
                    if (data != null) Positioned(
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
    final pageController = useRef(
        PageController(initialPage: index.value, viewportFraction: 0.75));

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
                if (pageController.value.hasClients) pageController.value.jumpToPage(0);
                weather.value = WeatherController(visible: true, data: data);
              }
            });
            break;
          case 0:
            WeatherService.forecastHourly(position).then((data) {
              if (data != null && isValid) {
                if (pageController.value.hasClients) pageController.value.jumpToPage(0);
                weather.value =
                    WeatherController.timely(visible: true, timelyData: data);
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
                if (weather.value.visible)
                  Center(
                      child: PageView.builder(
                          controller: pageController.value,
                          itemCount: weather.value.data?.length ??
                              weather.value.timelyData?.length,
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
                                          child: weather.value.data != null
                                              ? WeatherCard(
                                                  data: weather.value.data![i])
                                              : WeatherCard.timely(
                                                  timelyData: weather
                                                      .value.timelyData![i]));
                                    }));
                          }))
              ],
            )),
        bottomNavigationBar: weatherMode.value != -1 ? BottomNavigationBar(
            currentIndex: weatherMode.value,
            onTap: (i) {
              weatherMode.value = i;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.hourglass_bottom), label: '24小时'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.holiday_village), label: '7天')
            ]) : null);
  }
}
