import 'package:flutter_boilerplate/models/bgm/subject.dart';
import 'package:json_annotation/json_annotation.dart';

part "res.g.dart";

@JsonSerializable(includeIfNull: false)
class Weekday {
  final String en;

  const Weekday({required this.en});

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);
}

@JsonSerializable(includeIfNull: false)
class GetCalendarItem {
  final Weekday weekday;
  final List<LegacySubjectSmall> items;
  const GetCalendarItem({required this.weekday, required this.items});

  factory GetCalendarItem.fromJson(Map<String, dynamic> json) =>
      _$GetCalendarItemFromJson(json);

  Map<String, dynamic> toJson() => _$GetCalendarItemToJson(this);
}
