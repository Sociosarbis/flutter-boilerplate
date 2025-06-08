import 'package:collection/collection.dart';
import 'package:flutter_boilerplate/utils/selector_media_source_engine/selector_format.dart';
import 'package:flutter_boilerplate/utils/string_extension.dart';
import 'package:html/dom.dart';

class SelectorFormatId {
  final String value;
  const SelectorFormatId(this.value);
}

abstract class SelectorFormatConfig {
  const SelectorFormatConfig();
}

class SearchSubjectResult {
  final Uri url;
  final Document? document;
  const SearchSubjectResult(this.url, this.document);
}

class WebSearchSubjectInfo {
  final String internalId;
  final String name;
  final String fullUrl;
  final String partialUrl;
  final Element? origin;
  const WebSearchSubjectInfo(
      {required this.internalId,
      required this.name,
      required this.fullUrl,
      required this.partialUrl,
      this.origin});
}

class KeepWords {
  final String originalWord;
  final String mask;
  const KeepWords(this.originalWord, this.mask);
}

class SelectorSubjectFormatIndexedConfig extends SelectorFormatConfig {
  final String selectNames;
  final String selectLinks;
  final bool preferShorterName;
  const SelectorSubjectFormatIndexedConfig(this.selectNames, this.selectLinks,
      {this.preferShorterName = false})
      : super();
}

class SelectorSearchConfig {
  final SelectorFormatId subjectFomatId;
  final SelectorFormatId channelFormatId;
  final String searchUrl;
  final String rawBaseUrl;
  final SelectorSubjectFormatIndexedConfig selectorSubjectFormatIndexed;
  final SelectorChannelFormatIndexGroupedConfig selectorChannelFormatIndexGroupedConfig;
  const SelectorSearchConfig(
      {required this.selectorSubjectFormatIndexed,
      required this.selectorChannelFormatIndexGroupedConfig,
      required this.subjectFomatId,
      required this.channelFormatId,
      this.searchUrl = "",
      this.rawBaseUrl = ""});

  String get finalBaseUrl {
    return rawBaseUrl.isNotEmpty ? rawBaseUrl : _guessBaseUrl(searchUrl);
  }

  String _guessBaseUrl(String searchUrl) {
    final uri = Uri.tryParse(searchUrl);
    if (uri != null) {
      return uri.origin;
    }
    final schemaIndex = searchUrl.indexOf("//");
    if (schemaIndex == -1) {
      return searchUrl.removeSuffix("/");
    } else {
      final slashIndex = searchUrl.indexOf("/", schemaIndex + 2);
      if (slashIndex == -1) {
        return searchUrl.removeSuffix("/");
      } else {
        return searchUrl.substring(0, slashIndex);
      }
    }
  }

  C getFormatConfig<C extends SelectorFormatConfig>(
      SelectorFormat format) {
    switch (format) {
      case SelectorSubjectFormat():
        return selectorSubjectFormatIndexed as C;
      case SelectorChannelFormatIndexGrouped():
        return selectorChannelFormatIndexGroupedConfig as C;
    }
  }

  C getChannelFormatConfig<C extends SelectorFormatConfig>(SelectorChannelFormat format) {
    switch (format) {
      case SelectorChannelFormatIndexGrouped():
        return selectorChannelFormatIndexGroupedConfig as C;
    }
  }
}

enum EpisodeType {
  mainStory("MainStory"),
  sp("SP"),
  op("OP"),
  ed("ED"),
  pv("PV"),
  mad("MAD"),
  ova("OVA"),
  oad("OAD");

  final String value;
  const EpisodeType(this.value);
}

EpisodeSort getSpecialByRaw(String raw) {
  final type = EpisodeType.values.firstWhereOrNull((element) {
    return raw.startsWith(RegExp(element.value, caseSensitive: false));
  });
  if (type == null) {
    return EpisodeSortUnknown(raw);
  }
  final numStr = raw.substring(type.value.length);
  final num = double.tryParse(numStr);
  if (num == null || num < 0) {
    return EpisodeSortUnknown(raw);
  }
  return num.floorToDouble() == num || num % 0.5 == 0
      ? EpisodeSortSpecial(type, num)
      : EpisodeSortUnknown(raw);
}

sealed class EpisodeSort {
  abstract final double? number;

  abstract final String _raw;

  const EpisodeSort();

  @override
  String toString();

  String getNumberStr(double? number) {
    if (number == null) {
      return "";
    }
    if (number.floorToDouble() == number) {
      return "${number.toInt()}".padLeft(2, "0");
    }
    return number.toString();
  }

  factory EpisodeSort.fromRaw(String raw) {
    final float = double.tryParse(raw);
    if (float == null) {
      return getSpecialByRaw(raw);
    }
    if (float < 0) {
      return EpisodeSortUnknown(raw);
    }
    return float.floorToDouble() == float || float % 0.5 == 0
        ? EpisodeSortNormal(float)
        : EpisodeSortUnknown(raw);
  }

  factory EpisodeSort.fromInt(int int,
      [EpisodeType type = EpisodeType.mainStory]) {
    if (int.isNegative) {
      return EpisodeSortUnknown(int.toString());
    }
    switch (type) {
      case EpisodeType.mainStory:
        return EpisodeSortNormal(int.toDouble());
      default:
        return EpisodeSortSpecial(type, int.toDouble());
    }
  }
}

class EpisodeSortNormal extends EpisodeSort {
  @override
  final double number;
  const EpisodeSortNormal(this.number) : super();

  @override
  String get _raw {
    if (number.floorToDouble() == number) {
      return number.toInt().toString();
    }
    return number.toString();
  }

  bool get isPartial {
    return number % 1.0 == 0.5;
  }

  @override
  String toString() {
    return getNumberStr(number);
  }
}

class EpisodeSortSpecial extends EpisodeSort {
  final EpisodeType type;

  @override
  final double? number;

  const EpisodeSortSpecial(this.type, this.number) : super();

  @override
  String get _raw {
    return "${type.value}${getNumberStr(number)}";
  }

  @override
  String toString() {
    return _raw;
  }
}

class EpisodeSortUnknown extends EpisodeSort {
  @override
  final String _raw;
  const EpisodeSortUnknown(this._raw) : super();

  @override
  double? get number => null;

  @override
  String toString() => _raw;
}

class WebSearchEpisodeInfo {
  final String? channel;

  final String name;

  final EpisodeSort? episodeSortOrEp;
  final String playUrl;

  WebSearchEpisodeInfo({
    required this.name,
    required this.playUrl,
    this.episodeSortOrEp,
    this.channel,
  });
}

class SelectedChannelEpisodes {
  final List<String>? channel;
  final List<WebSearchEpisodeInfo> episodes;

  const SelectedChannelEpisodes({this.channel, required this.episodes});
}

class SelectorChannelFormatIndexGroupedConfig extends SelectorFormatConfig {
  final String selectChannelNames;
  final String matchChannelName;
  final String selectEpisodeLists;
  final String selectEpisodesFromList;
  final String selectEpisodeLinksFromList;
  final String matchEpisodeSortFromName;
  const SelectorChannelFormatIndexGroupedConfig(
      {required this.selectChannelNames,
      required this.matchChannelName,
      required this.selectEpisodeLinksFromList,
      required this.selectEpisodesFromList,
      required this.selectEpisodeLists,
      required this.matchEpisodeSortFromName});
}
