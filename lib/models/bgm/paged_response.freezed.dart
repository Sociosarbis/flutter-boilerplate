// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$PagedResponseImplCopyWith<T, $Res>
    implements $PagedResponseCopyWith<T, $Res> {
  factory _$$PagedResponseImplCopyWith(_$PagedResponseImpl<T> value,
          $Res Function(_$PagedResponseImpl<T>) then) =
      __$$PagedResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int total, int limit, int offset, List<T> data});
}

/// @nodoc
class __$$PagedResponseImplCopyWithImpl<T, $Res>
    extends _$PagedResponseCopyWithImpl<T, $Res, _$PagedResponseImpl<T>>
    implements _$$PagedResponseImplCopyWith<T, $Res> {
  __$$PagedResponseImplCopyWithImpl(_$PagedResponseImpl<T> _value,
      $Res Function(_$PagedResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? limit = null,
    Object? offset = null,
    Object? data = null,
  }) {
    return _then(_$PagedResponseImpl<T>(
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
class _$PagedResponseImpl<T> implements _PagedResponse<T> {
  const _$PagedResponseImpl(
      {required this.total,
      required this.limit,
      required this.offset,
      required final List<T> data})
      : _data = data;

  factory _$PagedResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PagedResponseImplFromJson(json, fromJsonT);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedResponseImpl<T> &&
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
  _$$PagedResponseImplCopyWith<T, _$PagedResponseImpl<T>> get copyWith =>
      __$$PagedResponseImplCopyWithImpl<T, _$PagedResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PagedResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PagedResponse<T> implements PagedResponse<T> {
  const factory _PagedResponse(
      {required final int total,
      required final int limit,
      required final int offset,
      required final List<T> data}) = _$PagedResponseImpl<T>;

  factory _PagedResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PagedResponseImpl<T>.fromJson;

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
  _$$PagedResponseImplCopyWith<T, _$PagedResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
