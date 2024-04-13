import 'dart:math';

import 'package:flutter/material.dart';

class BgmAppBar extends StatefulWidget {
  final Widget? title;
  final double? scrimVisibleHeightTrigger;
  final List<Widget>? actions;
  const BgmAppBar(
      {super.key, this.title, this.scrimVisibleHeightTrigger, this.actions});

  @override
  State<StatefulWidget> createState() {
    return BgmAppBarState();
  }
}

class BgmAppBarState extends State<BgmAppBar> {
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).viewPadding.top;
    final theme = Theme.of(context);
    final ColorScheme(
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      onPrimary: onPrimary
    ) = theme.colorScheme;
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    double t = widget.scrimVisibleHeightTrigger == null
        ? 1
        : settings.currentExtent < widget.scrimVisibleHeightTrigger!
            ? 1 -
                max(settings.currentExtent - settings.minExtent, 0) /
                    (widget.scrimVisibleHeightTrigger! - settings.minExtent)
            : 0;
    final bgColor = t > 0 ? primaryContainer : Colors.transparent;
    return Material(
        color: bgColor,
        child: SizedBox(
            height: settings.minExtent,
            child: Padding(
                padding: EdgeInsets.only(top: top),
                child: Theme(
                    data: theme.copyWith(
                        iconTheme: theme.iconTheme.copyWith(
                            color: t == 1 ? onPrimary : onPrimaryContainer)),
                    child: DefaultTextStyle(
                        style: (theme.appBarTheme.titleTextStyle ??
                                theme.textTheme.titleLarge!)
                            .copyWith(color: onPrimary.withOpacity(t)),
                        child: NavigationToolbar(
                          middle: widget.title,
                          centerMiddle: false,
                          trailing: widget.actions?.isNotEmpty ?? false
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: widget.actions!)
                              : null,
                        ))))));
  }
}
