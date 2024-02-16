import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response.freezed.dart';
part 'paged_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PagedResponse<T> with _$PagedResponse<T> {
  const factory PagedResponse(
      {required int total,
      required int limit,
      required int offset,
      required List<T> data}) = _PagedResponse;

  factory PagedResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PagedResponseFromJson(json, fromJsonT);
}