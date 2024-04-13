import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BgmFlexibleSpaceBar extends StatefulWidget {
  final Widget? background;
  final CollapseMode collapseMode;
  final double collapseParallaxMultiplier;
  const BgmFlexibleSpaceBar(
      {super.key,
      this.background,
      this.collapseMode = CollapseMode.parallax,
      this.collapseParallaxMultiplier = 0.5});

  @override
  State<StatefulWidget> createState() {
    return BgmFlexibleSpaceBarState();
  }
}

class BgmFlexibleSpaceBarState extends State<BgmFlexibleSpaceBar> {
  double _getCollapsePadding(double t, FlexibleSpaceBarSettings settings) {
    switch (widget.collapseMode) {
      case CollapseMode.pin:
        return -(settings.maxExtent - settings.currentExtent);
      case CollapseMode.none:
        return 0.0;
      case CollapseMode.parallax:
        final double deltaExtent = settings.maxExtent - settings.minExtent;
        return -Tween<double>(begin: 0.0, end: deltaExtent).transform(t) *
            (1 - widget.collapseParallaxMultiplier);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.background == null) {
      return const SizedBox.shrink();
    }
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final deltaExtent = settings.maxExtent - settings.minExtent;

    // 0.0 -> Expanded
    // 1.0 -> Collapsed to toolbar
    final t = clampDouble(
        1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent,
        0.0,
        1.0);
    final double topPadding = _getCollapsePadding(t, settings);
    return Stack(
      children: [
        Positioned(
          top: topPadding,
          left: 0.0,
          right: 0.0,
          height: settings.maxExtent,
          child: widget.background!,
        )
      ],
    );
  }
}
