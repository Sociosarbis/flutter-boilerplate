import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_boilerplate/utils/convert.dart';

part 'weather_one_day.g.dart';

@JsonSerializable()
class WeatherOneDay {
  @JsonKey(fromJson: strToInt)
  int tempMin;
  @JsonKey(fromJson: strToInt)
  int tempMax;
  String textDay;
  String textNight;
  String windScaleDay;
  String windScaleNight;
  String windDirDay;
  String windDirNight;
  @JsonKey(fromJson: strToInt)
  int cloud;
  @JsonKey(fromJson: strToInt)
  int humidity;
  WeatherOneDay({
    required this.tempMin,
    required this.tempMax,
    required this.textDay,
    required this.textNight,
    required this.humidity,
    required this.windScaleDay,
    required this.windScaleNight,
    required this.windDirDay,
    required this.windDirNight,
    required this.cloud
  });

  factory WeatherOneDay.fromJson(Map<String, dynamic> json) => _$WeatherOneDayFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherOneDayToJson(this);
}