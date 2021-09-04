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
  // 阵雨
  static final shower = IconData(0xe664, fontFamily: IconFontIcons.fontFamily);

  static IconData? renderIcon(String phenomenon, { bool? night }) {
    final isNight = night == null ? DateDart.now()
        .isAfter(DateDart.now().setHour(18).setMinute(0).setSecond(0)) : night;
    switch (phenomenon) {
      case '晴':
        return isNight ? IconFontIcons.sunnyNight : IconFontIcons.sunnyDay;
      case '多云':
      case '阴':
        return isNight ? IconFontIcons.cloudyNight : IconFontIcons.cloudyDay;
      case '阵雨':
        return IconFontIcons.shower;
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
  List<WeatherOneDay> data;
  WeatherController({this.visible = false, this.data = const []});
}

const PHENOMENON_TO_COLOR = <String, Color>{
  '晴': Colors.orange,
  '多云': Colors.blueGrey,
  '阵雨': Colors.grey,
  '阴': Colors.blueGrey
};

class WeatherCard extends HookWidget {
  final WeatherOneDay data;
  WeatherCard({required this.data});

  @override
  Widget build(context) {
    final showDay = useState(true);
    final weather = useMemoized(() {
      return Weather(
          relativeHumidity: data.humidity,
          phenomenon: showDay.value ? data.textDay : data.textNight,
          clouds: data.cloud,
          windPower: showDay.value ? data.windScaleDay : data.windScaleNight,
          tempRange: Range(min: data.tempMin, max: data.tempMax),
          windDirection: showDay.value ? data.windDirDay : data.windDirNight);
    }, [showDay.value]);
    final icon = IconFontIcons.renderIcon(weather.phenomenon, night: !showDay.value);
    return Card(
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: 200,
            height: 275,
            child: Stack(children: [
              Positioned.fill(
                  left: -20,
                  right: -20,
                  top: -20,
                  bottom: -20,
                  child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                          sigmaX: 10.0, sigmaY: 10.0, tileMode: TileMode.decal),
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
                                PHENOMENON_TO_COLOR[weather.phenomenon]!,
                                Colors.white,
                                PHENOMENON_TO_COLOR[weather.phenomenon]!
                              ])),
                          child: SizedBox.expand()))),
              Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null)
                    Icon(icon,
                        size: 48,
                        color: PHENOMENON_TO_COLOR[weather.phenomenon]),
                  Text(
                      "天气：${weather.phenomenon}\n" +
                          "温度：${weather.tempRange.min} ~ ${weather.tempRange.max}℃\n" +
                          "相对湿度：${weather.relativeHumidity}%\n" +
                          "云量：${weather.clouds}%\n" +
                          "风力：${weather.windPower}\n" +
                          "风向：${weather.windDirection}",
                      style: TextStyle(fontSize: 20))
                ],
              ))
            ])));
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
    final pageController = useRef(PageController(initialPage: index.value));

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
            WeatherService.forecast(position).then((data) {
              if (data != null) {
                weather.value = WeatherController(visible: true, data: data);
              }
            });
          }
        }
      }
      return () {};
    }, [mapController.value, position]);
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
                          itemCount: weather.value.data.length,
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
                                              data: weather.value.data[i]));
                                    }));
                          }))
              ],
            )));
  }
}
