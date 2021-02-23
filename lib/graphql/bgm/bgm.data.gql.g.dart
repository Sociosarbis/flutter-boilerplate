// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bgm.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetEpisodeTopicData> _$gGetEpisodeTopicDataSerializer =
    new _$GGetEpisodeTopicDataSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic>
    _$gGetEpisodeTopicDataBgmEpisodeTopicSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopicSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments>
    _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopic_commentsSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_author>
    _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsAuthorSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>
    _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote>
    _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesQuoteSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteSerializer();
Serializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author>
    _$gGetEpisodeTopicDataBgmEpisodeTopicCommentsRepliesAuthorSerializer =
    new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorSerializer();

class _$GGetEpisodeTopicDataSerializer
    implements StructuredSerializer<GGetEpisodeTopicData> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData,
    _$GGetEpisodeTopicData
  ];
  @override
  final String wireName = 'GGetEpisodeTopicData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GGetEpisodeTopicData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.bgmEpisodeTopic != null) {
      result
        ..add('bgmEpisodeTopic')
        ..add(serializers.serialize(object.bgmEpisodeTopic,
            specifiedType:
                const FullType(GGetEpisodeTopicData_bgmEpisodeTopic)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEpisodeTopicDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bgmEpisodeTopic':
          result.bgmEpisodeTopic.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GGetEpisodeTopicData_bgmEpisodeTopic))
              as GGetEpisodeTopicData_bgmEpisodeTopic);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopicSerializer
    implements StructuredSerializer<GGetEpisodeTopicData_bgmEpisodeTopic> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic,
    _$GGetEpisodeTopicData_bgmEpisodeTopic
  ];
  @override
  final String wireName = 'GGetEpisodeTopicData_bgmEpisodeTopic';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GGetEpisodeTopicData_bgmEpisodeTopic object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GGetEpisodeTopicData_bgmEpisodeTopic_comments)
          ])),
    ];

    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEpisodeTopicData_bgmEpisodeTopicBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GGetEpisodeTopicData_bgmEpisodeTopic_comments)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_commentsSerializer
    implements
        StructuredSerializer<GGetEpisodeTopicData_bgmEpisodeTopic_comments> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic_comments,
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments
  ];
  @override
  final String wireName = 'GGetEpisodeTopicData_bgmEpisodeTopic_comments';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GGetEpisodeTopicData_bgmEpisodeTopic_comments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'replies',
      serializers.serialize(object.replies,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies)
          ])),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.floor != null) {
      result
        ..add('floor')
        ..add(serializers.serialize(object.floor,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(
                GGetEpisodeTopicData_bgmEpisodeTopic_comments_author)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'floor':
          result.floor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetEpisodeTopicData_bgmEpisodeTopic_comments_author))
              as GGetEpisodeTopicData_bgmEpisodeTopic_comments_author);
          break;
        case 'replies':
          result.replies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorSerializer
    implements
        StructuredSerializer<
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_author> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_author,
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author
  ];
  @override
  final String wireName =
      'GGetEpisodeTopicData_bgmEpisodeTopic_comments_author';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_author object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.msg != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(object.msg,
            specifiedType: const FullType(String)));
    }
    if (object.avatar != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(object.avatar,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_author deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesSerializer
    implements
        StructuredSerializer<
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies,
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies
  ];
  @override
  final String wireName =
      'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.floor != null) {
      result
        ..add('floor')
        ..add(serializers.serialize(object.floor,
            specifiedType: const FullType(String)));
    }
    if (object.time != null) {
      result
        ..add('time')
        ..add(serializers.serialize(object.time,
            specifiedType: const FullType(String)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.quote != null) {
      result
        ..add('quote')
        ..add(serializers.serialize(object.quote,
            specifiedType: const FullType(
                GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote)));
    }
    if (object.author != null) {
      result
        ..add('author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(
                GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'floor':
          result.floor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quote':
          result.quote.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote))
              as GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote);
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author))
              as GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author);
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteSerializer
    implements
        StructuredSerializer<
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote,
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote
  ];
  @override
  final String wireName =
      'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.from != null) {
      result
        ..add('from')
        ..add(serializers.serialize(object.from,
            specifiedType: const FullType(String)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorSerializer
    implements
        StructuredSerializer<
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author,
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author
  ];
  @override
  final String wireName =
      'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.msg != null) {
      result
        ..add('msg')
        ..add(serializers.serialize(object.msg,
            specifiedType: const FullType(String)));
    }
    if (object.avatar != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(object.avatar,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicData extends GGetEpisodeTopicData {
  @override
  final String G__typename;
  @override
  final GGetEpisodeTopicData_bgmEpisodeTopic bgmEpisodeTopic;

  factory _$GGetEpisodeTopicData(
          [void Function(GGetEpisodeTopicDataBuilder) updates]) =>
      (new GGetEpisodeTopicDataBuilder()..update(updates)).build();

  _$GGetEpisodeTopicData._({this.G__typename, this.bgmEpisodeTopic})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError('GGetEpisodeTopicData', 'G__typename');
    }
  }

  @override
  GGetEpisodeTopicData rebuild(
          void Function(GGetEpisodeTopicDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicDataBuilder toBuilder() =>
      new GGetEpisodeTopicDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicData &&
        G__typename == other.G__typename &&
        bgmEpisodeTopic == other.bgmEpisodeTopic;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), bgmEpisodeTopic.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetEpisodeTopicData')
          ..add('G__typename', G__typename)
          ..add('bgmEpisodeTopic', bgmEpisodeTopic))
        .toString();
  }
}

