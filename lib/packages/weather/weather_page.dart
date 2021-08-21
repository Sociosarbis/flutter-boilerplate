import 'dart:math';
import 'dart:ui';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/models/weather.dart';
import 'package:flutter_boilerplate/utils/date.dart';

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

  static IconData? renderIcon(String phenomenon) {
    final isNight = DateDart.now()
        .isAfter(DateDart.now().setHour(18).setMinute(0).setSecond(0));
    switch (phenomenon) {
      case '晴':
        return isNight ? IconFontIcons.sunnyNight : IconFontIcons.sunnyDay;
      case '多云':
      case '阴':
        return isNight ? IconFontIcons.cloudyNight : IconFontIcons.cloudyDay;
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
  List<Weather> data;
  WeatherController({this.visible = false, this.data = const []});
}

const PHENOMENON_TO_COLOR = <String, Color>{
  '晴': Colors.orange,
  '多云': Colors.blueGrey,
  '阴': Colors.blueGrey
};

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
    usePreviousEffect((keys) {
      BMFWeatherSearch? weatherSearch;
      BMFReverseGeoCodeSearch? geoSearch;
      if (keys != null) {
        if (keys[1] == null || keys[0] == null) {
          if (mapController.value != null && position != null) {
            final coord = BMFCoordinate(position.latitude, position.longitude);
            mapController.value!
              ..showUserLocation(true)
              ..updateLocationData(
                  BMFUserLocation(location: BMFLocation(coordinate: coord)))
              ..setCenterCoordinate(coord, true, animateDurationMs: 250);
            geoSearch = BMFReverseGeoCodeSearch()
              ..onGetReverseGeoCodeSearchResult(callback: (result, code) {
                if (code == BMFSearchErrorCode.NO_ERROR) {
                  weatherSearch = BMFWeatherSearch()
                    ..onGetWeatherSearchResult(callback: (weatherResult, code) {
                      if (code == BMFSearchErrorCode.NO_ERROR) {
                        weather.value = WeatherController(visible: true, data: [
                          Weather.fromJson(
                              weatherResult.realTimeWeather.toMap())
                        ]);
                      }
                    })
                    ..weatherSearch(BMFWeatherSearchOption(
                        districtID: result.addressDetail.adCode));
                }
              })
              ..reverseGeoCodeSearch(
                  BMFReverseGeoCodeSearchOption(location: coord));
          }
        }
      }
      return () {
        geoSearch?.onGetReverseGeoCodeSearchResult(callback: (res, code) {});
        weatherSearch?.onGetWeatherSearchResult(callback: (res, code) {});
      };
    }, [mapController.value, position]);
    final weatherData = weather.value.visible ? weather.value.data[0] : null;
    final icon = weather.value.visible
        ? IconFontIcons.renderIcon(weather.value.data[0].phenomenon)
        : null;
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
                    child: Card(
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                            width: 200,
                            height: 275,
                            child: Stack(children: [
                              ImageFiltered(
                                  imageFilter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                                            PHENOMENON_TO_COLOR[
                                                weatherData!.phenomenon]!,
                                            Colors.white,
                                            PHENOMENON_TO_COLOR[
                                                weatherData.phenomenon]!
                                          ])),
                                      child: SizedBox.expand())),
                              Center(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (icon != null)
                                    Icon(icon,
                                        size: 48,
                                        color: PHENOMENON_TO_COLOR[
                                            weatherData.phenomenon]),
                                  Text(
                                      "天气：${weatherData.phenomenon}\n" +
                                          "温度：${weatherData.temperature}℃\n" +
                                          "相对湿度：${weatherData.relativeHumidity}%\n" +
                                          "云量：${weatherData.clouds}%\n" +
                                          "风力：${weatherData.windPower}\n" +
                                          "风向：${weatherData.windDirection}",
                                      style: TextStyle(fontSize: 20))
                                ],
                              ))
                            ]))),
                  )
              ],
            )));
  }
}
