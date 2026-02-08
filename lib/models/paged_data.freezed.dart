// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PagedData<T> {
  int get pageSize => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagedDataCopyWith<T, PagedData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedDataCopyWith<T, $Res> {
  factory $PagedDataCopyWith(
          PagedData<T> value, $Res Function(PagedData<T>) then) =
      _$PagedDataCopyWithImpl<T, $Res, PagedData<T>>;
  @useResult
  $Res call({int pageSize, List<T> data, bool hasMore});
}

/// @nodoc
class _$PagedDataCopyWithImpl<T, $Res, $Val extends PagedData<T>>
    implements $PagedDataCopyWith<T, $Res> {
  _$PagedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? data = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedDataImplCopyWith<T, $Res>
    implements $PagedDataCopyWith<T, $Res> {
  factory _$$PagedDataImplCopyWith(
          _$PagedDataImpl<T> value, $Res Function(_$PagedDataImpl<T>) then) =
      __$$PagedDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int pageSize, List<T> data, bool hasMore});
}

/// @nodoc
class __$$PagedDataImplCopyWithImpl<T, $Res>
    extends _$PagedDataCopyWithImpl<T, $Res, _$PagedDataImpl<T>>
    implements _$$PagedDataImplCopyWith<T, $Res> {
  __$$PagedDataImplCopyWithImpl(
      _$PagedDataImpl<T> _value, $Res Function(_$PagedDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? data = null,
    Object? hasMore = null,
  }) {
    return _then(_$PagedDataImpl<T>(
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PagedDataImpl<T> extends _PagedData<T> {
  const _$PagedDataImpl(
      {required this.pageSize,
      required final List<T> data,
      this.hasMore = true})
      : _data = data,
        super._();

  @override
  final int pageSize;
  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'PagedData<$T>(pageSize: $pageSize, data: $data, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedDataImpl<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageSize,
      const DeepCollectionEquality().hash(_data), hasMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedDataImplCopyWith<T, _$PagedDataImpl<T>> get copyWith =>
      __$$PagedDataImplCopyWithImpl<T, _$PagedDataImpl<T>>(this, _$identity);
}

abstract class _PagedData<T> extends PagedData<T> {
  const factory _PagedData(
      {required final int pageSize,
      required final List<T> data,
      final bool hasMore}) = _$PagedDataImpl<T>;
  const _PagedData._() : super._();

  @override
  int get pageSize;
  @override
  List<T> get data;
  @override
  bool get hasMore;
  @override
  @JsonKey(ignore: true)
  _$$PagedDataImplCopyWith<T, _$PagedDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
