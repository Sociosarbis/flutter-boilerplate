// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    from: json['from'] as String?,
    text: json['text'] as String?,
    typename: json['__typename'] as String?,
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  writeNotNull('text', instance.text);
  writeNotNull('__typename', instance.typename);
  return val;
}
