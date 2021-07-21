import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_boilerplate/stores/user.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks.dart';
import '../../../stores/user.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

const String url = 'https://bgm.tv/login';
const String userAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68';

const int TRIGGER_THRESHOLD = 20;
const String listenScrollToBoundJS = """
{
  let touchStartY = 0
  document.addEventListener('touchstart', (e) => {
    touchStartY = e.touches[0].clientY
  })
  document.addEventListener('touchmove', (e) => {
    const touchDelta = e.touches[0].clientY - touchStartY
    touchStartY = e.touches[0].clientY
    if ((document.documentElement.scrollTop <= $TRIGGER_THRESHOLD && touchDelta > 0) ||
      (touchDelta < 0 && document.documentElement.scrollTop + document.documentElement.clientHeight >= document.documentElement.scrollHeight - $TRIGGER_THRESHOLD)
    ) {
      window.flutterBridge.postMessage(JSON.stringify(touchDelta));
    }
  })
}
""";

class Main extends HookWidget {
  final void Function(Map<String, String> cookies) onLogin;
  final void Function(double offset) onScrollBound;
  Main({@required this.onLogin, this.onScrollBound});

  @override
  Widget build(BuildContext context) {
    final controller = useRef<WebViewController>(null);
    final userStore = useProviderContext<UserStore>(false);
    return WebView(
      initialUrl: url,
      userAgent: userAgent,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: Set()..add(JavascriptChannel(name: 'flutterBridge', onMessageReceived: (data) {
        final offset = double.tryParse(data.message);
        if (offset != null) {
          onScrollBound(offset);
        }
      })),
      debuggingEnabled: true,
      onWebViewCreated: (_controller) {
        controller.value = _controller;
        userStore.isLogining = true;
      },
      onPageStarted: (_) async {
        await controller.value.evaluateJavascript(listenScrollToBoundJS);
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
