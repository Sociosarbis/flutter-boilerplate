import 'package:json_annotation/json_annotation.dart';
import 'author.dart';
import 'quote.dart';

part 'comment.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Comment {
  int id;
  String floor;
  String time;
  String text;
  Author author;
  Quote quote;
  List<Comment> replies;
  Comment(
      {this.id,
      this.floor,
      this.time,
      this.text,
      this.author,
      this.quote,
      this.replies});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
