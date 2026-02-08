// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      githubClientId: json['github_client_id'] as String,
      githubCientSecret: json['github_client_secret'] as String,
      bgmPersonalAccessToken: json['bgm_personal_access_token'] as String,
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'github_client_id': instance.githubClientId,
      'github_client_secret': instance.githubCientSecret,
      'bgm_personal_access_token': instance.bgmPersonalAccessToken,
    };
