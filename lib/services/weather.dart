import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/models/weather.dart';
import 'package:flutter_boilerplate/models/weather_one_day.dart';
import 'package:geolocator/geolocator.dart';

const BASE_URL = 'https://devapi.qweather.com/v7/weather';
const API_KEY = 'c5e1c492a3b04957aa6774fc9f6bcdde';
const STATUS_OK = '200';

class CacheFirstFetch {
  Map<String, List<dynamic>> _store = Map();
  Future<T?> fetch<T>(
      String key,
      Future<T?> Function() futureFactory,
      bool Function(List<dynamic>, List<dynamic>) shouldInvalidate,
      List<dynamic> deps) async {
    var oldData = _store[key];
    int v = (oldData == null ? -1 : oldData[2]) + 1;
    final onComplete = (T? data) {
      if (data == null) return null;
      oldData = _store[key];
      if (oldData == null) {
        _store[key] = [data, deps, v];
      } else if (oldData![2] < v) {
        oldData![2] = v;
      } else {
        data = oldData![0];
      }
      return data;
    };
    if (oldData == null || shouldInvalidate(oldData![1], deps)) {
      return onComplete(await futureFactory());
    } else {
      futureFactory().then(onComplete);
      return oldData![0];
    }
  }
}

final cacheFirstFetch = CacheFirstFetch();

bool shouldInvalidate(List<dynamic> oldDeps, List<dynamic> newDeps) {
  Position oldPos = oldDeps[0];
  Position newPos = newDeps[0];
  DateTime oldTime = oldDeps[1];
  DateTime newTime = newDeps[1];
  return ((oldPos.latitude - newPos.latitude).abs() +
              (oldPos.longitude - newPos.longitude).abs() >
          0.5) ||
      newTime.difference(oldTime).inMinutes > 30;
}

class WeatherService {
  static Future<Weather?> now(Position pos) async {
    final url = Uri.parse(
        '$BASE_URL/now?key=$API_KEY&location=${pos.longitude},${pos.latitude}');
    final response = await get(url);
    final rawData = jsonDecode(response.body);
    if (rawData['code'] == STATUS_OK) {
      return Weather.fromJson(rawData['now']);
    }
    return null;
  }

  static Future<List<WeatherOneDay>?> _forecast(Position pos) async {
    final url = Uri.parse(
        '$BASE_URL/7d?key=$API_KEY&location=${pos.longitude},${pos.latitude}');
    final response = await get(url);
    final rawData = jsonDecode(response.body);
    if (rawData['code'] == STATUS_OK) {
      return (rawData['daily'] as List<dynamic>)
          .map((e) => WeatherOneDay.fromJson(e))
          .toList();
    }
    return null;
  }

  static Future<List<WeatherOneDay>?> forecast(Position pos) async {
    return cacheFirstFetch.fetch(
        'forecast',
        () => WeatherService._forecast(pos),
        shouldInvalidate,
        [pos, DateTime.now()]);
  }

  static Future<List<Weather>?> _forecastHourly(Position pos) async {
    final url = Uri.parse(
        '$BASE_URL/24h?key=$API_KEY&location=${pos.longitude},${pos.latitude}');
    final response = await get(url);
    final rawData = jsonDecode(response.body);
    if (rawData['code'] == STATUS_OK) {
      return (rawData['hourly'] as List<dynamic>)
          .map((e) => Weather.fromJson(e))
          .toList();
    }
    return null;
  }

  static Future<List<Weather>?> forecastHourly(Position pos) async {
    return cacheFirstFetch.fetch(
        'forecastHourly',
        () => WeatherService._forecastHourly(pos),
        shouldInvalidate,
        [pos, DateTime.now()]);
  }
}
