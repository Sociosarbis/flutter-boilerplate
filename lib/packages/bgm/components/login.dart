import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_boilerplate/stores/user.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

const String url = 'https://bgm.tv/login';
const String userAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36 Edg/88.0.705.68';

const int TRIGGER_THRESHOLD = 3;
const String listenScrollToBoundJS = """
{
  let touchStartY = 0
  let startTime = 0
  let triggerId = 0
  let touchDelta = 0
  let timeDelta = 0
  let moveCount = 0
  const triggerScrollBound = (isEnd) => {
    window.flutterBridge.postMessage(JSON.stringify([touchDelta, touchDelta / timeDelta, isEnd ? 1 : 0]));
  }

  document.addEventListener('scroll', (e) => {
    if (moveCount !== 0) {
      moveCount = moveCount > 0 ? moveCount - 1 : moveCount + 1;
    }
  })

  document.addEventListener('touchstart', (e) => {
    touchStartY = e.touches[0].clientY
    startTime = performance.now()
    moveCount = 0
  })

  document.addEventListener('touchmove', (e) => {
    touchDelta = e.touches[0].clientY - touchStartY
    timeDelta = performance.now() - startTime
    touchStartY = e.touches[0].clientY
    startTime = performance.now()
    moveCount += timeDelta > 0 ? 1 : -1;
    if (Math.abs(moveCount) > $TRIGGER_THRESHOLD) {
      triggerScrollBound(false)
    }
  })

  document.addEventListener('touchend', (e) => {
    if (moveCount > $TRIGGER_THRESHOLD) {
      triggerScrollBound(true)
    }
  })
}
""";

class Main extends HookWidget {
  final void Function(Map<String, String> cookies) onLogin;
  final void Function(List<double> touchDetails)? onScrollBound;
  const Main({Key? key, required this.onLogin, this.onScrollBound})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useState<WebViewController?>(null);
    final userStore = useProviderContext<UserStore>(false);
    useEffect(() {
      controller
          .value = WebViewController(onPermissionRequest: (request) async {
        return request.grant();
      })
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..addJavaScriptChannel('flutterBridge', onMessageReceived: (data) {
          try {
            List<double> touchDetails =
                (jsonDecode(data.message) as List).map((item) {
              return item is double ? item : (item as int).toDouble();
            }).toList();
            onScrollBound?.call((touchDetails));
          } catch (e) {
            print(e);
          }
        })
        ..setNavigationDelegate(NavigationDelegate(onPageStarted: (_) async {
          await controller.value?.runJavaScript(listenScrollToBoundJS);
        }, onPageFinished: (_) {
          userStore.isLogining = false;
        }, onNavigationRequest: (request) async {
          userStore.isLogining = true;
          final cookies = (await WebviewCookieManager().getCookies(url))
              .fold<Map<String, String>>({}, (acc, item) {
            acc[item.name] = item.value;
            return acc;
          });
          userStore.isLogining = false;
          userStore.setCookie(cookies);
          onLogin(cookies);
          return NavigationDecision.prevent;
        }))
        ..setUserAgent(userAgent)
        ..loadRequest(Uri.parse(url));
      if (controller.value!.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
      }
      userStore.isLogining = true;
      return;
    }, []);
    return controller.value != null
        ? WebViewWidget(controller: controller.value!, gestureRecognizers: {
            Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())
          })
        : const SizedBox.shrink();
  }
}
