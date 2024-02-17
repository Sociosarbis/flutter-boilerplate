import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';

class HomeCardItem extends StatelessWidget {
  final double width;
  final String? src;
  final int attention;
  final String? title;
  final void Function()? onTap;
  const HomeCardItem(this.src,
      {super.key,
      required this.width,
      this.onTap,
      this.attention = 0,
      this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return SizedBox(
        width: width,
        child: AnimeImageView(
          src,
          onTap: onTap,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$attention人关注",
                      style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold, color: colors.onPrimary),
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
        ));
  }
}

class MediaPageItem extends StatelessWidget {
  final String? src;
  final String date;
  final double score;
  final int rank;
  final String title;
  const MediaPageItem(this.src,
      {super.key,
      this.score = 0,
      this.rank = 0,
      required this.title,
      required this.date});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth * 4 / 3,
                    child: AnimeImageView(
                      src,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.only(
                                left: 6, right: 24, bottom: 6),
                            child: Text(
                              date,
                              style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colors.onPrimary),
                            ),
                          ),
                          Positioned(
                              top: 6,
                              child: Opacity(
                                  opacity: 0.9,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: theme.bgm.primary,
                                        borderRadius: BorderRadius.only(
                                            topRight: theme.bgm.uiLayoutRadius,
                                            bottomRight:
                                                theme.bgm.uiLayoutRadius)),
                                    child: Text(
                                      "No.$rank",
                                      style: textTheme.labelSmall
                                          ?.copyWith(color: colors.onPrimary),
                                    ),
                                  ))),
                          Positioned(
                              top: 6,
                              right: 6,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 16,
                                    color: Color(0xffFFC107),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "$score",
                                    style: textTheme.labelSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colors.onPrimary),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ));
              }),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  title,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                      color: colors.onSurface, fontWeight: FontWeight.bold),
                ),
              )
            ]));
  }
}

class AnimeImageView extends StatelessWidget {
  final String? src;
  final Widget? child;
  final void Function()? onTap;
  const AnimeImageView(this.src, {this.onTap, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            if (child != null) child!,
          ],
        ));
    return Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: theme.bgm.imageCornerSmall,
            child: src != null
                ? Ink.image(
                    image: CachedNetworkImageProvider(src!),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    child: mask)
                : Ink(
                    width: double.infinity,
                    height: double.infinity,
                    child: mask))
        .animate()
        .scaleXY(
            begin: 0.5,
            end: 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
  }
}
