import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/geolocator_manager.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WeatherPage extends HookWidget {
  @override
  Widget build(context) {
    final position = useProviderContext<Position>(true);
    final mapController = useRef<BMFMapController>(null);

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
        body: BMFMapWidget(
      onBMFMapCreated: (controller) {
        mapController.value = controller;
      },
      mapOptions: BMFMapOptions(
          center: BMFCoordinate(39.917215, 116.380341),
          zoomLevel: 12,
          mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0)),
    ));
  }
}
