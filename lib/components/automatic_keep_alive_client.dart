import 'package:flutter/widgets.dart';

class AutomaticKeepAliveClient extends StatefulWidget {
  final bool keepAlive;
  final Widget child;

  const AutomaticKeepAliveClient(
      {required this.keepAlive, required this.child, super.key});

  @override
  _AutomacitKeepAliveClientState createState() =>
      _AutomacitKeepAliveClientState();
}

class _AutomacitKeepAliveClientState extends State<AutomaticKeepAliveClient>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant AutomaticKeepAliveClient oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keepAlive != wantKeepAlive) {
      updateKeepAlive();
    }
  }

  @override
  Widget build(context) {
    super.build(context);
    return widget.child;
  }
}
