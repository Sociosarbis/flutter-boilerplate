import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable(includeIfNull: false)
class Account {
  String platform;
  String domain;
  String token;
  String login;
  String avatarUrl;
  int? gitlabId; // For GitLab
  String? appPassword; // For Bitbucket
  String? accountId; // For Bitbucket

  Account({
    required this.platform,
    required this.domain,
    required this.token,
    required this.login,
    required this.avatarUrl,
    this.gitlabId,
    this.appPassword,
    this.accountId,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
