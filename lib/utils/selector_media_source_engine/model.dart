import 'package:flutter_boilerplate/utils/selector_media_source_engine/selector_subject_format.dart';
import 'package:flutter_boilerplate/utils/string_extension.dart';
import 'package:html/dom.dart';

class SelectorFormatId {
  final String value;
  const SelectorFormatId(this.value);
}

abstract class SelectorFormatConfig {
  const SelectorFormatConfig();
}

abstract class SelectorFormat {
  abstract final SelectorFormatId id;
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
  final String searchUrl;
  final String rawBaseUrl;
  final SelectorSubjectFormatIndexedConfig selectorSubjectFormatIndexed;
  const SelectorSearchConfig(
      {required this.selectorSubjectFormatIndexed,
      required this.subjectFomatId,
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
      SelectorSubjectFormat format) {
    switch (format) {
      case SelectorSubjectFormatIndexed():
        return selectorSubjectFormatIndexed as C;
    }
  }
}
