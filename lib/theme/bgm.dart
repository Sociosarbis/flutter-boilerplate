import 'package:flutter/material.dart';

class BgmThemeExtension extends ThemeExtension<BgmThemeExtension> {
  final BorderRadius imageCornerSmall;
  final LinearGradient shapeOverMask;
  final Color selectableItemBackground;
  final Color mdThemeLightSurface;
  final Color mdThemeLightPrimary;

  const BgmThemeExtension(
      {this.shapeOverMask = const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color.fromARGB(204, 0, 0, 0), Color.fromARGB(51, 0, 0, 0)]),
      this.imageCornerSmall = const BorderRadius.all(Radius.circular(4)),
      this.selectableItemBackground = const Color(0x0e010103),
      this.mdThemeLightSurface = const Color(0xffFFFBFF),
      this.mdThemeLightPrimary = const Color(0xffA23760)});

  Color get colorSurface {
    return mdThemeLightSurface;
  }

  Color get primary {
    return mdThemeLightPrimary;
  }

  @override
  ThemeExtension<BgmThemeExtension> copyWith(
      {BorderRadius? imageCornerSmall, LinearGradient? shapeOverMask}) {
    return BgmThemeExtension(
        imageCornerSmall: imageCornerSmall ?? this.imageCornerSmall,
        shapeOverMask: shapeOverMask ?? this.shapeOverMask);
  }

  @override
  ThemeExtension<BgmThemeExtension> lerp(
      covariant ThemeExtension<BgmThemeExtension>? other, double t) {
    if (other is! BgmThemeExtension) {
      return this;
    }
    return BgmThemeExtension(
        imageCornerSmall:
            BorderRadius.lerp(imageCornerSmall, other.imageCornerSmall, t) ??
                imageCornerSmall,
        shapeOverMask:
            LinearGradient.lerp(shapeOverMask, other.shapeOverMask, t) ??
                shapeOverMask);
  }
}

extension BgmThemeData on ThemeData {
  BgmThemeExtension get bgm =>
      extension<BgmThemeExtension>() ?? const BgmThemeExtension();
}
