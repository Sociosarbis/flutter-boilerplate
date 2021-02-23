// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:flutter_boilerplate/graphql/github/github.ast.gql.dart' as _i5;
import 'package:flutter_boilerplate/graphql/github/github.data.gql.dart' as _i2;
import 'package:flutter_boilerplate/graphql/github/github.var.gql.dart' as _i3;
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i6;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'github.req.gql.g.dart';

abstract class GFollowersReq
    implements
        Built<GFollowersReq, GFollowersReqBuilder>,
        _i1.OperationRequest<_i2.GFollowersData, _i3.GFollowersVars> {
  GFollowersReq._();

  factory GFollowersReq([Function(GFollowersReqBuilder b) updates]) =
      _$GFollowersReq;

  static void _initializeBuilder(GFollowersReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Followers')
    ..executeOnListen = true;
  _i3.GFollowersVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GFollowersData Function(_i2.GFollowersData, _i2.GFollowersData)
      get updateResult;
  @nullable
  _i2.GFollowersData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GFollowersData parseData(Map<String, dynamic> json) =>
      _i2.GFollowersData.fromJson(json);
  static Serializer<GFollowersReq> get serializer => _$gFollowersReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GFollowersReq.serializer, this);
  static GFollowersReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GFollowersReq.serializer, json);
}

abstract class GFollowingReq
    implements
        Built<GFollowingReq, GFollowingReqBuilder>,
        _i1.OperationRequest<_i2.GFollowingData, _i3.GFollowingVars> {
  GFollowingReq._();

  factory GFollowingReq([Function(GFollowingReqBuilder b) updates]) =
      _$GFollowingReq;

  static void _initializeBuilder(GFollowingReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'Following')
    ..executeOnListen = true;
  _i3.GFollowingVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GFollowingData Function(_i2.GFollowingData, _i2.GFollowingData)
      get updateResult;
  @nullable
  _i2.GFollowingData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GFollowingData parseData(Map<String, dynamic> json) =>
      _i2.GFollowingData.fromJson(json);
  static Serializer<GFollowingReq> get serializer => _$gFollowingReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GFollowingReq.serializer, this);
  static GFollowingReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GFollowingReq.serializer, json);
}

abstract class GPageInfoPartsReq
    implements
        Built<GPageInfoPartsReq, GPageInfoPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPageInfoPartsData, _i3.GPageInfoPartsVars> {
  GPageInfoPartsReq._();

  factory GPageInfoPartsReq([Function(GPageInfoPartsReqBuilder b) updates]) =
      _$GPageInfoPartsReq;

  static void _initializeBuilder(GPageInfoPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PageInfoParts';
  _i3.GPageInfoPartsVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GPageInfoPartsData parseData(Map<String, dynamic> json) =>
      _i2.GPageInfoPartsData.fromJson(json);
  static Serializer<GPageInfoPartsReq> get serializer =>
      _$gPageInfoPartsReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GPageInfoPartsReq.serializer, this);
  static GPageInfoPartsReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GPageInfoPartsReq.serializer, json);
}

abstract class GUserItemReq
    implements
        Built<GUserItemReq, GUserItemReqBuilder>,
        _i1.FragmentRequest<_i2.GUserItemData, _i3.GUserItemVars> {
  GUserItemReq._();

  factory GUserItemReq([Function(GUserItemReqBuilder b) updates]) =
      _$GUserItemReq;

  static void _initializeBuilder(GUserItemReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UserItem';
  _i3.GUserItemVars get vars;
  _i7.DocumentNode get document;
  String get fragmentName;
  Map<String, dynamic> get idFields;
  @override
  _i2.GUserItemData parseData(Map<String, dynamic> json) =>
      _i2.GUserItemData.fromJson(json);
  static Serializer<GUserItemReq> get serializer => _$gUserItemReqSerializer;
  Map<String, dynamic> toJson() =>
      _i6.serializers.serializeWith(GUserItemReq.serializer, this);
  static GUserItemReq fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GUserItemReq.serializer, json);
}