class GGetEpisodeTopicDataBuilder
    implements Builder<GGetEpisodeTopicData, GGetEpisodeTopicDataBuilder> {
  _$GGetEpisodeTopicData _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GGetEpisodeTopicData_bgmEpisodeTopicBuilder _bgmEpisodeTopic;
  GGetEpisodeTopicData_bgmEpisodeTopicBuilder get bgmEpisodeTopic =>
      _$this._bgmEpisodeTopic ??=
          new GGetEpisodeTopicData_bgmEpisodeTopicBuilder();
  set bgmEpisodeTopic(
          GGetEpisodeTopicData_bgmEpisodeTopicBuilder bgmEpisodeTopic) =>
      _$this._bgmEpisodeTopic = bgmEpisodeTopic;

  GGetEpisodeTopicDataBuilder() {
    GGetEpisodeTopicData._initializeBuilder(this);
  }

  GGetEpisodeTopicDataBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _bgmEpisodeTopic = _$v.bgmEpisodeTopic?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicData;
  }

  @override
  void update(void Function(GGetEpisodeTopicDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData build() {
    _$GGetEpisodeTopicData _$result;
    try {
      _$result = _$v ??
          new _$GGetEpisodeTopicData._(
              G__typename: G__typename,
              bgmEpisodeTopic: _bgmEpisodeTopic?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'bgmEpisodeTopic';
        _bgmEpisodeTopic?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetEpisodeTopicData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic
    extends GGetEpisodeTopicData_bgmEpisodeTopic {
  @override
  final String G__typename;
  @override
  final BuiltList<GGetEpisodeTopicData_bgmEpisodeTopic_comments> comments;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic(
          [void Function(GGetEpisodeTopicData_bgmEpisodeTopicBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopicBuilder()..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic._({this.G__typename, this.comments})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic', 'G__typename');
    }
    if (comments == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic', 'comments');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic rebuild(
          void Function(GGetEpisodeTopicData_bgmEpisodeTopicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopicBuilder toBuilder() =>
      new GGetEpisodeTopicData_bgmEpisodeTopicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicData_bgmEpisodeTopic &&
        G__typename == other.G__typename &&
        comments == other.comments;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), comments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetEpisodeTopicData_bgmEpisodeTopic')
          ..add('G__typename', G__typename)
          ..add('comments', comments))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopicBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic,
            GGetEpisodeTopicData_bgmEpisodeTopicBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments> _comments;
  ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments> get comments =>
      _$this._comments ??=
          new ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments>();
  set comments(
          ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments>
              comments) =>
      _$this._comments = comments;

  GGetEpisodeTopicData_bgmEpisodeTopicBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic._initializeBuilder(this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopicBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _comments = _$v.comments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicData_bgmEpisodeTopic other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicData_bgmEpisodeTopic;
  }

  @override
  void update(
      void Function(GGetEpisodeTopicData_bgmEpisodeTopicBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic build() {
    _$GGetEpisodeTopicData_bgmEpisodeTopic _$result;
    try {
      _$result = _$v ??
          new _$GGetEpisodeTopicData_bgmEpisodeTopic._(
              G__typename: G__typename, comments: comments.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetEpisodeTopicData_bgmEpisodeTopic',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments
    extends GGetEpisodeTopicData_bgmEpisodeTopic_comments {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String floor;
  @override
  final String time;
  @override
  final String text;
  @override
  final GGetEpisodeTopicData_bgmEpisodeTopic_comments_author author;
  @override
  final BuiltList<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>
      replies;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic_comments(
          [void Function(GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder()
            ..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments._(
      {this.G__typename,
      this.id,
      this.floor,
      this.time,
      this.text,
      this.author,
      this.replies})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments', 'G__typename');
    }
    if (replies == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments', 'replies');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments rebuild(
          void Function(GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder toBuilder() =>
      new GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicData_bgmEpisodeTopic_comments &&
        G__typename == other.G__typename &&
        id == other.id &&
        floor == other.floor &&
        time == other.time &&
        text == other.text &&
        author == other.author &&
        replies == other.replies;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                        floor.hashCode),
                    time.hashCode),
                text.hashCode),
            author.hashCode),
        replies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('floor', floor)
          ..add('time', time)
          ..add('text', text)
          ..add('author', author)
          ..add('replies', replies))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic_comments,
            GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _floor;
  String get floor => _$this._floor;
  set floor(String floor) => _$this._floor = floor;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder _author;
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder get author =>
      _$this._author ??=
          new GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder();
  set author(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder author) =>
      _$this._author = author;

  ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies> _replies;
  ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>
      get replies => _$this._replies ??= new ListBuilder<
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>();
  set replies(
          ListBuilder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies>
              replies) =>
      _$this._replies = replies;

  GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic_comments._initializeBuilder(this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _floor = _$v.floor;
      _time = _$v.time;
      _text = _$v.text;
      _author = _$v.author?.toBuilder();
      _replies = _$v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicData_bgmEpisodeTopic_comments other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicData_bgmEpisodeTopic_comments;
  }

  @override
  void update(
      void Function(GGetEpisodeTopicData_bgmEpisodeTopic_commentsBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments build() {
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments _$result;
    try {
      _$result = _$v ??
          new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments._(
              G__typename: G__typename,
              id: id,
              floor: floor,
              time: time,
              text: text,
              author: _author?.build(),
              replies: replies.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        _author?.build();
        _$failedField = 'replies';
        replies.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author
    extends GGetEpisodeTopicData_bgmEpisodeTopic_comments_author {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String msg;
  @override
  final String avatar;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author(
          [void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder()
            ..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author._(
      {this.G__typename, this.id, this.msg, this.avatar})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments_author',
          'G__typename');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_author rebuild(
          void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder toBuilder() =>
      new GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicData_bgmEpisodeTopic_comments_author &&
        G__typename == other.G__typename &&
        id == other.id &&
        msg == other.msg &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), msg.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('msg', msg)
          ..add('avatar', avatar))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_author,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_author._initializeBuilder(
        this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _msg = _$v.msg;
      _avatar = _$v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicData_bgmEpisodeTopic_comments_author other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author;
  }

  @override
  void update(
      void Function(GGetEpisodeTopicData_bgmEpisodeTopic_comments_authorBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author build() {
    final _$result = _$v ??
        new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_author._(
            G__typename: G__typename, id: id, msg: msg, avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies
    extends GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String floor;
  @override
  final String time;
  @override
  final String text;
  @override
  final GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote quote;
  @override
  final GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author author;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies(
          [void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder()
            ..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies._(
      {this.G__typename,
      this.id,
      this.floor,
      this.time,
      this.text,
      this.quote,
      this.author})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies',
          'G__typename');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies rebuild(
          void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder toBuilder() =>
      new GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies &&
        G__typename == other.G__typename &&
        id == other.id &&
        floor == other.floor &&
        time == other.time &&
        text == other.text &&
        quote == other.quote &&
        author == other.author;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, G__typename.hashCode), id.hashCode),
                        floor.hashCode),
                    time.hashCode),
                text.hashCode),
            quote.hashCode),
        author.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('floor', floor)
          ..add('time', time)
          ..add('text', text)
          ..add('quote', quote)
          ..add('author', author))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _floor;
  String get floor => _$this._floor;
  set floor(String floor) => _$this._floor = floor;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder _quote;
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
      get quote => _$this._quote ??=
          new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder();
  set quote(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
              quote) =>
      _$this._quote = quote;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder _author;
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
      get author => _$this._author ??=
          new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder();
  set author(
          GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
              author) =>
      _$this._author = author;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies._initializeBuilder(
        this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _floor = _$v.floor;
      _time = _$v.time;
      _text = _$v.text;
      _quote = _$v.quote?.toBuilder();
      _author = _$v.author?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies;
  }

  @override
  void update(
      void Function(
              GGetEpisodeTopicData_bgmEpisodeTopic_comments_repliesBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies build() {
    _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies _$result;
    try {
      _$result = _$v ??
          new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies._(
              G__typename: G__typename,
              id: id,
              floor: floor,
              time: time,
              text: text,
              quote: _quote?.build(),
              author: _author?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'quote';
        _quote?.build();
        _$failedField = 'author';
        _author?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote
    extends GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote {
  @override
  final String G__typename;
  @override
  final String from;
  @override
  final String text;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote(
          [void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder()
            ..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote._(
      {this.G__typename, this.from, this.text})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote',
          'G__typename');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote rebuild(
          void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
      toBuilder() =>
          new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote &&
        G__typename == other.G__typename &&
        from == other.from &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), from.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote')
          ..add('G__typename', G__typename)
          ..add('from', from)
          ..add('text', text))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _from;
  String get from => _$this._from;
  set from(String from) => _$this._from = from;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote
        ._initializeBuilder(this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder
      get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _from = _$v.from;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v =
        other as _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote;
  }

  @override
  void update(
      void Function(
              GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quoteBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote build() {
    final _$result = _$v ??
        new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_quote._(
            G__typename: G__typename, from: from, text: text);
    replace(_$result);
    return _$result;
  }
}

class _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author
    extends GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String msg;
  @override
  final String avatar;

  factory _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author(
          [void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder)
              updates]) =>
      (new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder()
            ..update(updates))
          .build();

  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author._(
      {this.G__typename, this.id, this.msg, this.avatar})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author',
          'G__typename');
    }
  }

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author rebuild(
          void Function(
                  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
      toBuilder() =>
          new GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author &&
        G__typename == other.G__typename &&
        id == other.id &&
        msg == other.msg &&
        avatar == other.avatar;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), msg.hashCode),
        avatar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('msg', msg)
          ..add('avatar', avatar))
        .toString();
  }
}

class GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
    implements
        Builder<GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author,
            GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder> {
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder() {
    GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author
        ._initializeBuilder(this);
  }

  GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder
      get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _msg = _$v.msg;
      _avatar = _$v.avatar;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v =
        other as _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author;
  }

  @override
  void update(
      void Function(
              GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_authorBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author build() {
    final _$result = _$v ??
        new _$GGetEpisodeTopicData_bgmEpisodeTopic_comments_replies_author._(
            G__typename: G__typename, id: id, msg: msg, avatar: avatar);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
