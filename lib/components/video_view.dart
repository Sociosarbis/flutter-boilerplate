import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'platform_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VideoView extends StatefulHookWidget {
  final String? url;
  final bool autoplay;
  VideoView({Key? key, this.url, this.autoplay = true}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  MethodChannel? controller;
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
        controller?.invokeMethod("setUrl", widget.url).then((_) {
          if (widget.autoplay) {
            controller?.invokeMethod("play");
          }
        });
      }
    });
  }

  @override
  Widget build(context) {
    useEffect(() {
      return () {
        controller?.setMethodCallHandler(null);
      };
    }, []);
    return AndroidPlatformView(
      viewType: 'native_video',
      onPlatformViewCreated: (id) {
        controller = MethodChannel("native_video_$id");
        handleChange();
      }
    );
  }
}
