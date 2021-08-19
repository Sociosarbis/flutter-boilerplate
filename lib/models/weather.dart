import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  int relativeHumidity;
  String phenomenon;
  int clouds;
  String windPower;
  int temperature;
  String windDirection;
  Weather(
      {required this.relativeHumidity,
      required this.phenomenon,
      required this.clouds,
      required this.windPower,
      required this.temperature,
      required this.windDirection});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
