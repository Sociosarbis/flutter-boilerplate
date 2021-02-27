import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/stores/user.dart';
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
  String userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68';
  @override
  Widget build(BuildContext context) {
    return Consumer<UserStore>(
        builder: (context, userStore, child) => WebView(
              initialUrl: _url,
              userAgent: userAgent,
              javascriptMode: JavascriptMode.unrestricted,
              debuggingEnabled: true,
              onWebViewCreated: (controller) {
                _controller.complete(controller);
              },
              navigationDelegate: (request) async {
                final cookies = (await WebviewCookieManager().getCookies(_url))
                    .fold<Map<String, String>>(Map<String, String>(),
                        (acc, item) {
                  acc[item.name] = item.value;
                  return acc;
                });
                userStore.setCookie(cookies);
                return NavigationDecision.prevent;
              },
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
            ));
  }
}
