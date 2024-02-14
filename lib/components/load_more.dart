import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/theme/bgm.dart';

class LoadMore extends StatefulWidget {
  const LoadMore({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoadMoreState();
  }
}

class LoadMoreState extends State<LoadMore> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgmTheme = Theme.of(context).extension<BgmThemeExtension>();
    return SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: Theme(
                      data: theme.copyWith(
                          progressIndicatorTheme: theme.progressIndicatorTheme
                              .copyWith(color: bgmTheme?.primary)),
                          child: const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          )),
                )),
            const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                  "加载中...",
                  style: TextStyle(fontSize: 14),
                ))
          ],
        ));
  }
}
