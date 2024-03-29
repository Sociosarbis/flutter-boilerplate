// Copyright (c) 2019, the gRPC project authors. Please see the AUTHORS file
// for details. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';

enum _GrpcWebParseState { Init, Length, Message }

class GrpcMessageSink extends Sink<GrpcMessage> {
  GrpcMessage? message;
  bool _messageReceived = false;

  @override
  void add(GrpcMessage data) {
    if (_messageReceived) {
      throw StateError('Too many messages received!');
    }
    message = data;
    _messageReceived = true;
  }

  @override
  void close() {
    if (!_messageReceived) {
      throw StateError('No messages received!');
    }
  }
}

class GrpcWebDecoder extends Converter<ByteBuffer, GrpcMessage> {
  @override
  GrpcMessage convert(ByteBuffer input) {
    final sink = GrpcMessageSink();
    startChunkedConversion(sink)
      ..add(input)
      ..close();
    return sink.message!;
  }

  @override
  Sink<ByteBuffer> startChunkedConversion(Sink<GrpcMessage> sink) {
    return _GrpcWebConversionSink(sink);
  }
}

class _GrpcWebConversionSink implements ChunkedConversionSink<ByteBuffer> {
  static const int frameTypeData = 0x00;
  static const int frameTypeTrailers = 0x80;

  final Sink<GrpcMessage> _out;

  final _dataHeader = Uint8List(4);

  _GrpcWebParseState _state = _GrpcWebParseState.Init;
  var _chunkOffset = 0;
  int? _frameType;
  var _dataOffset = 0;
  Uint8List? _data;

  _GrpcWebConversionSink(this._out);

  int _parseFrameType(List<int> chunkData) {
    final frameType = chunkData[_chunkOffset];
    _chunkOffset++;
    if (frameType != frameTypeData && frameType != frameTypeTrailers) {
      throw GrpcError.unimplemented('Invalid frame type: $frameType');
    }
    _state = _GrpcWebParseState.Length;
    return frameType;
  }

  void _parseLength(List<int> chunkData) {
    final chunkLength = chunkData.length;

    final headerRemaining = _dataHeader.lengthInBytes - _dataOffset;
    final chunkRemaining = chunkLength - _chunkOffset;
    final toCopy = min(headerRemaining, chunkRemaining);
    _dataHeader.setRange(
        _dataOffset, _dataOffset + toCopy, chunkData, _chunkOffset);
    _dataOffset += toCopy;
    _chunkOffset += toCopy;
    if (_dataOffset == _dataHeader.lengthInBytes) {
      final dataLength = _dataHeader.buffer.asByteData().getUint32(0);
      _dataOffset = 0;
      _state = _GrpcWebParseState.Message;
      _data = Uint8List(dataLength);
      if (dataLength == 0) {
        // empty message
        _finishMessage();
      }
    }
  }

  void _parseMessage(List<int> chunkData) {
    final dataRemaining = _data!.lengthInBytes - _dataOffset;
    if (dataRemaining > 0) {
      final chunkRemaining = chunkData.length - _chunkOffset;
      final toCopy = min(dataRemaining, chunkRemaining);
      _data
          !.setRange(_dataOffset, _dataOffset + toCopy, chunkData, _chunkOffset);
      _dataOffset += toCopy;
      _chunkOffset += toCopy;
    }
    if (_dataOffset == _data!.lengthInBytes) {
      _finishMessage();
    }
  }

  void _finishMessage() {
    switch (_frameType) {
      case frameTypeData:
        _out.add(GrpcData(_data!, isCompressed: false));
        break;
      case frameTypeTrailers:
        final stringData = String.fromCharCodes(_data!);
        final headers = _parseHttp1Headers(stringData);
        _out.add(GrpcMetadata(headers));
        break;
    }
    _state = _GrpcWebParseState.Init;
    _data = null;
    _dataOffset = 0;
  }

  Map<String, String> _parseHttp1Headers(String stringData) {
    final trimmed = stringData.trim();
    final chunks = trimmed == '' ? <String>[] : trimmed.split('\r\n');
    final headers = <String, String>{};
    for (final chunk in chunks) {
      final pos = chunk.indexOf(':');
      headers[chunk.substring(0, pos).trim()] = chunk.substring(pos + 1).trim();
    }
    return headers;
  }

  @override
  void add(ByteBuffer chunk) {
    _chunkOffset = 0;
    final chunkData = chunk.asUint8List();
    while (_chunkOffset < chunk.lengthInBytes) {
      switch (_state) {
        case _GrpcWebParseState.Init:
          _frameType = _parseFrameType(chunkData);
          break;
        case _GrpcWebParseState.Length:
          _parseLength(chunkData);
          break;
        case _GrpcWebParseState.Message:
          _parseMessage(chunkData);
          break;
      }
    }
    _chunkOffset = 0;
  }

  @override
  void close() {
    if (_data != null || _dataOffset != 0) {
      throw GrpcError.unavailable('Closed in non-idle state');
    }
    _out.close();
  }
}
