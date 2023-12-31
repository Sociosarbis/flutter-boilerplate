import 'package:flutter/widgets.dart';

class AndroidStretchScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
        axisDirection: details.direction, child: child);
  }
}
