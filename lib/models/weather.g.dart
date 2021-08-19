// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    relativeHumidity: json['relativeHumidity'] as int,
    phenomenon: json['phenomenon'] as String,
    clouds: json['clouds'] as int,
    windPower: json['windPower'] as String,
    temperature: json['temperature'] as int,
    windDirection: json['windDirection'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'relativeHumidity': instance.relativeHumidity,
      'phenomenon': instance.phenomenon,
      'clouds': instance.clouds,
      'windPower': instance.windPower,
      'temperature': instance.temperature,
      'windDirection': instance.windDirection,
    };
