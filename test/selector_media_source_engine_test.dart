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
      const config = SelectorSearchConfig(
          selectorSubjectFormatIndexed: SelectorSubjectFormatIndexedConfig(
              "body > .box-width .search-box .thumb-content > .thumb-txt",
              "body > .box-width .search-box .thumb-menu > a",
              preferShorterName: true),
          subjectFomatId: SelectorFormatId("indexed"),
          searchUrl:
              "https://anime.girigirilove.com/search/-------------/?wd={keyword}",
          channelFormatId: SelectorFormatId("indexed-group"),
          selectorChannelFormatIndexGroupedConfig:
              SelectorChannelFormatIndexGroupedConfig(
                  selectChannelNames: ".anthology-tab > .swiper-wrapper a",
                  matchChannelName: "^(?<ch>.+?)(\\d+)?\$",
                  selectEpisodeLists: ".anthology-list-box",
                  selectEpisodeLinksFromList: "",
                  selectEpisodesFromList: "a",
                  matchEpisodeSortFromName: "第\\s*(?<ep>.+)\\s*[话集]"));
      final engine = SelectorMediaSourceEngine();
      final results = engine.selectSubjects(doc, config);
      expect(results, isNotEmpty);
      final episodesDoc = await engine.searchEpisodes(results![0].fullUrl);
      expect(episodesDoc, isNotNull);
      final episodes = engine.selectEpisodes(
          episodesDoc!.documentElement!, results[0].fullUrl, config);
      expect(episodes, isNotNull);
      expect(episodes!.episodes, isNotEmpty);
    }
  });
}
