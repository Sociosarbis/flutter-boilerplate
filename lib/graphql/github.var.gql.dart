// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i1;

part 'github.var.gql.g.dart';

abstract class GFollowersVars
    implements Built<GFollowersVars, GFollowersVarsBuilder> {
  GFollowersVars._();

  factory GFollowersVars([Function(GFollowersVarsBuilder b) updates]) =
      _$GFollowersVars;

  String get login;
  @nullable
  String get after;
  static Serializer<GFollowersVars> get serializer =>
      _$gFollowersVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowersVars.serializer, this);
  static GFollowersVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowersVars.serializer, json);
}

abstract class GFollowingVars
    implements Built<GFollowingVars, GFollowingVarsBuilder> {
  GFollowingVars._();

  factory GFollowingVars([Function(GFollowingVarsBuilder b) updates]) =
      _$GFollowingVars;

  String get login;
  @nullable
  String get after;
  static Serializer<GFollowingVars> get serializer =>
      _$gFollowingVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowingVars.serializer, this);
  static GFollowingVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowingVars.serializer, json);
}

abstract class GPageInfoPartsVars
    implements Built<GPageInfoPartsVars, GPageInfoPartsVarsBuilder> {
  GPageInfoPartsVars._();

  factory GPageInfoPartsVars([Function(GPageInfoPartsVarsBuilder b) updates]) =
      _$GPageInfoPartsVars;

  static Serializer<GPageInfoPartsVars> get serializer =>
      _$gPageInfoPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPageInfoPartsVars.serializer, this);
  static GPageInfoPartsVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPageInfoPartsVars.serializer, json);
}

abstract class GUserItemVars
    implements Built<GUserItemVars, GUserItemVarsBuilder> {
  GUserItemVars._();

  factory GUserItemVars([Function(GUserItemVarsBuilder b) updates]) =
      _$GUserItemVars;

  static Serializer<GUserItemVars> get serializer => _$gUserItemVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUserItemVars.serializer, this);
  static GUserItemVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserItemVars.serializer, json);
}
