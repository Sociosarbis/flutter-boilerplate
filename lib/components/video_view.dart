import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'platform_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'fade_out.dart';
import 'video_view/controls.dart';

class ProgressPayload {
  final int progress;
  final int duration;
  final MediaStatus status;
  const ProgressPayload(
      {this.progress = 0, this.duration = 0, this.status = MediaStatus.PAUSED});
  factory ProgressPayload.fromJson(Map<dynamic, dynamic> data) {
    return ProgressPayload(
        progress: data["progress"],
        duration: data["duration"],
        status: MediaStatus.values[data["status"]]);
  }
}

enum MediaStatus { PLAYING, PAUSED, LOADING }

class VideoViewController {
  final MethodChannel _ch;
  final void Function(ProgressPayload)? onProgress;
  final void Function()? onLoadStart;
  final void Function()? onLoadEnd;
  VideoViewController(this._ch,
      {this.onProgress, this.onLoadStart, this.onLoadEnd}) {
    this._ch.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'progress':
          onProgress?.call(ProgressPayload.fromJson(call.arguments));
          break;
        case 'loadStart':
          onLoadStart?.call();
          break;
        case 'loadEnd':
          onLoadEnd?.call();
      }
    });
  }
  Future<void> setUrl(String? url) {
    return _ch.invokeMethod("setUrl", url);
  }

  Future<void> play() {
    return _ch.invokeMethod("play");
  }

  Future<void> pause() {
    return _ch.invokeListMethod("pause");
  }

  Future<void> seek(int time) {
    return _ch.invokeMethod("seek", time);
  }

  void dispose() {
    _ch.setMethodCallHandler(null);
  }
}

class VideoContext {
  final double width;
  final double height;
  final double progress;
  final double duration;
  final MediaStatus status;
  final VideoViewController? controller;
  const VideoContext(
      {required this.width,
      required this.height,
      required this.status,
      required this.progress,
      required this.duration,
      this.controller});

  bool isEqual(VideoContext other) {
    return progress == other.progress &&
        width == other.width &&
        height == other.height &&
        duration == other.duration &&
        status == other.status &&
        controller == other.controller;
  }
}

class VideoView extends StatefulHookWidget {
  final String? url;
  final double width;
  final double height;
  final bool autoplay;
  VideoView(
      {Key? key,
      this.url,
      this.autoplay = true,
      required this.width,
      required this.height})
      : super(key: key);

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
    final progress = useState(0.0);
    final duration = useRef(0.0);
    final showControl = useState(false);
    final isLoading = useState(true);
    final status = useState(MediaStatus.PAUSED);

    return Listener(
        onPointerDown: (_) {
          showControl.value = true;
        },
        onPointerUp: (_) {
          showControl.value = false;
        },
        onPointerCancel: (_) {
          showControl.value = false;
        },
        child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Stack(
              children: [
                AndroidPlatformView(
                    viewType: 'native_video',
                    onPlatformViewCreated: (id) {
                      controller =
                          VideoViewController(MethodChannel("native_video_$id"),
                              onProgress: (payload) {
                        if (payload.duration == 0)
                          progress.value = 0;
                        else
                          progress.value = payload.progress.toDouble() /
                              payload.duration.toDouble();
                        status.value = payload.status;
                        duration.value = payload.duration.toDouble();
                      }, onLoadStart: () {
                        isLoading.value = true;
                      }, onLoadEnd: () {
                        isLoading.value = false;
                      });
                      handleChange();
                    }),
                if (isLoading.value)
                  Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.grey))),
                FadeOut(
                    isEnter: showControl.value,
                    isLock: status.value == MediaStatus.PAUSED,
                    builder: (_, isEnter) {
                      return Provider.value(
                          value: VideoContext(
                              width: widget.width,
                              height: widget.height,
                              status: status.value,
                              progress: progress.value,
                              duration: duration.value,
                              controller: controller),
                          updateShouldNotify:
                              (VideoContext value, VideoContext oldValue) =>
                                  !value.isEqual(oldValue),
                          child: VideoControls(visible: isEnter));
                    })
              ],
            )));
  }
}
