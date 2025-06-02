import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const headers = {
  "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36"
};

class WebVideo {
  final String url;
  final Map<String, String> headers;
  const WebVideo(this.url, this.headers);
}

class WebMediaResolver extends StatefulWidget {
  final String url;
  final String matchVideoUrl;
  final void Function(WebVideo matched)? onMatched;
  const WebMediaResolver(
      {super.key,
      required this.url,
      required this.matchVideoUrl,
      this.onMatched});

  @override
  State<StatefulWidget> createState() {
    return WebMediaResolverState();
  }
}

class WebMediaResolverState extends State<WebMediaResolver> {
  InAppWebViewController? _controller;

  Uri? _uri;
  late RegExp _matchVideoUrlRegExp;

  @override
  void initState() {
    super.initState();
    _uri = Uri.tryParse(widget.url);
    _matchVideoUrlRegExp = RegExp(widget.matchVideoUrl);
    _loadRequest();
  }

  @override
  void didUpdateWidget(WebMediaResolver oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _uri = Uri.tryParse(widget.url);
      _loadRequest();
    }
    if (oldWidget.matchVideoUrl != widget.matchVideoUrl) {
      _matchVideoUrlRegExp = RegExp(widget.matchVideoUrl);
    }
  }

  FutureOr<void> _loadRequest() {
    if (_uri != null) {
      return _controller?.loadUrl(
          urlRequest: URLRequest(url: _uri, headers: headers));
    }
  }

  bool _handleUrl(String url) {
    if (_matchVideoUrlRegExp.hasMatch(url)) {
      widget.onMatched?.call(WebVideo(url, {
        ...headers,
        "Sec-Ch-Ua-Mobile": "?0",
        "Sec-Ch-Ua-Platform": "macOS",
        "Sec-Fetch-Dest": "video",
        "Sec-Fetch-Mode": "no-cors",
        "Sec-Fetch-Site": "cross-site",
      }));
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: _uri, headers: headers),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
            useShouldInterceptAjaxRequest: true,
            useShouldInterceptFetchRequest: true),
        android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
            domStorageEnabled: true,
            useShouldInterceptRequest: true,
            mixedContentMode:
                AndroidMixedContentMode.MIXED_CONTENT_COMPATIBILITY_MODE),
      ),
      onWebViewCreated: (controller) {
        _controller = controller;
      },
      shouldInterceptAjaxRequest: (controller, ajaxRequest) async {
        if (_handleUrl(ajaxRequest.url.toString())) {
          return AjaxRequest.fromMap(ajaxRequest.toMap())
            ?..action = AjaxRequestAction.ABORT;
        }
        return null;
      },
      shouldInterceptFetchRequest: (controller, fetchRequest) async {
        if (_handleUrl(fetchRequest.url.toString())) {
          return FetchRequest.fromMap(fetchRequest.toMap())
            ?..action = FetchRequestAction.ABORT;
        }
        return null;
      },
      androidShouldInterceptRequest: (controller, request) async {
        if (_handleUrl(request.url.toString())) {
          return WebResourceResponse(
              contentType: "text/plain",
              data: Uint8List.fromList(utf8.encode("Internal Server Error")),
              statusCode: 500);
        }
        return null;
      },
    );
  }
}
