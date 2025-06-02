import 'package:flutter_boilerplate/utils/selector_media_source_engine/model.dart';
import 'package:flutter_boilerplate/utils/selector_media_source_engine/selector_media_source_engine.dart';
import 'package:flutter_test/flutter_test.dart';

Future<SearchSubjectResult> searchSubjects() async {
  return SelectorMediaSourceEngine().searchSubjects(
      "https://anime.girigirilove.com/search/-------------/?wd={keyword}",
      "启示录酒店",
      useOnlyFirstWord: true,
      removeSpecial: true);
}

void main() {
  test("search subjects", () async {
    final result = await searchSubjects();
    expect(result.document, isNotNull);
  });

  test("select subjects", () async {
    final result = await searchSubjects();
    final doc = result.document?.documentElement;
    if (doc != null) {
      final results = SelectorMediaSourceEngine().selectSubjects(
          doc,
          const SelectorSearchConfig(
              selectorSubjectFormatIndexed: SelectorSubjectFormatIndexedConfig(
                  "body > .box-width .search-box .thumb-content > .thumb-txt",
                  "body > .box-width .search-box .thumb-menu > a",
                  preferShorterName: true),
              subjectFomatId: SelectorFormatId("indexed"),
              searchUrl:
                  "https://anime.girigirilove.com/search/-------------/?wd={keyword}"));
      expect(results, isNotEmpty);
    }
  });
}
