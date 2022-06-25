// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      name: json['name'] as String?,
      id: json['id'] as int?,
      msg: json['msg'] as String?,
      avatar: json['avatar'] as String?,
      typename: json['__typename'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  writeNotNull('msg', instance.msg);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('__typename', instance.typename);
  return val;
}
