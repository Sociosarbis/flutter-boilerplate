import 'dart:isolate';
import 'dart:ffi';

class RustStreamReceiver {
  static RustStreamReceiver shared = RustStreamReceiver._internal();
  late RawReceivePort _ffiPort;

  int get port => _ffiPort.sendPort.nativePort;

  RustStreamReceiver._internal() {
    _ffiPort = RawReceivePort();
  }
}