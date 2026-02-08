// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool endOfPaginationReached) notLoading,
    required TResult Function() loading,
    required TResult Function(Exception error) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool endOfPaginationReached)? notLoading,
    TResult? Function()? loading,
    TResult? Function(Exception error)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool endOfPaginationReached)? notLoading,
    TResult Function()? loading,
    TResult Function(Exception error)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(NotLoading value) notLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Err value) err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(NotLoading value)? notLoading,
    TResult? Function(Loading value)? loading,
    TResult? Function(Err value)? err,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(NotLoading value)? notLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadStateCopyWith<$Res> {
  factory $LoadStateCopyWith(LoadState value, $Res Function(LoadState) then) =
      _$LoadStateCopyWithImpl<$Res, LoadState>;
}

/// @nodoc
class _$LoadStateCopyWithImpl<$Res, $Val extends LoadState>
    implements $LoadStateCopyWith<$Res> {
  _$LoadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoneImplCopyWith<$Res> {
  factory _$$NoneImplCopyWith(
          _$NoneImpl value, $Res Function(_$NoneImpl) then) =
      __$$NoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneImplCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$NoneImpl>
    implements _$$NoneImplCopyWith<$Res> {
  __$$NoneImplCopyWithImpl(_$NoneImpl _value, $Res Function(_$NoneImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoneImpl implements None {
  const _$NoneImpl();

  @override
  String toString() {
    return 'LoadState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoneImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool endOfPaginationReached) notLoading,
    required TResult Function() loading,
    required TResult Function(Exception error) err,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool endOfPaginationReached)? notLoading,
    TResult? Function()? loading,
    TResult? Function(Exception error)? err,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool endOfPaginationReached)? notLoading,
    TResult Function()? loading,
    TResult Function(Exception error)? err,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(NotLoading value) notLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Err value) err,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(NotLoading value)? notLoading,
    TResult? Function(Loading value)? loading,
    TResult? Function(Err value)? err,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(NotLoading value)? notLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None implements LoadState {
  const factory None() = _$NoneImpl;
}

/// @nodoc
abstract class _$$NotLoadingImplCopyWith<$Res> {
  factory _$$NotLoadingImplCopyWith(
          _$NotLoadingImpl value, $Res Function(_$NotLoadingImpl) then) =
      __$$NotLoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool endOfPaginationReached});
}

/// @nodoc
class __$$NotLoadingImplCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$NotLoadingImpl>
    implements _$$NotLoadingImplCopyWith<$Res> {
  __$$NotLoadingImplCopyWithImpl(
      _$NotLoadingImpl _value, $Res Function(_$NotLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endOfPaginationReached = null,
  }) {
    return _then(_$NotLoadingImpl(
      endOfPaginationReached: null == endOfPaginationReached
          ? _value.endOfPaginationReached
          : endOfPaginationReached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotLoadingImpl implements NotLoading {
  const _$NotLoadingImpl({required this.endOfPaginationReached});

  @override
  final bool endOfPaginationReached;

  @override
  String toString() {
    return 'LoadState.notLoading(endOfPaginationReached: $endOfPaginationReached)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotLoadingImpl &&
            (identical(other.endOfPaginationReached, endOfPaginationReached) ||
                other.endOfPaginationReached == endOfPaginationReached));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endOfPaginationReached);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotLoadingImplCopyWith<_$NotLoadingImpl> get copyWith =>
      __$$NotLoadingImplCopyWithImpl<_$NotLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool endOfPaginationReached) notLoading,
    required TResult Function() loading,
    required TResult Function(Exception error) err,
  }) {
    return notLoading(endOfPaginationReached);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool endOfPaginationReached)? notLoading,
    TResult? Function()? loading,
    TResult? Function(Exception error)? err,
  }) {
    return notLoading?.call(endOfPaginationReached);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool endOfPaginationReached)? notLoading,
    TResult Function()? loading,
    TResult Function(Exception error)? err,
    required TResult orElse(),
  }) {
    if (notLoading != null) {
      return notLoading(endOfPaginationReached);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(NotLoading value) notLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Err value) err,
  }) {
    return notLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(NotLoading value)? notLoading,
    TResult? Function(Loading value)? loading,
    TResult? Function(Err value)? err,
  }) {
    return notLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(NotLoading value)? notLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) {
    if (notLoading != null) {
      return notLoading(this);
    }
    return orElse();
  }
}

abstract class NotLoading implements LoadState {
  const factory NotLoading({required final bool endOfPaginationReached}) =
      _$NotLoadingImpl;

  bool get endOfPaginationReached;
  @JsonKey(ignore: true)
  _$$NotLoadingImplCopyWith<_$NotLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoadState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool endOfPaginationReached) notLoading,
    required TResult Function() loading,
    required TResult Function(Exception error) err,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool endOfPaginationReached)? notLoading,
    TResult? Function()? loading,
    TResult? Function(Exception error)? err,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool endOfPaginationReached)? notLoading,
    TResult Function()? loading,
    TResult Function(Exception error)? err,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(NotLoading value) notLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Err value) err,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(NotLoading value)? notLoading,
    TResult? Function(Loading value)? loading,
    TResult? Function(Err value)? err,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(NotLoading value)? notLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LoadState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrImplCopyWith<$Res> {
  factory _$$ErrImplCopyWith(_$ErrImpl value, $Res Function(_$ErrImpl) then) =
      __$$ErrImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$$ErrImplCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$ErrImpl>
    implements _$$ErrImplCopyWith<$Res> {
  __$$ErrImplCopyWithImpl(_$ErrImpl _value, $Res Function(_$ErrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ErrImpl implements Err {
  const _$ErrImpl({required this.error});

  @override
  final Exception error;

  @override
  String toString() {
    return 'LoadState.err(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrImplCopyWith<_$ErrImpl> get copyWith =>
      __$$ErrImplCopyWithImpl<_$ErrImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(bool endOfPaginationReached) notLoading,
    required TResult Function() loading,
    required TResult Function(Exception error) err,
  }) {
    return err(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? none,
    TResult? Function(bool endOfPaginationReached)? notLoading,
    TResult? Function()? loading,
    TResult? Function(Exception error)? err,
  }) {
    return err?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(bool endOfPaginationReached)? notLoading,
    TResult Function()? loading,
    TResult Function(Exception error)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(None value) none,
    required TResult Function(NotLoading value) notLoading,
    required TResult Function(Loading value) loading,
    required TResult Function(Err value) err,
  }) {
    return err(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(None value)? none,
    TResult? Function(NotLoading value)? notLoading,
    TResult? Function(Loading value)? loading,
    TResult? Function(Err value)? err,
  }) {
    return err?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(None value)? none,
    TResult Function(NotLoading value)? notLoading,
    TResult Function(Loading value)? loading,
    TResult Function(Err value)? err,
    required TResult orElse(),
  }) {
    if (err != null) {
      return err(this);
    }
    return orElse();
  }
}

abstract class Err implements LoadState {
  const factory Err({required final Exception error}) = _$ErrImpl;

  Exception get error;
  @JsonKey(ignore: true)
  _$$ErrImplCopyWith<_$ErrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
