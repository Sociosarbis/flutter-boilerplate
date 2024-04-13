import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';

class SwipeToRefresh extends StatefulWidget {
  final Widget child;
  final bool initRefresh;
  final Future<void> Function() onRefresh;
  const SwipeToRefresh(
      {super.key,
      required this.child,
      required this.onRefresh,
      this.initRefresh = false});

  @override
  State<StatefulWidget> createState() {
    return SwipeToRefreshState();
  }
}

class SwipeToRefreshState extends State<SwipeToRefresh> {
  late final GlobalKey<RefreshIndicatorState> indicatorKey;

  late bool _isRefreshing;

  bool shouldTrigger = false;

  @override
  void initState() {
    super.initState();
    indicatorKey = GlobalKey();
    if (widget.initRefresh) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _refresh();
      });
    }
  }

  @override
  void didUpdateWidget(SwipeToRefresh oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initRefresh != oldWidget.initRefresh &&
        widget.initRefresh &&
        !_isRefreshing) {
      _refresh();
    }
  }

  bool isRefreshing() {
    return _isRefreshing;
  }

  void _refresh() {
    indicatorKey.currentState?.show();
  }

  @override
  Widget build(BuildContext context) {
    final bgmTheme = Theme.of(context).extension<BgmThemeExtension>();
    return RefreshIndicator.adaptive(
        key: indicatorKey,
        color: bgmTheme?.primary,
        backgroundColor: bgmTheme?.colorSurface,
        notificationPredicate: (notification) {
          if (notification case ScrollStartNotification(dragDetails: DragStartDetails details)) {
            final box = context.findRenderObject() as RenderBox?;
            if (box != null) {
              final boxPos = box.localToGlobal(Offset.zero);
              shouldTrigger = boxPos.dy <= details.globalPosition.dy;
            }
          }
          return shouldTrigger && notification.depth == 0;
        },
        child: widget.child,
        onRefresh: () async {
          _isRefreshing = true;
          try {
            await widget.onRefresh();
          } finally {
            _isRefreshing = false;
          }
        });
  }
}
