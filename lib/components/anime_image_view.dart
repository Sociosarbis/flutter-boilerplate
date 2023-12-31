import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';

class AnimeImageView extends StatelessWidget {
  final double width;
  final String? src;
  final int attention;
  final String? title;
  final void Function()? onTap;
  const AnimeImageView(this.src,
      {this.attention = 0,
      required this.width,
      this.title,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final mask = InkWell(
        highlightColor: theme.bgm.selectableItemBackground,
        splashFactory: InkSparkle.splashFactory,
        splashColor: theme.bgm.selectableItemBackground,
        onTap: () {
          onTap?.call();
        },
        child: Stack(
          children: [
            SizedBox.expand(
                child: DecoratedBox(
                    decoration:
                        BoxDecoration(gradient: theme.bgm.shapeOverMask))),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$attention人关注",
                        style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.onPrimary),
                      ),
                      if (title != null) ...[
                        const SizedBox(
                          height: 8,
                        ),
                        Text("$title",
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colors.onPrimary)),
                      ]
                    ],
                  ),
                )),
          ],
        ));
    return Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: theme.bgm.imageCornerSmall,
        child: src != null
            ? Ink.image(
                image: CachedNetworkImageProvider(src!),
                width: width,
                height: double.infinity,
                fit: BoxFit.cover,
                child: mask)
            : Ink(width: width, height: double.infinity, child: mask));
  }
}
