import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_boilerplate/utils/selector_media_source_engine/model.dart';
import 'package:flutter_boilerplate/utils/string_extension.dart';
import 'package:html/dom.dart';

part 'selector_channel_format.dart';
part 'selector_subject_format.dart';

sealed class SelectorFormat {
  abstract final SelectorFormatId id;

  static String computeAbsoluteUrl(String baseUrl, String relativeUrl) {
    if (relativeUrl.startsWith("http")) {
      return relativeUrl;
    }
    if (relativeUrl.startsWith("/")) {
      return "${baseUrl.removeSuffix("/")}$relativeUrl";
    } else {
      if (baseUrl.endsWith("/")) {
        return "$baseUrl$relativeUrl";
      } else {
        final index = baseUrl.lastIndexOf("/");
        if (index == -1 || (index > 1 && baseUrl[index - 1] == "/")) {
          return "$baseUrl/$relativeUrl";
        } else {
          return "${baseUrl.substring(0, index)}/$relativeUrl";
        }
      }
    }
  }
}