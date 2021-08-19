import 'dart:math';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/models/weather.dart';

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
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text("天气：${weatherData!.phenomenon}\n" +
                                "温度：${weatherData.temperature}℃\n" +
                                "相对湿度：${weatherData.relativeHumidity}%\n" +
                                "云量：${weatherData.clouds}%\n" +
                                "风力：${weatherData.windPower}\n" +
                                "风向：${weatherData.windDirection}"))),
                  )
              ],
            )));
  }
}
