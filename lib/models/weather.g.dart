// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    time: strToDateTime(json['fxTime'] as String),
    relativeHumidity: strToInt(json['humidity'] as String),
    phenomenon: json['text'] as String,
    clouds: strToInt(json['cloud'] as String),
    windPower: json['windScale'] as String,
    temperature: strToInt(json['temp'] as String),
    windDirection: json['windDir'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'fxTime': instance.time.toIso8601String(),
      'humidity': instance.relativeHumidity,
      'text': instance.phenomenon,
      'cloud': instance.clouds,
      'windScale': instance.windPower,
      'temp': instance.temperature,
      'windDir': instance.windDirection,
    };
