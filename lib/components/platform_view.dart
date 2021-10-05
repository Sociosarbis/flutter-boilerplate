import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AndroidPlatformView extends StatelessWidget {
  final String viewType;
  final Map<String, dynamic> creationParams;
  final void Function(int)? onPlatformViewCreated;
  const AndroidPlatformView(
      {this.viewType = '<platform-view-type>',
      this.onPlatformViewCreated,
      this.creationParams = const <String, dynamic>{},
      Key? key})
      : super(key: key);
  @override
  Widget build(context) {
    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      onPlatformViewCreated: onPlatformViewCreated,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
