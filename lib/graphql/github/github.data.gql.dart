// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_boilerplate/graphql/schema.schema.gql.dart' as _i2;
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i1;

part 'github.data.gql.g.dart';

abstract class GFollowersData
    implements Built<GFollowersData, GFollowersDataBuilder> {
  GFollowersData._();

  factory GFollowersData([Function(GFollowersDataBuilder b) updates]) =
      _$GFollowersData;

  static void _initializeBuilder(GFollowersDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GFollowersData_user get user;
  static Serializer<GFollowersData> get serializer =>
      _$gFollowersDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowersData.serializer, this);
  static GFollowersData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowersData.serializer, json);
}

abstract class GFollowersData_user
    implements Built<GFollowersData_user, GFollowersData_userBuilder> {
  GFollowersData_user._();

  factory GFollowersData_user(
      [Function(GFollowersData_userBuilder b) updates]) = _$GFollowersData_user;

  static void _initializeBuilder(GFollowersData_userBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFollowersData_user_followers get followers;
  static Serializer<GFollowersData_user> get serializer =>
      _$gFollowersDataUserSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowersData_user.serializer, this);
  static GFollowersData_user fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowersData_user.serializer, json);
}

abstract class GFollowersData_user_followers
    implements
        Built<GFollowersData_user_followers,
            GFollowersData_user_followersBuilder> {
  GFollowersData_user_followers._();

  factory GFollowersData_user_followers(
          [Function(GFollowersData_user_followersBuilder b) updates]) =
      _$GFollowersData_user_followers;

  static void _initializeBuilder(GFollowersData_user_followersBuilder b) =>
      b..G__typename = 'FollowerConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFollowersData_user_followers_pageInfo get pageInfo;
  @nullable
  BuiltList<GFollowersData_user_followers_nodes> get nodes;
  static Serializer<GFollowersData_user_followers> get serializer =>
      _$gFollowersDataUserFollowersSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowersData_user_followers.serializer, this);
  static GFollowersData_user_followers fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GFollowersData_user_followers.serializer, json);
}

abstract class GFollowersData_user_followers_pageInfo
    implements
        Built<GFollowersData_user_followers_pageInfo,
            GFollowersData_user_followers_pageInfoBuilder>,
        GPageInfoParts {
  GFollowersData_user_followers_pageInfo._();

  factory GFollowersData_user_followers_pageInfo(
          [Function(GFollowersData_user_followers_pageInfoBuilder b) updates]) =
      _$GFollowersData_user_followers_pageInfo;

  static void _initializeBuilder(
          GFollowersData_user_followers_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasNextPage;
  @nullable
  String get endCursor;
  static Serializer<GFollowersData_user_followers_pageInfo> get serializer =>
      _$gFollowersDataUserFollowersPageInfoSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowersData_user_followers_pageInfo.serializer, this);
  static GFollowersData_user_followers_pageInfo fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GFollowersData_user_followers_pageInfo.serializer, json);
}

abstract class GFollowersData_user_followers_nodes
    implements
        Built<GFollowersData_user_followers_nodes,
            GFollowersData_user_followers_nodesBuilder>,
        GUserItem {
  GFollowersData_user_followers_nodes._();

  factory GFollowersData_user_followers_nodes(
          [Function(GFollowersData_user_followers_nodesBuilder b) updates]) =
      _$GFollowersData_user_followers_nodes;

  static void _initializeBuilder(
          GFollowersData_user_followers_nodesBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  @nullable
  String get name;
  _i2.GURI get avatarUrl;
  @nullable
  String get company;
  @nullable
  String get location;
  _i2.GDateTime get createdAt;
  static Serializer<GFollowersData_user_followers_nodes> get serializer =>
      _$gFollowersDataUserFollowersNodesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowersData_user_followers_nodes.serializer, this);
  static GFollowersData_user_followers_nodes fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GFollowersData_user_followers_nodes.serializer, json);
}

abstract class GFollowingData
    implements Built<GFollowingData, GFollowingDataBuilder> {
  GFollowingData._();

  factory GFollowingData([Function(GFollowingDataBuilder b) updates]) =
      _$GFollowingData;

  static void _initializeBuilder(GFollowingDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GFollowingData_user get user;
  static Serializer<GFollowingData> get serializer =>
      _$gFollowingDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowingData.serializer, this);
  static GFollowingData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowingData.serializer, json);
}

abstract class GFollowingData_user
    implements Built<GFollowingData_user, GFollowingData_userBuilder> {
  GFollowingData_user._();

  factory GFollowingData_user(
      [Function(GFollowingData_userBuilder b) updates]) = _$GFollowingData_user;

  static void _initializeBuilder(GFollowingData_userBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFollowingData_user_following get following;
  static Serializer<GFollowingData_user> get serializer =>
      _$gFollowingDataUserSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GFollowingData_user.serializer, this);
  static GFollowingData_user fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowingData_user.serializer, json);
}

