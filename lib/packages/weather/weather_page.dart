import 'dart:math';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class WeatherPage extends HookWidget {
  @override
  Widget build(context) {
    final position = useProviderContext<Position>(true);
    final mapController = useRef<BMFMapController>(null);
    final controller = useAnimationController(
        duration: Duration(milliseconds: 1000));
    useAnimation(controller);
    final ratio = CurvedAnimation(parent: controller, curve: Curves.easeInCubic).value;
    usePreviousEffect((keys) {
      if (keys != null) {
        if (keys[1] == null || keys[0] == null) {
          if (mapController.value != null && position != null) {
            mapController.value.showUserLocation(true);
            final coord = BMFCoordinate(position.latitude, position.longitude);
            mapController.value.updateLocationData(
                BMFUserLocation(location: BMFLocation(coordinate: coord)));
            mapController.value
                .setCenterCoordinate(coord, true, animateDurationMs: 250);
          }
        }
      }
      return () {};
    }, [mapController.value, position]);
    return Scaffold(
        body: ClipOval(
      clipper: MyClipper(ratio: ratio),
      child: BMFMapWidget(
        onBMFMapCreated: (_controller) {
          mapController.value = _controller;
          controller.forward(from: 0);
        },
        mapOptions: BMFMapOptions(
            center: BMFCoordinate(39.917215, 116.380341),
            zoomLevel: 12,
            mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0)),
      ),
    ));
  }
}
