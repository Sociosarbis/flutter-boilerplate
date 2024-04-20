import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/center_scroll.dart';

class CenterScrollDemo extends StatefulWidget {
  const CenterScrollDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return CenterScrollDemoState();
  }
}

class CenterScrollDemoState extends State<CenterScrollDemo> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CenterScroll(
        child: SizedBox(
            height: expanded ? 10000 : 300,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ListTile(
                          title: Text('标题'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(expanded ? '收回' : '展开'),
                              onPressed: () {
                                setState(() {
                                  expanded = !expanded;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))),
      ),
    ));
  }
}
