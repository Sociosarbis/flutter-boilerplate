import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_boilerplate/utils/convert.dart';

part 'weather.g.dart';

class Range {
  final int min;
  final int max;
  const Range({
    this.min = -1,
    this.max = -1
  });
}

// 实时天气
@JsonSerializable()
class Weather {
  @JsonKey(name: 'fxTime', fromJson: strToDateTime)
  DateTime time;
  @JsonKey(name: 'humidity', fromJson: strToInt)
  int relativeHumidity;
  @JsonKey(name: 'text')
  String phenomenon;
  @JsonKey(name: 'cloud', fromJson: strToInt)
  int clouds;
  @JsonKey(name: 'windScale')
  String windPower;
  @JsonKey(name: 'temp', fromJson: strToInt)
  int? temperature;
  @JsonKey(ignore: true)
  Range tempRange;
  @JsonKey(name: 'windDir')
  String windDirection;
  Weather(
      {required this.time,
      required this.relativeHumidity,
      required this.phenomenon,
      required this.clouds,
      required this.windPower,
      this.temperature,
      required this.windDirection,
      this.tempRange = const Range()
      });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
