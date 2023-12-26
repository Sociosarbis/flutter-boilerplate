import 'package:flutter/material.dart';

class AnimeImageView extends StatelessWidget {
  final String src;
  final int attention;
  final String? title;
  const AnimeImageView(this.src, {this.attention = 0, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
        width: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Image.network(src,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
            const SizedBox.expand(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                  Color.fromARGB(204, 0, 0, 0),
                  Color.fromARGB(51, 0, 0, 0)
                ])))),
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
                ))
          ],
        ));
  }
}
