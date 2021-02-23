// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i1;

part 'bgm.var.gql.g.dart';

abstract class GGetEpisodeTopicVars
    implements Built<GGetEpisodeTopicVars, GGetEpisodeTopicVarsBuilder> {
  GGetEpisodeTopicVars._();

  factory GGetEpisodeTopicVars(
          [Function(GGetEpisodeTopicVarsBuilder b) updates]) =
      _$GGetEpisodeTopicVars;

  int get id;
  static Serializer<GGetEpisodeTopicVars> get serializer =>
      _$gGetEpisodeTopicVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GGetEpisodeTopicVars.serializer, this);
  static GGetEpisodeTopicVars fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetEpisodeTopicVars.serializer, json);
}
