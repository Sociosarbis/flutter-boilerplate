import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

enum ImageSize { large, medium, common, small, grid }

@JsonSerializable(includeIfNull: false)
class Images {
  final String? large;
  final String? medium;
  final String? common;
  final String? small;
  final String? grid;
  const Images({this.large, this.medium, this.common, this.small, this.grid});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  List<String?> getVariants() {
    return [large, medium, common, small, grid];
  }

  String? tryGet(ImageSize size, [bool preferSmall = true]) {
    final variants = getVariants();
    final index = ImageSize.values.indexWhere((element) => element == size);
    var step = 0;
    while (index - step >= 0 || index + step < variants.length) {
      final steps = !preferSmall ? [-step, step] : [step, -step];
      for (final s in steps) {
        if (index + s >= 0 && index + s < variants.length) {
          final url = variants[index + s];
          if (url != null) {
            return url;
          }
        }
      }
      step += 1;
    }
    return null;
  }
}

@JsonSerializable(includeIfNull: false)
class Collection {
  final int? wish;
  final int? collect;
  final int? doing;
  @JsonKey(name: "on_hold")
  final int? onHold;
  final int? dropped;

  const Collection(
      {this.wish, this.collect, this.doing, this.onHold, this.dropped});

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  getFollow() {
    return (wish ?? 0) +
        (collect ?? 0) +
        (doing ?? 0) +
        (onHold ?? 0) +
        (dropped ?? 0);
  }
}

@JsonSerializable(includeIfNull: false)
class LegacySubjectSmall {
  final int id;
  final int type;
  final String name;
  @JsonKey(name: "name_cn")
  final String? nameCN;
  final Images? images;

  final Collection? collection;

  const LegacySubjectSmall(
      {required this.id,
      required this.type,
      required this.name,
      this.nameCN,
      this.collection,
      this.images});

  factory LegacySubjectSmall.fromJson(Map<String, dynamic> json) =>
      _$LegacySubjectSmallFromJson(json);

  Map<String, dynamic> toJson() => _$LegacySubjectSmallToJson(this);
}
