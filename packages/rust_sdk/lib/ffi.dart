// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

final dl = DynamicLibrary.open('libdart_ffi.so');

typedef _set_stream_port_C = Int32 Function(Int64 port);
typedef _set_stream_port_Dart = int Function(int port);

final _set_stream_port =
    dl.lookupFunction<_set_stream_port_C, _set_stream_port_Dart>(
        'set_stream_port');

int set_stream_port(int port) {
  return _set_stream_port(port);
}

typedef _store_dart_post_cobject_C = Void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr);

typedef _store_dart_post_cobject_Dart = void Function(
    Pointer<NativeFunction<Int8 Function(Int64, Pointer<Dart_CObject>)>> ptr);

final store_dart_post_cobject = dl.lookupFunction<_store_dart_post_cobject_C,
    _store_dart_post_cobject_Dart>("store_dart_post_cobject");

typedef _init_sdk_C = Int64 Function(Pointer<Utf8> path);
typedef _init_sdk_Dart = int Function(Pointer<Utf8> path);

final _init_sdk = dl.lookupFunction<_init_sdk_C, _init_sdk_Dart>("init_sdk");

int init_sdk(Pointer<Utf8> path) {
  return _init_sdk(path);
}
