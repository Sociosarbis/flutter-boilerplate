// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_boilerplate/graphql/bgm/bgm.ast.gql.dart' as _i5;
import 'package:flutter_boilerplate/graphql/bgm/bgm.data.gql.dart' as _i2;
import 'package:flutter_boilerplate/graphql/bgm/bgm.var.gql.dart' as _i3;
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i6;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'bgm.req.gql.g.dart';

abstract class GGetEpisodeTopicReq
    implements
        Built<GGetEpisodeTopicReq, GGetEpisodeTopicReqBuilder>,
        _i1.OperationRequest<_i2.GGetEpisodeTopicData,
            _i3.GGetEpisodeTopicVars> {
  GGetEpisodeTopicReq._();

  factory GGetEpisodeTopicReq(
      [Function(GGetEpisodeTopicReqBuilder b) updates]) = _$GGetEpisodeTopicReq;

  static void _initializeBuilder(GGetEpisodeTopicReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'GetEpisodeTopic')
    ..executeOnListen = true;
  _i3.GGetEpisodeTopicVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GGetEpisodeTopicData Function(
      _i2.GGetEpisodeTopicData, _i2.GGetEpisodeTopicData) get updateResult;
  @nullable
  _i2.GGetEpisodeTopicData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GGetEpisodeTopicData parseData(Map<String, dynamic> json) =>
      _i2.GGetEpisodeTopicData.fromJson(json);
  static Serializer<GGetEpisodeTopicReq> get serializer =>
      _$gGetEpisodeTopicReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GGetEpisodeTopicReq.serializer, this);
  static GGetEpisodeTopicReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GGetEpisodeTopicReq.serializer, json);
}
