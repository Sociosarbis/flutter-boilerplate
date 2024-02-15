// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  int get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: "name_cn")
  String get nameCN => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {int id,
      int type,
      String name,
      String date,
      @JsonKey(name: "name_cn") String nameCN,
      int rank,
      double score});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? date = null,
    Object? nameCN = null,
    Object? rank = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      nameCN: null == nameCN
          ? _value.nameCN
          : nameCN // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$_SubjectCopyWith(
          _$_Subject value, $Res Function(_$_Subject) then) =
      __$$_SubjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int type,
      String name,
      String date,
      @JsonKey(name: "name_cn") String nameCN,
      int rank,
      double score});
}

/// @nodoc
class __$$_SubjectCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$_Subject>
    implements _$$_SubjectCopyWith<$Res> {
  __$$_SubjectCopyWithImpl(_$_Subject _value, $Res Function(_$_Subject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? date = null,
    Object? nameCN = null,
    Object? rank = null,
    Object? score = null,
  }) {
    return _then(_$_Subject(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      nameCN: null == nameCN
          ? _value.nameCN
          : nameCN // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subject implements _Subject {
  const _$_Subject(
      {required this.id,
      required this.type,
      required this.name,
      required this.date,
      @JsonKey(name: "name_cn") required this.nameCN,
      required this.rank,
      required this.score});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

  @override
  final int id;
  @override
  final int type;
  @override
  final String name;
  @override
  final String date;
  @override
  @JsonKey(name: "name_cn")
  final String nameCN;
  @override
  final int rank;
  @override
  final double score;

  @override
  String toString() {
    return 'Subject(id: $id, type: $type, name: $name, date: $date, nameCN: $nameCN, rank: $rank, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subject &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.nameCN, nameCN) || other.nameCN == nameCN) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, name, date, nameCN, rank, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      __$$_SubjectCopyWithImpl<_$_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {required final int id,
      required final int type,
      required final String name,
      required final String date,
      @JsonKey(name: "name_cn") required final String nameCN,
      required final int rank,
      required final double score}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override
  int get id;
  @override
  int get type;
  @override
  String get name;
  @override
  String get date;
  @override
  @JsonKey(name: "name_cn")
  String get nameCN;
  @override
  int get rank;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectCopyWith<_$_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}

PagedResponse<T> _$PagedResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PagedResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PagedResponse<T> {
  int get total => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedResponseCopyWith<T, PagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedResponseCopyWith<T, $Res> {
  factory $PagedResponseCopyWith(
          PagedResponse<T> value, $Res Function(PagedResponse<T>) then) =
      _$PagedResponseCopyWithImpl<T, $Res, PagedResponse<T>>;
  @useResult
  $Res call({int total, int limit, int offset, List<T> data});
}

/// @nodoc
class _$PagedResponseCopyWithImpl<T, $Res, $Val extends PagedResponse<T>>
    implements $PagedResponseCopyWith<T, $Res> {
  _$PagedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagedResponseCopyWith<T, $Res>
    implements $PagedResponseCopyWith<T, $Res> {
  factory _$$_PagedResponseCopyWith(
          _$_PagedResponse<T> value, $Res Function(_$_PagedResponse<T>) then) =
      __$$_PagedResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int total, int limit, int offset, List<T> data});
}

/// @nodoc
class __$$_PagedResponseCopyWithImpl<T, $Res>
    extends _$PagedResponseCopyWithImpl<T, $Res, _$_PagedResponse<T>>
    implements _$$_PagedResponseCopyWith<T, $Res> {
  __$$_PagedResponseCopyWithImpl(
      _$_PagedResponse<T> _value, $Res Function(_$_PagedResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? data = null,
  }) {
    return _then(_$_PagedResponse<T>(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_PagedResponse<T> implements _PagedResponse<T> {
  const _$_PagedResponse(
      {required this.total,
      required this.limit,
      required this.offset,
      required final List<T> data})
      : _data = data;

  factory _$_PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_PagedResponseFromJson(json, fromJsonT);

  @override
  final int total;
  @override
  final int limit;
  @override
  final int offset;
  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PagedResponse<$T>(total: $total, limit: $limit, offset: $offset, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagedResponse<T> &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, limit, offset,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagedResponseCopyWith<T, _$_PagedResponse<T>> get copyWith =>
      __$$_PagedResponseCopyWithImpl<T, _$_PagedResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_PagedResponseToJson<T>(this, toJsonT);
  }
}

abstract class _PagedResponse<T> implements PagedResponse<T> {
  const factory _PagedResponse(
      {required final int total,
      required final int limit,
      required final int offset,
      required final List<T> data}) = _$_PagedResponse<T>;

  factory _PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_PagedResponse<T>.fromJson;

  @override
  int get total;
  @override
  int get limit;
  @override
  int get offset;
  @override
  List<T> get data;
  @override
  @JsonKey(ignore: true)
  _$$_PagedResponseCopyWith<T, _$_PagedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
