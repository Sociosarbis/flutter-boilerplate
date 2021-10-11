import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'platform_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VideoViewController {
  final MethodChannel _ch;
  VideoViewController(this._ch);
  Future<void> setUrl(String? url) {
    return _ch.invokeMethod("setUrl", url);
  }

  Future<void> play() {
    return _ch.invokeMethod("play");
  }

  void dispose() {
    _ch.setMethodCallHandler(null);
  }
}

class VideoView extends StatefulHookWidget {
  final String? url;
  final bool autoplay;
  VideoView({Key? key, this.url, this.autoplay = true}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoViewController? controller;
  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    handleChange();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    handleChange();
  }

  void handleChange() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (widget.url != null) {
        controller?.setUrl(widget.url).then((_) {
          if (widget.autoplay) {
            controller?.play();
          }
        });
      }
    });
  }

  @override
  Widget build(context) {
    useEffect(() {
      return () {
        controller?.dispose();
      };
    }, []);
    return Center(
        child: Stack(children: [
      AndroidPlatformView(
          viewType: 'native_video',
          onPlatformViewCreated: (id) {
            controller = VideoViewController(MethodChannel("native_video_$id"));
            handleChange();
          }),
      Positioned(
          bottom: 48,
          height: 5,
          left: 0,
          right: 0,
          child: LinearProgressIndicator(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
              color: Color.fromRGBO(255, 0, 0, 1),
              value: 0.5))
    ]));
  }
}
