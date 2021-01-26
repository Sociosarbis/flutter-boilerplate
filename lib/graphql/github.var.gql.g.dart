// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFollowersVars> _$gFollowersVarsSerializer =
    new _$GFollowersVarsSerializer();
Serializer<GFollowingVars> _$gFollowingVarsSerializer =
    new _$GFollowingVarsSerializer();
Serializer<GPageInfoPartsVars> _$gPageInfoPartsVarsSerializer =
    new _$GPageInfoPartsVarsSerializer();
Serializer<GUserItemVars> _$gUserItemVarsSerializer =
    new _$GUserItemVarsSerializer();

class _$GFollowersVarsSerializer
    implements StructuredSerializer<GFollowersVars> {
  @override
  final Iterable<Type> types = const [GFollowersVars, _$GFollowersVars];
  @override
  final String wireName = 'GFollowersVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GFollowersVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    if (object.after != null) {
      result
        ..add('after')
        ..add(serializers.serialize(object.after,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowersVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowersVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFollowingVarsSerializer
    implements StructuredSerializer<GFollowingVars> {
  @override
  final Iterable<Type> types = const [GFollowingVars, _$GFollowingVars];
  @override
  final String wireName = 'GFollowingVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GFollowingVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    if (object.after != null) {
      result
        ..add('after')
        ..add(serializers.serialize(object.after,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GFollowingVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFollowingVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPageInfoPartsVarsSerializer
    implements StructuredSerializer<GPageInfoPartsVars> {
  @override
  final Iterable<Type> types = const [GPageInfoPartsVars, _$GPageInfoPartsVars];
  @override
  final String wireName = 'GPageInfoPartsVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GPageInfoPartsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  GPageInfoPartsVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPageInfoPartsVarsBuilder().build();
  }
}

class _$GUserItemVarsSerializer implements StructuredSerializer<GUserItemVars> {
  @override
  final Iterable<Type> types = const [GUserItemVars, _$GUserItemVars];
  @override
  final String wireName = 'GUserItemVars';

  @override
  Iterable<Object> serialize(Serializers serializers, GUserItemVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  GUserItemVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GUserItemVarsBuilder().build();
  }
}

class _$GFollowersVars extends GFollowersVars {
  @override
  final String login;
  @override
  final String after;

  factory _$GFollowersVars([void Function(GFollowersVarsBuilder) updates]) =>
      (new GFollowersVarsBuilder()..update(updates)).build();

  _$GFollowersVars._({this.login, this.after}) : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('GFollowersVars', 'login');
    }
  }

  @override
  GFollowersVars rebuild(void Function(GFollowersVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowersVarsBuilder toBuilder() =>
      new GFollowersVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowersVars &&
        login == other.login &&
        after == other.after;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, login.hashCode), after.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowersVars')
          ..add('login', login)
          ..add('after', after))
        .toString();
  }
}

class GFollowersVarsBuilder
    implements Builder<GFollowersVars, GFollowersVarsBuilder> {
  _$GFollowersVars _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _after;
  String get after => _$this._after;
  set after(String after) => _$this._after = after;

  GFollowersVarsBuilder();

  GFollowersVarsBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _after = _$v.after;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowersVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowersVars;
  }

  @override
  void update(void Function(GFollowersVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowersVars build() {
    final _$result = _$v ?? new _$GFollowersVars._(login: login, after: after);
    replace(_$result);
    return _$result;
  }
}

class _$GFollowingVars extends GFollowingVars {
  @override
  final String login;
  @override
  final String after;

  factory _$GFollowingVars([void Function(GFollowingVarsBuilder) updates]) =>
      (new GFollowingVarsBuilder()..update(updates)).build();

  _$GFollowingVars._({this.login, this.after}) : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('GFollowingVars', 'login');
    }
  }

  @override
  GFollowingVars rebuild(void Function(GFollowingVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFollowingVarsBuilder toBuilder() =>
      new GFollowingVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFollowingVars &&
        login == other.login &&
        after == other.after;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, login.hashCode), after.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GFollowingVars')
          ..add('login', login)
          ..add('after', after))
        .toString();
  }
}

class GFollowingVarsBuilder
    implements Builder<GFollowingVars, GFollowingVarsBuilder> {
  _$GFollowingVars _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  String _after;
  String get after => _$this._after;
  set after(String after) => _$this._after = after;

  GFollowingVarsBuilder();

  GFollowingVarsBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _after = _$v.after;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFollowingVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GFollowingVars;
  }

  @override
  void update(void Function(GFollowingVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFollowingVars build() {
    final _$result = _$v ?? new _$GFollowingVars._(login: login, after: after);
    replace(_$result);
    return _$result;
  }
}

class _$GPageInfoPartsVars extends GPageInfoPartsVars {
  factory _$GPageInfoPartsVars(
          [void Function(GPageInfoPartsVarsBuilder) updates]) =>
      (new GPageInfoPartsVarsBuilder()..update(updates)).build();

  _$GPageInfoPartsVars._() : super._();

  @override
  GPageInfoPartsVars rebuild(
          void Function(GPageInfoPartsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPageInfoPartsVarsBuilder toBuilder() =>
      new GPageInfoPartsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPageInfoPartsVars;
  }

  @override
  int get hashCode {
    return 341828880;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GPageInfoPartsVars').toString();
  }
}

class GPageInfoPartsVarsBuilder
    implements Builder<GPageInfoPartsVars, GPageInfoPartsVarsBuilder> {
  _$GPageInfoPartsVars _$v;

  GPageInfoPartsVarsBuilder();

  @override
  void replace(GPageInfoPartsVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GPageInfoPartsVars;
  }

  @override
  void update(void Function(GPageInfoPartsVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GPageInfoPartsVars build() {
    final _$result = _$v ?? new _$GPageInfoPartsVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GUserItemVars extends GUserItemVars {
  factory _$GUserItemVars([void Function(GUserItemVarsBuilder) updates]) =>
      (new GUserItemVarsBuilder()..update(updates)).build();

  _$GUserItemVars._() : super._();

  @override
  GUserItemVars rebuild(void Function(GUserItemVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GUserItemVarsBuilder toBuilder() => new GUserItemVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GUserItemVars;
  }

  @override
  int get hashCode {
    return 27657841;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GUserItemVars').toString();
  }
}

class GUserItemVarsBuilder
    implements Builder<GUserItemVars, GUserItemVarsBuilder> {
  _$GUserItemVars _$v;

  GUserItemVarsBuilder();

  @override
  void replace(GUserItemVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GUserItemVars;
  }

  @override
  void update(void Function(GUserItemVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GUserItemVars build() {
    final _$result = _$v ?? new _$GUserItemVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
