import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/utils/selector_media_source_engine/model.dart';
import 'package:flutter_boilerplate/utils/selector_media_source_engine/selector_format.dart';
import 'package:flutter_boilerplate/utils/string_extension.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class SelectorMediaSourceEngine {
  static const headers = {
    "Accept": "text/html",
    "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36"
  };

  static final _keepWords = ["Re: "].mapIndexed((index, element) {
    return KeepWords(element, "\uE001$index\uE002");
  });

  static final _whitespaceChars = RegExp("\t|\u3000");

  static final _charsToDelete = "".codeUnits.toSet();

  static final _charsToReplaceWithWhiteSpace =
      r"""。、，·・[]～“”~—-!@#$%^&*()_+{}|\;':",.<>/?【】：「」！""".codeUnits.toSet();

  static const _minimumLength = 2;

  static const _numberMappings = {
    "X": "10",
    "IX": "9",
    "VIII": "8",
    "VII": "7",
    "VI": "6",
    "V": "5",
    "IV": "4",
    "III": "3",
    "II": "2",
    "I": "1",
    "十": "10",
    "九": "9",
    "八": "8",
    "七": "7",
    "六": "6",
    "五": "5",
    "四": "4",
    "三": "3",
    "二": "2",
    "一": "1",
  };

  static final _allNumberRegex = RegExp(_numberMappings.keys.join("|"));

  bool _isSpecialChar(int c) {
    return _charsToDelete.contains(c) ||
        _charsToReplaceWithWhiteSpace.contains(c);
  }

  String _applyConditionalRules(String original) {
    final sbResult = StringBuffer();
    var nonSpecialCount = 0;
    var canProcess = false;
    for (final c in original.codeUnits) {
      if (_isSpecialChar(c)) {
        if (nonSpecialCount == 0 || canProcess) {
          if (_charsToDelete.contains(c)) {
          } else if (_charsToReplaceWithWhiteSpace.contains(c)) {
            sbResult.write(" ");
          } else {
            sbResult.writeCharCode(c);
          }
        } else {
          sbResult.writeCharCode(c);
        }
      } else {
        sbResult.writeCharCode(c);
        nonSpecialCount++;
        if (!canProcess && nonSpecialCount >= _minimumLength) {
          canProcess = true;
        }
      }
    }
    return sbResult.toString();
  }

  String _removeSpecials(String string,
      {bool removeWhitespace = false,
      bool replaceNumbers = false,
      bool removeMarkers = false}) {
    var result = _keepWords.fold(string, (previousValue, element) {
      return previousValue.replaceAll(element.originalWord, element.mask);
    });
    if (removeMarkers) {
      result = result
          .deletePrefix("电影")
          .deleteInfix("电影")
          .deletePrefix("剧场版")
          .deleteInfix("剧场版")
          .deletePrefix("OVA")
          .deleteInfix("OVA")
          .deleteInfix("OAD")
          .deleteInfix("总集篇");
    }
    result = _applyConditionalRules(result);
    if (removeWhitespace) {
      result = result.replaceAll(_whitespaceChars, "");
    }
    if (replaceNumbers) {
      result = result.replaceAllMapped(_allNumberRegex, (match) {
        return _numberMappings[match[0]] ?? match[0]!;
      });
    }
    result = result.trim();
    return _keepWords.fold(result, (previousValue, element) {
      return previousValue.replaceAll(element.mask, element.originalWord);
    });
  }

  String _getFirstWord(String string) {
    final index = string.indexOf(" ");
    if (index != -1) {
      return index == 0 ? string : string.substring(0, index);
    }
    return string;
  }

  String _getSearchKeyword(String subjectName,
      {bool removeSpecial = false, bool useOnlyFirstWord = false}) {
    if (removeSpecial) {
      subjectName = _removeSpecials(subjectName);
    }
    return useOnlyFirstWord ? _getFirstWord(subjectName) : subjectName;
  }

  Future<SearchSubjectResult> searchSubjects(
      String searchUrl, String subjectName,
      {bool useOnlyFirstWord = false, bool removeSpecial = false}) {
    final encodedUrl = Uri.encodeComponent(_getSearchKeyword(subjectName));
    searchUrl = searchUrl.replaceAll("{keyword}", encodedUrl);
    final uri = Uri.tryParse(searchUrl) ?? Uri();
    return Dio().getUri(uri, options: Options(headers: headers)).then((value) {
      if (value.data case String s) {
        return SearchSubjectResult(uri, parse(s));
      }
      return SearchSubjectResult(uri, null);
    }, onError: (_) {
      return SearchSubjectResult(uri, null);
    });
  }

  List<WebSearchSubjectInfo>? selectSubjects(
      Element document, SelectorSearchConfig config) {
    final subjectFormat = SelectorSubjectFormat.findById(config.subjectFomatId);
    if (subjectFormat == null) {
      return null;
    }
    final formatConfig = config.getFormatConfig(subjectFormat);
    final originalList =
        subjectFormat.select(document, config.finalBaseUrl, formatConfig);
    return originalList;
  }

  Future<Document?> searchEpisodes(String subjectDetailsPageUrl) {
    return Dio()
        .get(subjectDetailsPageUrl, options: Options(headers: headers))
        .then((value) {
      if (value.data case String s) {
        try {
          return parse(s);
        } catch (e) {
          //
        }
      }
      return null;
    }, onError: (_) {
      return null;
    });
  }

  SelectedChannelEpisodes? selectEpisodes(Element subjectDetailsPage,
      String subjectUrl, SelectorSearchConfig config) {
    final channelFormat =
        SelectorChannelFormat.findById(config.channelFormatId);
    if (channelFormat == null) {
      return null;
    }
    final formatConfig = config.getFormatConfig(channelFormat);
    var finalBaseUrl = Uri.tryParse(subjectUrl);
    if (finalBaseUrl != null) {
      if (finalBaseUrl.pathSegments.length > 1) {
        finalBaseUrl = Uri(
          scheme: finalBaseUrl.scheme,
          host: finalBaseUrl.host,
          userInfo: finalBaseUrl.userInfo,
          port: finalBaseUrl.port,
          pathSegments: finalBaseUrl.pathSegments
              .take(finalBaseUrl.pathSegments.length - 1),
        );
      }
    }
    return channelFormat.select(
        subjectDetailsPage, finalBaseUrl?.toString() ?? "", formatConfig);
  }
}
