import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class Main extends StatefulWidget {
  final void Function(Map<String, String> cookies) onLogin;
  Main({@required this.onLogin});
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String _url = 'https://bgm.tv/login';
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: _url,
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: true,
      onWebViewCreated: (controller) {
        _controller.complete(controller);
      },
      navigationDelegate: (request) async {
        final cookies = (await WebviewCookieManager().getCookies(_url))
            .fold<Map<String, String>>(Map<String, String>(), (acc, item) {
          acc[item.name] = item.value;
          return acc;
        });
        if (cookies['chii_auth'] != null) {
          widget.onLogin(cookies);
        }
        return NavigationDecision.prevent;
      },
      gestureRecognizers: Set()
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
    );
  }
}
