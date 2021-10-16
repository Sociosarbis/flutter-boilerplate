import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'platform_view.dart';
import 'transition.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/utils/hooks/useLifeStyle.dart';
import 'package:flutter_boilerplate/utils/DelayTask.dart';
import 'package:flutter_boilerplate/components/circle.dart';

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
  VideoViewController(this._ch, {this.onProgress}) {
    this._ch.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'progress':
          onProgress?.call(ProgressPayload.fromJson(call.arguments));
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
    final progressNeedTo = useState(0.0);
    final isDragging = useState(false);
    final showControl = useState(false);
    final status = useState(MediaStatus.PAUSED);
    final delayTask = useLifeStyle(() {
      return DelayTask(1000);
    }, (DelayTask task) {
      task.cancel();
    });
    return Listener(
        onPointerDown: (_) {
          delayTask?.cancel();
          showControl.value = true;
        },
        onPointerUp: (_) {
          delayTask?.run(() {
            showControl.value = false;
          });
        },
        onPointerCancel: (_) {
          delayTask?.run(() {
            showControl.value = false;
          });
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
                        if (!isDragging.value) {
                          progressNeedTo.value = progress.value;
                        }
                        if (duration.value == 0) {
                          controller?.seek(
                              (progressNeedTo.value * payload.duration)
                                  .toInt());
                        }
                        status.value = payload.status;
                        duration.value = payload.duration.toDouble();
                      });
                      handleChange();
                    }),
                Transition(
                    isEnter: showControl.value,
                    enterDuration: 100,
                    builder: (_, value) {
                      return Opacity(
                          opacity: value,
                          child: Stack(children: [
                            IgnorePointer(
                                ignoring: !showControl.value,
                                child: Center(
                                    child: AnimatedCrossFade(
                                  firstChild: IconButton(
                                      iconSize: 36,
                                      icon: Icon(Icons.play_circle,
                                          color: Colors.white),
                                      onPressed: () {
                                        controller?.play();
                                      }),
                                  secondChild: IconButton(
                                      iconSize: 36,
                                      icon: Icon(Icons.pause_circle,
                                          color: Colors.white),
                                      onPressed: () {
                                        controller?.pause();
                                      }),
                                  crossFadeState:
                                      status.value == MediaStatus.PAUSED
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 500),
                                ))),
                            Positioned(
                                bottom: 0.237 * widget.height,
                                height: 20,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                    onHorizontalDragStart: (details) {
                                      isDragging.value = true;
                                      progressNeedTo.value =
                                          (details.localPosition.dx /
                                                  widget.width)
                                              .clamp(0, 1);
                                    },
                                    onHorizontalDragUpdate: (details) {
                                      progressNeedTo.value =
                                          (details.localPosition.dx /
                                                  widget.width)
                                              .clamp(0, 1);
                                    },
                                    onHorizontalDragCancel: () {
                                      isDragging.value = false;
                                      controller?.seek((progressNeedTo.value *
                                              duration.value)
                                          .toInt());
                                    },
                                    onHorizontalDragEnd: (_) {
                                      isDragging.value = false;
                                      controller?.seek((progressNeedTo.value *
                                              duration.value)
                                          .toInt());
                                    },
                                    child: ColoredBox(
                                        color: Colors.transparent,
                                        child: Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Positioned(
                                                  height: 3,
                                                  left: 0,
                                                  right: 0,
                                                  child:
                                                      LinearProgressIndicator(
                                                          backgroundColor:
                                                              Color.fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  0.2),
                                                          color: Color.fromRGBO(
                                                              255, 0, 0, 1),
                                                          value:
                                                              progress.value)),
                                              Align(
                                                  alignment: Alignment(
                                                      -1 +
                                                          2 *
                                                              progressNeedTo
                                                                  .value,
                                                      0.0),
                                                  child: Transition(
                                                      enterDuration: 100,
                                                      leaveDuration: 100,
                                                      isEnter: isDragging.value,
                                                      builder: (_, value) {
                                                        return Transform.scale(
                                                            scale:
                                                                0.5 * value + 1,
                                                            child: SizedBox(
                                                                width: 8,
                                                                height: 8,
                                                                child: Circle(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            1))));
                                                      }))
                                            ]))))
                          ]));
                    })
              ],
            )));
  }
}
