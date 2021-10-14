import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/components/video_view.dart';

class VideoPage extends HookWidget {
  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: SizedBox(
                    width: width,
                    height: width * 9 / 16,
                    child: VideoView(
                        width: width,
                        url:
                            'https://vod6.wenshibaowenbei.com/20211004/Bqj0r94L/index.m3u8')))));
  }
}
