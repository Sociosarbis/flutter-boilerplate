///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'book.pb.dart' as $1;
export 'book.pb.dart';

class BookServiceClient extends $grpc.Client {
  static final _$listBooks = $grpc.ClientMethod<$0.Empty, $1.ListBookResponse>(
      '/book.BookService/ListBooks',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ListBookResponse.fromBuffer(value));
  static final _$deleteBook = $grpc.ClientMethod<$1.DeleteBookRequest, $1.Book>(
      '/book.BookService/DeleteBook',
      ($1.DeleteBookRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Book.fromBuffer(value));
  static final _$createBook = $grpc.ClientMethod<$1.Book, $1.Book>(
      '/book.BookService/CreateBook',
      ($1.Book value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Book.fromBuffer(value));

  BookServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ListBookResponse> listBooks($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listBooks, request, options: options);
  }

  $grpc.ResponseFuture<$1.Book> deleteBook($1.DeleteBookRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteBook, request, options: options);
  }

  $grpc.ResponseFuture<$1.Book> createBook($1.Book request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createBook, request, options: options);
  }
}

abstract class BookServiceBase extends $grpc.Service {
  $core.String get $name => 'book.BookService';

  BookServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ListBookResponse>(
        'ListBooks',
        listBooks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ListBookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DeleteBookRequest, $1.Book>(
        'DeleteBook',
        deleteBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DeleteBookRequest.fromBuffer(value),
        ($1.Book value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Book, $1.Book>(
        'CreateBook',
        createBook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Book.fromBuffer(value),
        ($1.Book value) => value.writeToBuffer()));
  }

  $async.Future<$1.ListBookResponse> listBooks_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listBooks(call, await request);
  }

  $async.Future<$1.Book> deleteBook_Pre($grpc.ServiceCall call,
      $async.Future<$1.DeleteBookRequest> request) async {
    return deleteBook(call, await request);
  }

  $async.Future<$1.Book> createBook_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Book> request) async {
    return createBook(call, await request);
  }

  $async.Future<$1.ListBookResponse> listBooks(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Book> deleteBook(
      $grpc.ServiceCall call, $1.DeleteBookRequest request);
  $async.Future<$1.Book> createBook($grpc.ServiceCall call, $1.Book request);
}
