import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppOverlay {
  Future<T?> show<T>(
      {required NavigatorState state, required BuildContext context});
}

class AppDialogRoute<T> extends PopupRoute<T> {
  final RoutePageBuilder pageBuilder;
  final bool _barrierDismissible;
  final String? _barrierLabel;
  final Color _barrierColor;
  final Duration _transitionDuration;
  AppDialogRoute(
      {required this.pageBuilder,
      ImageFilter? filter,
      Color barrierColor = const Color(0x80000000),
      String? barrierLabel,
      bool barrierDismissible = true,
      Duration transitionDuration = const Duration(milliseconds: 200),
      RouteSettings? settings})
      : _barrierColor = barrierColor,
        _barrierLabel = barrierLabel,
        _transitionDuration = transitionDuration,
        _barrierDismissible = barrierDismissible,
        super(filter: filter, settings: settings);

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  Color get barrierColor => _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;

  @override
  Widget buildPage(context, animation, secondaryAnimation) =>
      pageBuilder(context, animation, secondaryAnimation);
}

class AppDialog extends AppOverlay {
  final Widget Function(void Function<T>([T]) pop) builder;
  final bool barrierDismissible = true;
  final Color? barrierColor;
  final bool useSafeArea = true;
  final bool useRootNavigator = true;
  final RouteSettings? routeSettings;
  AppDialog({required this.builder, this.barrierColor, this.routeSettings});

  @override
  Future<T?> show<T>(
      {required NavigatorState state, required BuildContext context}) async {
    return await Future.delayed(
        Duration.zero,
        () => state.push<T>(
              AppDialogRoute(
                  pageBuilder: (buildContext, animation, secondaryAnimation) {
                    return builder(state.pop);
                  },
                  barrierDismissible: barrierDismissible,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  settings: routeSettings,
                  barrierColor: barrierColor ?? Colors.black54),
            ));
  }
}
