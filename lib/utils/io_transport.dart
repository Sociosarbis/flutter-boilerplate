import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/io_client.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'web_streams.dart';
import 'package:flutter_boilerplate/env.dart';

const _contentTypeKey = 'content-type';

/// All accepted content-type header's prefix.
const _validContentTypePrefix = [
  'application/grpc',
  'application/json+protobuf',
  'application/x-protobuf'
];

class IOTransportStream implements GrpcTransportStream {
  final StreamedRequest _request;
  StreamedResponse _response;
  String _responseText = '';
  final IOClient _client = IOClient();
  final ErrorHandler _onError;
  final Function(IOTransportStream stream) _onDone;
  final StreamController<ByteBuffer> _incomingProcessor = StreamController();
  final StreamController<GrpcMessage> _incomingMessages = StreamController();
  final StreamController<List<int>> _outgoingMessages = StreamController();
  @override
  Stream<GrpcMessage> get incomingMessages => _incomingMessages.stream;

  @override
  StreamSink<List<int>> get outgoingMessages => _outgoingMessages.sink;

  IOTransportStream(this._request,
      {@required ErrorHandler onError, @required onDone})
      : _onError = onError,
        _onDone = onDone {
    _outgoingMessages.stream.map(frame).map((chunk) => env.isProd ? base64.encode(chunk).codeUnits : chunk)
      .listen(_request.sink.add, cancelOnError: true, onDone: () {
      _request.sink.close();
    });

    _client
        .send(_request)
        .then((res) {
      if (_incomingProcessor.isClosed) {
        return;
      }

      _response = res;
      _onHeadersReceived();
      _response.stream.listen((value) {
        _responseText += String.fromCharCodes(value);
        if (_response.statusCode == 200) {
          final bytes = Uint8List.fromList(value).buffer;
          _incomingProcessor.add(bytes);
        }
      }, onDone: () {
        _onRequestDone();
        _close();
      }, cancelOnError: true);
    }).catchError((error) {
      if (_incomingProcessor.isClosed) {
        return;
      }
      _onError(GrpcError.unavailable('XhrConnection connection-error'),
          StackTrace.current);
      terminate();
    });

    _incomingProcessor.stream
        .transform(GrpcWebDecoder())
        .transform(grpcDecompressor())
        .listen(_incomingMessages.add,
            onError: _onError, onDone: _incomingMessages.close);
  }

  bool _checkContentType(String contentType) {
    return _validContentTypePrefix.any(contentType.startsWith);
  }

  void _onHeadersReceived() {
    // Force a metadata message with headers.
    final headers = GrpcMetadata(_response.headers);
    _incomingMessages.add(headers);
  }

  void _onRequestDone() async {
    final contentType = _response.headers[_contentTypeKey];
    if (_response.statusCode != 200) {
      _onError(
          GrpcError.unavailable('XhrConnection status ${_response.statusCode}',
              null, _responseText),
          StackTrace.current);
      return;
    }
    if (contentType == null) {
      _onError(
          GrpcError.unavailable('XhrConnection missing Content-Type', null,
              _responseText),
          StackTrace.current);
      return;
    }
    if (!_checkContentType(contentType)) {
      _onError(
          GrpcError.unavailable('XhrConnection bad Content-Type $contentType',
              null, _responseText),
          StackTrace.current);
      return;
    }
    if (_response == null) {
      _onError(
          GrpcError.unavailable(
              'XhrConnection request null response', null, ''),
          StackTrace.current);
      return;
    }
  }

  void _close() {
    _incomingProcessor.close();
    _outgoingMessages.close();
    _onDone(this);
  }

  @override
  Future<void> terminate() async {
    _close();
    _client.close();
  }
}

MapEntry<String, String> _getContentTypeHeader(Map<String, String> metadata) {
  for (var entry in metadata.entries) {
    if (entry.key.toLowerCase() == _contentTypeKey.toLowerCase()) {
      return entry;
    }
  }
  return null;
}

class IOClientConnection extends ClientConnection {
  final Uri uri;
  final _requests = <IOTransportStream>{};

  @override
  String get authority => uri.authority;

  @override
  String get scheme => uri.scheme;

  IOClientConnection(this.uri);

  @visibleForTesting
  StreamedRequest createHttpRequest() => StreamedRequest('POST', uri);

  void _initializeRequest(
      StreamedRequest request, Map<String, String> metadata) {
    for (final header in metadata.keys) {
      request.headers[header] = metadata[header];
    }
  }

  @override
  GrpcTransportStream makeRequest(String path, Duration timeout,
      Map<String, String> metadata, ErrorHandler onError,
      {CallOptions callOptions}) {
    // gRPC-web headers.
    if (_getContentTypeHeader(metadata) == null) {
      metadata['Content-Type'] = env.isProd ? 'text/plain' : 'application/grpc-web+proto';
      metadata['X-User-Agent'] = 'grpc-web-dart/0.1';
      metadata['X-Grpc-Web'] = '1';
    }

    metadata['X-Grpc-Method'] = path;

    final request = createHttpRequest();
    // Must set headers after calling open().
    _initializeRequest(request, metadata);

    final transportStream =
        IOTransportStream(request, onError: onError, onDone: _removeStream);
    _requests.add(transportStream);
    return transportStream;
  }

  @override
  Future<void> terminate() async {
    for (var request in List.of(_requests)) {
      request.terminate();
    }
  }

  @override
  void dispatchCall(ClientCall call) {
    call.onConnectionReady(this);
  }

  @override
  Future<void> shutdown() async {}

  void _removeStream(IOTransportStream stream) {
    _requests.remove(stream);
  }
}

class GrpcIOClientChannel extends ClientChannelBase {
  final Uri uri;

  GrpcIOClientChannel(this.uri) : super();

  @override
  ClientConnection createConnection() {
    return IOClientConnection(uri);
  }
}