abstract class GFollowingData_user_following
    implements
        Built<GFollowingData_user_following,
            GFollowingData_user_followingBuilder> {
  GFollowingData_user_following._();

  factory GFollowingData_user_following(
          [Function(GFollowingData_user_followingBuilder b) updates]) =
      _$GFollowingData_user_following;

  static void _initializeBuilder(GFollowingData_user_followingBuilder b) =>
      b..G__typename = 'FollowingConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GFollowingData_user_following_pageInfo get pageInfo;
  @nullable
  BuiltList<GFollowingData_user_following_nodes> get nodes;
  static Serializer<GFollowingData_user_following> get serializer =>
      _$gFollowingDataUserFollowingSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowingData_user_following.serializer, this);
  static GFollowingData_user_following fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GFollowingData_user_following.serializer, json);
}

abstract class GFollowingData_user_following_pageInfo
    implements
        Built<GFollowingData_user_following_pageInfo,
            GFollowingData_user_following_pageInfoBuilder>,
        GPageInfoParts {
  GFollowingData_user_following_pageInfo._();

  factory GFollowingData_user_following_pageInfo(
          [Function(GFollowingData_user_following_pageInfoBuilder b) updates]) =
      _$GFollowingData_user_following_pageInfo;

  static void _initializeBuilder(
          GFollowingData_user_following_pageInfoBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasNextPage;
  @nullable
  String get endCursor;
  static Serializer<GFollowingData_user_following_pageInfo> get serializer =>
      _$gFollowingDataUserFollowingPageInfoSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowingData_user_following_pageInfo.serializer, this);
  static GFollowingData_user_following_pageInfo fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GFollowingData_user_following_pageInfo.serializer, json);
}

abstract class GFollowingData_user_following_nodes
    implements
        Built<GFollowingData_user_following_nodes,
            GFollowingData_user_following_nodesBuilder>,
        GUserItem {
  GFollowingData_user_following_nodes._();

  factory GFollowingData_user_following_nodes(
          [Function(GFollowingData_user_following_nodesBuilder b) updates]) =
      _$GFollowingData_user_following_nodes;

  static void _initializeBuilder(
          GFollowingData_user_following_nodesBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  @nullable
  String get name;
  _i2.GURI get avatarUrl;
  @nullable
  String get company;
  @nullable
  String get location;
  _i2.GDateTime get createdAt;
  static Serializer<GFollowingData_user_following_nodes> get serializer =>
      _$gFollowingDataUserFollowingNodesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GFollowingData_user_following_nodes.serializer, this);
  static GFollowingData_user_following_nodes fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GFollowingData_user_following_nodes.serializer, json);
}

abstract class GPageInfoParts {
  String get G__typename;
  bool get hasNextPage;
  String get endCursor;
  Map<String, dynamic> toJson();
}

abstract class GPageInfoPartsData
    implements
        Built<GPageInfoPartsData, GPageInfoPartsDataBuilder>,
        GPageInfoParts {
  GPageInfoPartsData._();

  factory GPageInfoPartsData([Function(GPageInfoPartsDataBuilder b) updates]) =
      _$GPageInfoPartsData;

  static void _initializeBuilder(GPageInfoPartsDataBuilder b) =>
      b..G__typename = 'PageInfo';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  bool get hasNextPage;
  @nullable
  String get endCursor;
  static Serializer<GPageInfoPartsData> get serializer =>
      _$gPageInfoPartsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GPageInfoPartsData.serializer, this);
  static GPageInfoPartsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPageInfoPartsData.serializer, json);
}

abstract class GUserItem {
  String get G__typename;
  String get login;
  String get name;
  _i2.GURI get avatarUrl;
  String get company;
  String get location;
  _i2.GDateTime get createdAt;
  Map<String, dynamic> toJson();
}

abstract class GUserItemData
    implements Built<GUserItemData, GUserItemDataBuilder>, GUserItem {
  GUserItemData._();

  factory GUserItemData([Function(GUserItemDataBuilder b) updates]) =
      _$GUserItemData;

  static void _initializeBuilder(GUserItemDataBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  @nullable
  String get name;
  _i2.GURI get avatarUrl;
  @nullable
  String get company;
  @nullable
  String get location;
  _i2.GDateTime get createdAt;
  static Serializer<GUserItemData> get serializer => _$gUserItemDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GUserItemData.serializer, this);
  static GUserItemData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserItemData.serializer, json);
}
