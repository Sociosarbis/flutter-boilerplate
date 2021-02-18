import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(includeIfNull: false)
class Author {
  String name;
  int id;
  String msg;
  String avatar;

  Author({
    this.name,
    this.id,
    this.msg,
    this.avatar,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
