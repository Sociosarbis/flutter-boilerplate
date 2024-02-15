import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_data.freezed.dart';

@freezed
class PagedData<T> with _$PagedData<T> {
  const PagedData._();

  const factory PagedData(
      {required int pageSize,
      required List<T> data,
      @Default(true) bool hasMore}) = _PagedData<T>;

  int getNextPage() {
    return data.length ~/ pageSize + 1;
  }

  PagedData<T> addPage(List<T> page) {
    return copyWith(
        data: [...data.sublist(0, (getNextPage() - 1) * pageSize), ...page]);
  }
}
