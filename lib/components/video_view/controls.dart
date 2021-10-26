import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/circle.dart';
import 'package:flutter_boilerplate/components/transition.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_boilerplate/components/video_view.dart';
import 'package:flutter_boilerplate/utils/hooks/useProviderContext.dart';
import 'package:flutter_boilerplate/utils/hooks/usePreviousEffect.dart';

class VideoControls extends HookWidget {
  final bool visible;
  const VideoControls({Key? key, this.visible = false}) : super(key: key);
  @override
  Widget build(context) {
    final progressNeedTo = useState(0.0);
    final isDragging = useState(false);
    final videoContext = useProviderContext<VideoContext>(true);
    usePreviousEffect((oldDeps) {
      if (!isDragging.value) {
        progressNeedTo.value = videoContext.progress;
      }
      if (oldDeps?[1] == 0) {
        videoContext.controller
            ?.seek((progressNeedTo.value * videoContext.duration).toInt());
      }
      return () {};
    }, [videoContext.progress, videoContext.duration]);
    return Stack(children: [
      IgnorePointer(
          ignoring: !visible,
          child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              alignment: Alignment.center,
              child: AnimatedCrossFade(
                firstChild: IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.play_circle, color: Colors.white),
                    onPressed: () {
                      videoContext.controller?.play();
                    }),
                secondChild: IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.pause_circle, color: Colors.white),
                    onPressed: () {
                      videoContext.controller?.pause();
                    }),
                crossFadeState: videoContext.status == MediaStatus.PAUSED
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500),
              ))),
      Positioned(
          bottom: 0.237 * videoContext.height,
          height: 20,
          left: 0,
          right: 0,
          child: GestureDetector(
              onHorizontalDragStart: (details) {
                isDragging.value = true;
                progressNeedTo.value =
                    (details.localPosition.dx / videoContext.width).clamp(0, 1);
              },
              onHorizontalDragUpdate: (details) {
                progressNeedTo.value =
                    (details.localPosition.dx / videoContext.width).clamp(0, 1);
              },
              onHorizontalDragCancel: () {
                isDragging.value = false;
                videoContext.controller?.seek(
                    (progressNeedTo.value * videoContext.duration).toInt());
              },
              onHorizontalDragEnd: (_) {
                isDragging.value = false;
                videoContext.controller?.seek(
                    (progressNeedTo.value * videoContext.duration).toInt());
              },
              child: ColoredBox(
                  color: Colors.transparent,
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Positioned(
                        height: 3,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
                            color: Color.fromRGBO(255, 0, 0, 1),
                            value: videoContext.progress)),
                    Align(
                        alignment:
                            Alignment(-1 + 2 * progressNeedTo.value, 0.0),
                        child: Transition(
                            enterDuration: 100,
                            leaveDuration: 100,
                            isEnter: isDragging.value,
                            builder: (_, value) {
                              return Transform.scale(
                                  scale: 0.5 * value + 1,
                                  child: SizedBox(
                                      width: 8,
                                      height: 8,
                                      child: Circle(
                                          color:
                                              Color.fromRGBO(255, 0, 0, 1))));
                            }))
                  ]))))
    ]);
  }
}
