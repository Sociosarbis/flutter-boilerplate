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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  @JsonKey(name: "github_client_id")
  String get githubClientId => throw _privateConstructorUsedError;
  @JsonKey(name: "github_client_secret")
  String get githubCientSecret => throw _privateConstructorUsedError;
  @JsonKey(name: "bgm_personal_access_token")
  String get bgmPersonalAccessToken => throw _privateConstructorUsedError;

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
      @JsonKey(name: "github_client_secret") String githubCientSecret,
      @JsonKey(name: "bgm_personal_access_token")
      String bgmPersonalAccessToken});
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
    Object? bgmPersonalAccessToken = null,
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
      bgmPersonalAccessToken: null == bgmPersonalAccessToken
          ? _value.bgmPersonalAccessToken
          : bgmPersonalAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "github_client_id") String githubClientId,
      @JsonKey(name: "github_client_secret") String githubCientSecret,
      @JsonKey(name: "bgm_personal_access_token")
      String bgmPersonalAccessToken});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? githubClientId = null,
    Object? githubCientSecret = null,
    Object? bgmPersonalAccessToken = null,
  }) {
    return _then(_$AppConfigImpl(
      githubClientId: null == githubClientId
          ? _value.githubClientId
          : githubClientId // ignore: cast_nullable_to_non_nullable
              as String,
      githubCientSecret: null == githubCientSecret
          ? _value.githubCientSecret
          : githubCientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      bgmPersonalAccessToken: null == bgmPersonalAccessToken
          ? _value.bgmPersonalAccessToken
          : bgmPersonalAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl(
      {@JsonKey(name: "github_client_id") required this.githubClientId,
      @JsonKey(name: "github_client_secret") required this.githubCientSecret,
      @JsonKey(name: "bgm_personal_access_token")
      required this.bgmPersonalAccessToken});

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  @JsonKey(name: "github_client_id")
  final String githubClientId;
  @override
  @JsonKey(name: "github_client_secret")
  final String githubCientSecret;
  @override
  @JsonKey(name: "bgm_personal_access_token")
  final String bgmPersonalAccessToken;

  @override
  String toString() {
    return 'AppConfig(githubClientId: $githubClientId, githubCientSecret: $githubCientSecret, bgmPersonalAccessToken: $bgmPersonalAccessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.githubClientId, githubClientId) ||
                other.githubClientId == githubClientId) &&
            (identical(other.githubCientSecret, githubCientSecret) ||
                other.githubCientSecret == githubCientSecret) &&
            (identical(other.bgmPersonalAccessToken, bgmPersonalAccessToken) ||
                other.bgmPersonalAccessToken == bgmPersonalAccessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, githubClientId, githubCientSecret, bgmPersonalAccessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig(
      {@JsonKey(name: "github_client_id") required final String githubClientId,
      @JsonKey(name: "github_client_secret")
      required final String githubCientSecret,
      @JsonKey(name: "bgm_personal_access_token")
      required final String bgmPersonalAccessToken}) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  @JsonKey(name: "github_client_id")
  String get githubClientId;
  @override
  @JsonKey(name: "github_client_secret")
  String get githubCientSecret;
  @override
  @JsonKey(name: "bgm_personal_access_token")
  String get bgmPersonalAccessToken;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
