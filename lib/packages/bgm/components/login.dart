import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:flutter_boilerplate/stores/user.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../stores/user.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

const String url = 'https://bgm.tv/login';
const String userAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68';

class Main extends HookWidget {
  final void Function(Map<String, String> cookies) onLogin;
  Main({@required this.onLogin});

  @override
  Widget build(BuildContext context) {
    final controller = useRef<WebViewController>(null);
    final userStore = useUserStore(false);
    return WebView(
      initialUrl: url,
      userAgent: userAgent,
      javascriptMode: JavascriptMode.unrestricted,
      debuggingEnabled: true,
      onWebViewCreated: (_controller) {
        controller.value = _controller;
        userStore.isLogining = true;
      },
      onPageFinished: (_) {
        userStore.isLogining = false;
      },
      navigationDelegate: (request) async {
        userStore.isLogining = true;
        final cookies = (await WebviewCookieManager().getCookies(url))
            .fold<Map<String, String>>(Map<String, String>(), (acc, item) {
          acc[item.name] = item.value;
          return acc;
        });
        userStore.isLogining = false;
        userStore.setCookie(cookies);
        onLogin(cookies);
        return NavigationDecision.prevent;
      },
      gestureRecognizers: Set()
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
    );
  }
}
