import 'dart:isolate';
import 'dart:ffi';
import 'dart:async';
import 'dart:typed_data';

class RustStreamReceiver {
  static RustStreamReceiver shared = RustStreamReceiver._internal();
  late StreamController<Uint8List> _streamController;
  late StreamSubscription<Uint8List> _ffiSubscription;
  late RawReceivePort _ffiPort;

  int get port => _ffiPort.sendPort.nativePort;

  RustStreamReceiver._internal() {
    _ffiPort = RawReceivePort();
    _streamController = StreamController();
    _ffiPort.handler = _streamController.add;
    _ffiSubscription = _streamController.stream.listen(streamCallback);
  }

  void streamCallback(Uint8List bytes) {
    print(bytes);
  }

  Future<void> dispose() async {
    await _ffiSubscription.cancel();
    await _streamController.close();
    _ffiPort.close();
  }
}