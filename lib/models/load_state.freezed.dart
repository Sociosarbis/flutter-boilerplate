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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$NoneCopyWith<$Res> {
  factory _$$NoneCopyWith(_$None value, $Res Function(_$None) then) =
      __$$NoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoneCopyWithImpl<$Res> extends _$LoadStateCopyWithImpl<$Res, _$None>
    implements _$$NoneCopyWith<$Res> {
  __$$NoneCopyWithImpl(_$None _value, $Res Function(_$None) _then)
      : super(_value, _then);
}

/// @nodoc

class _$None implements None {
  const _$None();

  @override
  String toString() {
    return 'LoadState.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$None);
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
  const factory None() = _$None;
}

/// @nodoc
abstract class _$$NotLoadingCopyWith<$Res> {
  factory _$$NotLoadingCopyWith(
          _$NotLoading value, $Res Function(_$NotLoading) then) =
      __$$NotLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({bool endOfPaginationReached});
}

/// @nodoc
class __$$NotLoadingCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$NotLoading>
    implements _$$NotLoadingCopyWith<$Res> {
  __$$NotLoadingCopyWithImpl(
      _$NotLoading _value, $Res Function(_$NotLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endOfPaginationReached = null,
  }) {
    return _then(_$NotLoading(
      endOfPaginationReached: null == endOfPaginationReached
          ? _value.endOfPaginationReached
          : endOfPaginationReached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NotLoading implements NotLoading {
  const _$NotLoading({required this.endOfPaginationReached});

  @override
  final bool endOfPaginationReached;

  @override
  String toString() {
    return 'LoadState.notLoading(endOfPaginationReached: $endOfPaginationReached)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotLoading &&
            (identical(other.endOfPaginationReached, endOfPaginationReached) ||
                other.endOfPaginationReached == endOfPaginationReached));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endOfPaginationReached);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotLoadingCopyWith<_$NotLoading> get copyWith =>
      __$$NotLoadingCopyWithImpl<_$NotLoading>(this, _$identity);

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
      _$NotLoading;

  bool get endOfPaginationReached;
  @JsonKey(ignore: true)
  _$$NotLoadingCopyWith<_$NotLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$LoadStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'LoadState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
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
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ErrCopyWith<$Res> {
  factory _$$ErrCopyWith(_$Err value, $Res Function(_$Err) then) =
      __$$ErrCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$$ErrCopyWithImpl<$Res> extends _$LoadStateCopyWithImpl<$Res, _$Err>
    implements _$$ErrCopyWith<$Res> {
  __$$ErrCopyWithImpl(_$Err _value, $Res Function(_$Err) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$Err(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$Err implements Err {
  const _$Err({required this.error});

  @override
  final Exception error;

  @override
  String toString() {
    return 'LoadState.err(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Err &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrCopyWith<_$Err> get copyWith =>
      __$$ErrCopyWithImpl<_$Err>(this, _$identity);

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
  const factory Err({required final Exception error}) = _$Err;

  Exception get error;
  @JsonKey(ignore: true)
  _$$ErrCopyWith<_$Err> get copyWith => throw _privateConstructorUsedError;
}
