import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(includeIfNull: false)
class Author {
  String name;
  int id;
  String msg;
  String avatar;
  @JsonKey(name: '__typename')
  String typename;

  Author({this.name, this.id, this.msg, this.avatar, this.typename});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
