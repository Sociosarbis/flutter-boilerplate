// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weekday _$WeekdayFromJson(Map<String, dynamic> json) => Weekday(
      en: json['en'] as String,
    );

Map<String, dynamic> _$WeekdayToJson(Weekday instance) => <String, dynamic>{
      'en': instance.en,
    };

GetCalendarItem _$GetCalendarItemFromJson(Map<String, dynamic> json) =>
    GetCalendarItem(
      weekday: Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => LegacySubjectSmall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCalendarItemToJson(GetCalendarItem instance) =>
    <String, dynamic>{
      'weekday': instance.weekday,
      'items': instance.items,
    };
