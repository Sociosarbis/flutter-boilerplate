import 'package:json_annotation/json_annotation.dart';

part 'quote.g.dart';

@JsonSerializable(includeIfNull: false)
class Quote {
  String from;
  String text;
  @JsonKey(name: '__typename')
  String typename;
  Quote({this.from, this.text, this.typename});

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
