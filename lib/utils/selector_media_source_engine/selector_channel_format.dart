part of 'selector_format.dart';

sealed class SelectorChannelFormat<Config extends SelectorFormatConfig>
    extends SelectorFormat {
  SelectedChannelEpisodes? select(Element page, String baseUrl, Config config);

  static final List<SelectorChannelFormat> entries = [
    SelectorChannelFormatIndexGrouped()
  ];

  static SelectorChannelFormat? findById(SelectorFormatId id) {
    return entries.firstWhereOrNull((element) => element.id == id);
  }

  bool _isPossiblyMovie(String title) {
    if (title == "正片" || title == "高清版") return true;
    return const ["2160P", "1440P", "2K", "4K", "1080P", "720P"].any((element) {
      return title.contains(element);
    });
  }

  EpisodeSort convertSpecialEpisodes(String name, String? raw) {
    final rawEp = EpisodeSort.fromRaw(raw ?? name);
    if (rawEp is EpisodeSortNormal && _isPossiblyMovie(name)) {
      return EpisodeSort.fromInt(1);
    }
    return rawEp;
  }
}

class SelectorChannelFormatIndexGrouped
    extends SelectorChannelFormat<SelectorChannelFormatIndexGroupedConfig> {
  @override
  SelectorFormatId get id => const SelectorFormatId("indexed-group");

  @override
  SelectedChannelEpisodes? select(Element page, String baseUrl,
      SelectorChannelFormatIndexGroupedConfig config) {
    RegExp? matchChannelName;
    if (config.matchChannelName.isNotEmpty) {
      try {
        matchChannelName = RegExp(config.matchChannelName);
      } catch (e) {
        //
      }
    }
    RegExp? matchEpisodeSortFromNameRegex;
    if (config.matchEpisodeSortFromName.isNotEmpty) {
      try {
        matchEpisodeSortFromNameRegex = RegExp(config.matchEpisodeSortFromName);
      } catch (e) {
        //
      }
    }
    final channelNames =
        page.querySelectorAll(config.selectChannelNames).map((e) {
      final text = e.text.trim().isEmpty ? null : e.text.trim();
      if (matchChannelName == null || text == null) {
        return text;
      } else {
        return matchChannelName.firstMatch(text)?.namedGroup("ch");
      }
    }).toList(growable: false);

    final lists = page.querySelectorAll(config.selectEpisodeLists);
    final n = min(channelNames.length, lists.length);
    final episodes = List.generate(n, (index) {
      if (channelNames[index] == null) {
        return <WebSearchEpisodeInfo>[];
      }
      final links = config.selectEpisodeLinksFromList.isNotEmpty
          ? lists[index]
              .querySelectorAll(config.selectEpisodeLinksFromList)
              .map((it) {
              final href = it.attributes["href"];
              return href?.isNotEmpty == true ? href : null;
            })
          : const <String?>[];
      return lists[index]
          .querySelectorAll(config.selectEpisodesFromList)
          .mapIndexed((i, e) {
        final text = e.text.trim();
        final href = links.elementAtOrNull(i) ?? e.attributes["href"];
        return WebSearchEpisodeInfo(
            channel: channelNames[index],
            name: text,
            episodeSortOrEp: convertSpecialEpisodes(
                text,
                matchEpisodeSortFromNameRegex
                    ?.firstMatch(text)
                    ?.namedGroup("ep")),
            playUrl: SelectorFormat.computeAbsoluteUrl(baseUrl, href ?? ""));
      }).toList(growable: false);
    }).expand((element) => element).toList(growable: false);
    return SelectedChannelEpisodes(
        channel: channelNames.whereNotNull().toList(growable: false),
        episodes: episodes);
  }
}
