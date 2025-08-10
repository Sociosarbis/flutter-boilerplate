import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class InfinitePage extends StatefulWidget {
  const InfinitePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return InfinitePageState();
  }
}

class InfinitePageState extends State<InfinitePage> {
  late final ScrollController _controller;
  late final Timer _timer;

  var paddingLeft = 10000.0;
  var paddingRight = 10000.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: 10000);
    final random = Random();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        paddingLeft += random.nextInt(100) - 50;
      });
     });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const key = ValueKey("bottom-list");
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        controller: _controller,
        center: key,
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList.builder(itemCount: 100, itemBuilder: (_, i) {
            return Text("$i");
          }),
          SliverList.builder(key: key, itemCount: 100, itemBuilder: (_, i) {
            return Text("$i");
          })
        ],
      ),
    ));
  }
}
