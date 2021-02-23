// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bgm.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetEpisodeTopicVars> _$gGetEpisodeTopicVarsSerializer =
    new _$GGetEpisodeTopicVarsSerializer();

class _$GGetEpisodeTopicVarsSerializer
    implements StructuredSerializer<GGetEpisodeTopicVars> {
  @override
  final Iterable<Type> types = const [
    GGetEpisodeTopicVars,
    _$GGetEpisodeTopicVars
  ];
  @override
  final String wireName = 'GGetEpisodeTopicVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GGetEpisodeTopicVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GGetEpisodeTopicVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGetEpisodeTopicVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetEpisodeTopicVars extends GGetEpisodeTopicVars {
  @override
  final int id;

  factory _$GGetEpisodeTopicVars(
          [void Function(GGetEpisodeTopicVarsBuilder) updates]) =>
      (new GGetEpisodeTopicVarsBuilder()..update(updates)).build();

  _$GGetEpisodeTopicVars._({this.id}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('GGetEpisodeTopicVars', 'id');
    }
  }

  @override
  GGetEpisodeTopicVars rebuild(
          void Function(GGetEpisodeTopicVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetEpisodeTopicVarsBuilder toBuilder() =>
      new GGetEpisodeTopicVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetEpisodeTopicVars && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GGetEpisodeTopicVars')..add('id', id))
        .toString();
  }
}

class GGetEpisodeTopicVarsBuilder
    implements Builder<GGetEpisodeTopicVars, GGetEpisodeTopicVarsBuilder> {
  _$GGetEpisodeTopicVars _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  GGetEpisodeTopicVarsBuilder();

  GGetEpisodeTopicVarsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetEpisodeTopicVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GGetEpisodeTopicVars;
  }

  @override
  void update(void Function(GGetEpisodeTopicVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GGetEpisodeTopicVars build() {
    final _$result = _$v ?? new _$GGetEpisodeTopicVars._(id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
