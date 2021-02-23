// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_boilerplate/graphql/serializers.gql.dart' as _i1;

part 'bgm.data.gql.g.dart';

abstract class GGetEpisodeTopicData
    implements Built<GGetEpisodeTopicData, GGetEpisodeTopicDataBuilder> {
  GGetEpisodeTopicData._();

  factory GGetEpisodeTopicData(
          [Function(GGetEpisodeTopicDataBuilder b) updates]) =
      _$GGetEpisodeTopicData;

  static void _initializeBuilder(GGetEpisodeTopicDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GGetEpisodeTopicData_bgmEpisodeTopic get bgmEpisodeTopic;
  static Serializer<GGetEpisodeTopicData> get serializer =>
      _$gGetEpisodeTopicDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GGetEpisodeTopicData.serializer, this);
  static GGetEpisodeTopicData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGetEpisodeTopicData.serializer, json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic,
            GGetEpisodeTopicData_bgmEpisodeTopicBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic(
          [Function(GGetEpisodeTopicData_bgmEpisodeTopicBuilder b) updates]) =
      _$GGetEpisodeTopicData_bgmEpisodeTopic;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopicBuilder b) =>
      b..G__typename = 'BgmEpisodeTopic';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetEpisodeTopicData_bgmEpisodeTopic_comments> get comments;
  static Serializer<GGetEpisodeTopicData_bgmEpisodeTopic> get serializer =>
      _$gGetEpisodeTopicDataBgmEpisodeTopicSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GGetEpisodeTopicData_bgmEpisodeTopic.serializer, this);
  static GGetEpisodeTopicData_bgmEpisodeTopic fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic.serializer, json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic_comments
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic_comments,
            GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic_comments._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic_comments(
      [Function(GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder b)
          updates]) = _$GGetEpisodeTopicData_bgmEpisodeTopic_comments;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder b) =>
      b..G__typename = 'BgmComment';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get id;
  @nullable
  String get floor;
  @nullable
  String get time;
  @nullable
  String get text;
  @nullable
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_author get author;
  BuiltList<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies> get replies;
  static Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments>
      get serializer => _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments.serializer, this);
  static GGetEpisodeTopicData_bgmEpisodeTopic_comments fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments.serializer, json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic_comments_author
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic_comments_author,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_author._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic_comments_author(
      [Function(GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder b)
          updates]) = _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder b) =>
      b..G__typename = 'BgmAuthor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get id;
  @nullable
  String get msg;
  @nullable
  String get avatar;
  static Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_author>
      get serializer =>
          _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsAuthorSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_author.serializer, this);
  static GGetEpisodeTopicData_bgmEpisodeTopic_comments_author fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_author.serializer,
          json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies(
      [Function(GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder b)
          updates]) = _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder b) =>
      b..G__typename = 'BgmComment';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get id;
  @nullable
  String get floor;
  @nullable
  String get time;
  @nullable
  String get text;
  @nullable
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote get quote;
  @nullable
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author get author;
  static Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>
      get serializer =>
          _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies.serializer, this);
  static GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies.serializer,
          json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote(
      [Function(
              GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
                  b)
          updates]) = _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
              b) =>
      b..G__typename = 'BgmQuote';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  String get from;
  @nullable
  String get text;
  static Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote>
      get serializer =>
          _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesQuoteSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote.serializer,
      this);
  static GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote
              .serializer,
          json);
}

abstract class GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author
    implements
        Built<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder> {
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author._();

  factory GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author(
          [Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
                      b)
              updates]) =
      _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author;

  static void _initializeBuilder(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
              b) =>
      b..G__typename = 'BgmAuthor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get id;
  @nullable
  String get msg;
  @nullable
  String get avatar;
  static Serializer<
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author>
      get serializer =>
          _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesAuthorSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author.serializer,
      this);
  static GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author
              .serializer,
          json);
}
