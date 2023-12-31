// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      common: json['common'] as String?,
      small: json['small'] as String?,
      grid: json['grid'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('large', instance.large);
  writeNotNull('medium', instance.medium);
  writeNotNull('common', instance.common);
  writeNotNull('small', instance.small);
  writeNotNull('grid', instance.grid);
  return val;
}

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      wish: json['wish'] as int?,
      collect: json['collect'] as int?,
      doing: json['doing'] as int?,
      onHold: json['on_hold'] as int?,
      dropped: json['dropped'] as int?,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('wish', instance.wish);
  writeNotNull('collect', instance.collect);
  writeNotNull('doing', instance.doing);
  writeNotNull('on_hold', instance.onHold);
  writeNotNull('dropped', instance.dropped);
  return val;
}

LegacySubjectSmall _$LegacySubjectSmallFromJson(Map<String, dynamic> json) =>
    LegacySubjectSmall(
      id: json['id'] as int,
      type: json['type'] as int,
      name: json['name'] as String,
      nameCN: json['name_cn'] as String?,
      collection: json['collection'] == null
          ? null
          : Collection.fromJson(json['collection'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LegacySubjectSmallToJson(LegacySubjectSmall instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name_cn', instance.nameCN);
  writeNotNull('images', instance.images);
  writeNotNull('collection', instance.collection);
  return val;
}
