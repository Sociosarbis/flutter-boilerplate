import 'dart:math';

import 'package:collection/collection.dart';

String formatDateTime(DateTime dateTime) {
  return dateTime.toIso8601String().replaceFirst(RegExp(r"\.\d+$"), "");
}

class Msg {
  final time = DateTime.now().millisecondsSinceEpoch;
  final Object? payload;
  Msg(this.payload);

  bool isEqual(Msg other) {
    return false;
  }

  Map<String, Object?> toJson() {
    return {
      "time": formatDateTime(DateTime.fromMillisecondsSinceEpoch(time)),
      "payload": payload
    };
  }
}

typedef Item = ({String tag, Msg msg});

class RemoteLogger {
  final _lastMsgs = <String, Msg>{};
  final int maxSize;
  final int batchSize;
  final int uploadInterval;
  final int maxBackOffSeconds;
  late final QueueList<Item> _uploadQueue;
  final Future<void> Function(List<Map<String, Object?>> msgs) upload;
  var _backOffSeconds = 2;
  final _random = Random();
  Future<void>? _uploadFut;
  bool _disposed = false;
  RemoteLogger(this.upload,
      {this.maxSize = 1000, this.batchSize = 50, this.uploadInterval = 5000, this.maxBackOffSeconds = 32}) {
    _uploadQueue = QueueList(maxSize);
  }

  int get length {
    return _uploadQueue.length;
  }

  bool _updateLastMsg(String tag, Msg msg) {
    if (_lastMsgs[tag]?.isEqual(msg) ?? false) {
      return false;
    }
    _lastMsgs[tag] = msg;
    return true;
  }

  void add(String tag, Msg msg) {
    if (_disposed) {
      return;
    }
    if (_updateLastMsg(tag, msg)) {
      _uploadQueue.add((tag: tag, msg: msg));
      if (_uploadQueue.length > maxSize) {
        _uploadQueue.removeRange(0, _uploadQueue.length - maxSize);
      }
      _startUpload();
    }
  }

  void _startUpload() {
    if (_disposed || _uploadFut != null) {
      return;
    }
    _uploadFut = Future.value().then((_) async {
      final waitFut = Future.delayed(Duration(milliseconds: uploadInterval));
      if (_uploadQueue.isNotEmpty) {
        final count = min(_uploadQueue.length, batchSize);
        final items = _uploadQueue.sublist(0, count);
        if (items.isNotEmpty) {
          try {
            await upload(items.map((item) {
              return {"tag": item.tag, ...item.msg.toJson()};
            }).toList(growable: false));
          } catch (e) {
            if (_disposed) {
              return;
            }
            final waitFut = Future.delayed(Duration(seconds: _random.nextInt(_backOffSeconds)));
            _backOffSeconds = min(_backOffSeconds * 2, maxBackOffSeconds);
            return waitFut;
          }
          _uploadQueue.removeRange(0, count);
        }
      }
      _backOffSeconds = 2;
      return waitFut;
    })
      ..then((_) {
        _uploadFut = null;
        if (_uploadQueue.isNotEmpty) {
          _startUpload();
        }
      });
  }

  Item? elementAtOrNull(int index) {
    return _uploadQueue.elementAtOrNull(index);
  }

  void dispose() {
    _disposed = true;
  }
}
