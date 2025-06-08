part of 'selector_format.dart';

sealed class SelectorSubjectFormat<Config extends SelectorFormatConfig>
    extends SelectorFormat {
  List<WebSearchSubjectInfo> select(
      Element document, String baseUrl, Config config);
  static final List<SelectorSubjectFormat> _entries = [
    SelectorSubjectFormatIndexed()
  ];

  static String _guessIdFromUrl(String href) {
    href = href.removeSuffix("/");
    var index = href.indexOf(".html");
    if (index != -1) {
      href = href.substring(index);
    }
    index = href.indexOf("/");
    if (index != -1) {
      href = href.substring(index + 1);
    }
    return href;
  }

  static SelectorSubjectFormat? findById(SelectorFormatId id) {
    return _entries.firstWhereOrNull((element) {
      return element.id == id;
    });
  }
}

class SelectorSubjectFormatIndexed
    extends SelectorSubjectFormat<SelectorSubjectFormatIndexedConfig> {
  @override
  List<WebSearchSubjectInfo> select(Element document, String baseUrl,
      SelectorSubjectFormatIndexedConfig config) {
    final names = document
        .querySelectorAll(config.selectNames)
        .map((element) {
          return element.text.isNotEmpty ? element.text : null;
        })
        .whereNotNull()
        .toList(growable: false);
    final links = document
        .querySelectorAll(config.selectLinks)
        .map((element) {
          final href = element.attributes["href"];
          return href?.isNotEmpty ?? false ? href : null;
        })
        .whereNotNull()
        .toList(growable: false);
    final n = min(names.length, links.length);
    final out = List.generate(n, (index) {
      final name = names[index];
      final href = links[index];
      final id = SelectorSubjectFormat._guessIdFromUrl(href);
      return WebSearchSubjectInfo(
          internalId: id,
          name: name,
          fullUrl: SelectorFormat.computeAbsoluteUrl(baseUrl, href),
          partialUrl: href);
    });
    if (config.preferShorterName) {
      out.sort((a, b) {
        return a.name.length - b.name.length;
      });
    }
    return out;
  }

  @override
  SelectorFormatId get id => const SelectorFormatId("indexed");
}
