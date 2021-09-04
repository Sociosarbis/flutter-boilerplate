import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_boilerplate/models/weather.dart';
import 'package:flutter_boilerplate/models/weather_one_day.dart';
import 'package:geolocator/geolocator.dart';

const BASE_URL = 'https://devapi.qweather.com/v7/weather';
const API_KEY = 'c5e1c492a3b04957aa6774fc9f6bcdde';
const STATUS_OK = '200';


class WeatherService {
  static Future<Weather?> now(Position pos) async {
    final url = Uri.parse('$BASE_URL/now?key=$API_KEY&location=${pos.longitude},${pos.latitude}');
    final response = await get(url);
    final rawData = jsonDecode(response.body);
    if (rawData['code'] == STATUS_OK) {
      return Weather.fromJson(rawData['now']);
    }
    return null;
  }

  static Future<List<WeatherOneDay>?> forecast(Position pos) async {
    final url = Uri.parse('$BASE_URL/3d?key=$API_KEY&location=${pos.longitude},${pos.latitude}');
    final response = await get(url);
    final rawData = jsonDecode(response.body);
    if (rawData['code'] == STATUS_OK) {
      return (rawData['daily'] as List<dynamic>).map((e) => WeatherOneDay.fromJson(e)).toList();
    }
    return null;
  }
}
