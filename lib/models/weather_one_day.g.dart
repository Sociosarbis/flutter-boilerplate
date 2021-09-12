// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_one_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherOneDay _$WeatherOneDayFromJson(Map<String, dynamic> json) {
  return WeatherOneDay(
    date: strToDateTime(json['fxDate'] as String),
    tempMin: strToInt(json['tempMin'] as String),
    tempMax: strToInt(json['tempMax'] as String),
    textDay: json['textDay'] as String,
    textNight: json['textNight'] as String,
    humidity: strToInt(json['humidity'] as String),
    windScaleDay: json['windScaleDay'] as String,
    windScaleNight: json['windScaleNight'] as String,
    windDirDay: json['windDirDay'] as String,
    windDirNight: json['windDirNight'] as String,
    cloud: strToInt(json['cloud'] as String),
  );
}

Map<String, dynamic> _$WeatherOneDayToJson(WeatherOneDay instance) =>
    <String, dynamic>{
      'fxDate': instance.date.toIso8601String(),
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'textDay': instance.textDay,
      'textNight': instance.textNight,
      'windScaleDay': instance.windScaleDay,
      'windScaleNight': instance.windScaleNight,
      'windDirDay': instance.windDirDay,
      'windDirNight': instance.windDirNight,
      'cloud': instance.cloud,
      'humidity': instance.humidity,
    };
