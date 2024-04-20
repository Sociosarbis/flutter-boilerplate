import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderCenterIntrinsicHeight extends RenderAligningShiftedBox {
  double containerHeight;
  RenderCenterIntrinsicHeight(
      {required super.textDirection, required this.containerHeight});

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (child != null) {
      if (!constraints.hasTightHeight) {
        final height = child!.getMaxIntrinsicHeight(constraints.maxWidth);
        if (containerHeight >= height) {
          return Size(constraints.maxWidth, containerHeight);
        }
      }
      return ChildLayoutHelper.dryLayoutChild(child!, constraints);
    } else {
      return constraints.smallest;
    }
  }

  @override
  void performLayout() {
    if (child != null) {
      if (!constraints.hasTightHeight) {
        final height = child!.getMaxIntrinsicHeight(constraints.maxWidth);
        if (containerHeight >= height) {
          child!.layout(
              constraints
                  .widthConstraints()
                  .copyWith(maxHeight: containerHeight),
              parentUsesSize: true);
          size = Size(constraints.maxWidth, containerHeight);
          alignChild();
          return;
        }
      }
      final BoxParentData childParentData = child!.parentData! as BoxParentData;
      childParentData.offset = Offset.zero;
      size = ChildLayoutHelper.layoutChild(child!, constraints);
    } else {
      size = constraints.smallest;
    }
  }
}

class CenterIntrinsicHeight extends SingleChildRenderObjectWidget {
  final double containerHeight;
  const CenterIntrinsicHeight(
      {super.key, required this.containerHeight, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCenterIntrinsicHeight(
        textDirection: TextDirection.ltr, containerHeight: containerHeight);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCenterIntrinsicHeight renderObject) {
    renderObject.containerHeight = containerHeight;
  }
}

class CenterScroll extends StatelessWidget {
  final Widget? child;
  const CenterScroll({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return const SizedBox.shrink();
    }
    return LayoutBuilder(builder: ((context, constraints) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: CenterIntrinsicHeight(
          containerHeight: constraints.maxHeight,
          child: child,
        ),
      );
    }));
  }
}
