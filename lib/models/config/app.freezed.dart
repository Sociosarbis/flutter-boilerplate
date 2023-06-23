// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  @JsonKey(name: "github_client_id")
  String get githubClientId => throw _privateConstructorUsedError;
  @JsonKey(name: "github_client_secret")
  String get githubCientSecret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {@JsonKey(name: "github_client_id") String githubClientId,
      @JsonKey(name: "github_client_secret") String githubCientSecret});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? githubClientId = null,
    Object? githubCientSecret = null,
  }) {
    return _then(_value.copyWith(
      githubClientId: null == githubClientId
          ? _value.githubClientId
          : githubClientId // ignore: cast_nullable_to_non_nullable
              as String,
      githubCientSecret: null == githubCientSecret
          ? _value.githubCientSecret
          : githubCientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$$_AppConfigCopyWith(
          _$_AppConfig value, $Res Function(_$_AppConfig) then) =
      __$$_AppConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "github_client_id") String githubClientId,
      @JsonKey(name: "github_client_secret") String githubCientSecret});
}

/// @nodoc
class __$$_AppConfigCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$_AppConfig>
    implements _$$_AppConfigCopyWith<$Res> {
  __$$_AppConfigCopyWithImpl(
      _$_AppConfig _value, $Res Function(_$_AppConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? githubClientId = null,
    Object? githubCientSecret = null,
  }) {
    return _then(_$_AppConfig(
      githubClientId: null == githubClientId
          ? _value.githubClientId
          : githubClientId // ignore: cast_nullable_to_non_nullable
              as String,
      githubCientSecret: null == githubCientSecret
          ? _value.githubCientSecret
          : githubCientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppConfig implements _AppConfig {
  const _$_AppConfig(
      {@JsonKey(name: "github_client_id") required this.githubClientId,
      @JsonKey(name: "github_client_secret") required this.githubCientSecret});

  factory _$_AppConfig.fromJson(Map<String, dynamic> json) =>
      _$$_AppConfigFromJson(json);

  @override
  @JsonKey(name: "github_client_id")
  final String githubClientId;
  @override
  @JsonKey(name: "github_client_secret")
  final String githubCientSecret;

  @override
  String toString() {
    return 'AppConfig(githubClientId: $githubClientId, githubCientSecret: $githubCientSecret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppConfig &&
            (identical(other.githubClientId, githubClientId) ||
                other.githubClientId == githubClientId) &&
            (identical(other.githubCientSecret, githubCientSecret) ||
                other.githubCientSecret == githubCientSecret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, githubClientId, githubCientSecret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppConfigCopyWith<_$_AppConfig> get copyWith =>
      __$$_AppConfigCopyWithImpl<_$_AppConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppConfigToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig(
      {@JsonKey(name: "github_client_id")
          required final String githubClientId,
      @JsonKey(name: "github_client_secret")
          required final String githubCientSecret}) = _$_AppConfig;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$_AppConfig.fromJson;

  @override
  @JsonKey(name: "github_client_id")
  String get githubClientId;
  @override
  @JsonKey(name: "github_client_secret")
  String get githubCientSecret;
  @override
  @JsonKey(ignore: true)
  _$$_AppConfigCopyWith<_$_AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
