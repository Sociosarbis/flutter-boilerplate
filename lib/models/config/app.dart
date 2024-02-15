import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.freezed.dart';

part 'app.g.dart';

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig(
      {@JsonKey(name: "github_client_id") required String githubClientId,
      @JsonKey(name: "github_client_secret") required String githubCientSecret,
      @JsonKey(name: "bgm_personal_access_token")
      required String bgmPersonalAccessToken}) = _AppConfig;

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  static Future<AppConfig> init() async {
    return AppConfig.fromJson(
        jsonDecode(await rootBundle.loadString("app.config.json")));
  }
}
