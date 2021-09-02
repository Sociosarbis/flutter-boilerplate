import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

int strToInt(String str) {
  return int.parse(str);
} 

@JsonSerializable()
class Weather {
  @JsonKey(name: 'humidity', fromJson: strToInt)
  int relativeHumidity;
  @JsonKey(name: 'text')
  String phenomenon;
  @JsonKey(name: 'cloud', fromJson: strToInt)
  int clouds;
  @JsonKey(name: 'windScale')
  String windPower;
  @JsonKey(name: 'temp', fromJson: strToInt)
  int temperature;
  @JsonKey(name: 'windDir')
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
