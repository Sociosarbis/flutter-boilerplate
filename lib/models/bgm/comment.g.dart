// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'] as int,
    floor: json['floor'] as String,
    time: json['time'] as String,
    text: json['text'] as String,
    author: json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>),
    quote: json['quote'] == null
        ? null
        : Quote.fromJson(json['quote'] as Map<String, dynamic>),
    replies: (json['replies'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    typename: json['__typename'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('floor', instance.floor);
  writeNotNull('time', instance.time);
  writeNotNull('text', instance.text);
  writeNotNull('author', instance.author?.toJson());
  writeNotNull('quote', instance.quote?.toJson());
  writeNotNull('replies', instance.replies?.map((e) => e?.toJson())?.toList());
  writeNotNull('__typename', instance.typename);
  return val;
}
