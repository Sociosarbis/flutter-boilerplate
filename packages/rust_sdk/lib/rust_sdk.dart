
import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:ffi/ffi.dart';
import 'rust_stream.dart';
import 'ffi.dart' as ffi;

class RustSdk {
  static const MethodChannel _channel =
      const MethodChannel('rust_sdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> init(Directory sdkDir) async {
    final port = RustStreamReceiver.shared.port;
    ffi.store_dart_post_cobject(NativeApi.postCObject);
    print(port);
    ffi.init_sdk(sdkDir.path.toNativeUtf8());
    ffi.set_stream_port(port);
  }
}
