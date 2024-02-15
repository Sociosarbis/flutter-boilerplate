// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppConfig _$$_AppConfigFromJson(Map<String, dynamic> json) => _$_AppConfig(
      githubClientId: json['github_client_id'] as String,
      githubCientSecret: json['github_client_secret'] as String,
      bgmPersonalAccessToken: json['bgm_personal_access_token'] as String,
    );

Map<String, dynamic> _$$_AppConfigToJson(_$_AppConfig instance) =>
    <String, dynamic>{
      'github_client_id': instance.githubClientId,
      'github_client_secret': instance.githubCientSecret,
      'bgm_personal_access_token': instance.bgmPersonalAccessToken,
    };
