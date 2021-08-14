///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use deleteBookRequestDescriptor instead')
const DeleteBookRequest$json = const {
  '1': 'DeleteBookRequest',
  '2': const [
    const {'1': 'isbn', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'isbn'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'title'},
  ],
  '8': const [
    const {'1': 'selector'},
  ],
};

/// Descriptor for `DeleteBookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBookRequestDescriptor = $convert.base64Decode('ChFEZWxldGVCb29rUmVxdWVzdBIUCgRpc2JuGAEgASgJSABSBGlzYm4SFgoFdGl0bGUYAiABKAlIAFIFdGl0bGVCCgoIc2VsZWN0b3I=');
@$core.Deprecated('Use listBookResponseDescriptor instead')
const ListBookResponse$json = const {
  '1': 'ListBookResponse',
  '2': const [
    const {'1': 'books', '3': 1, '4': 3, '5': 11, '6': '.book.Book', '10': 'books'},
  ],
};

/// Descriptor for `ListBookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBookResponseDescriptor = $convert.base64Decode('ChBMaXN0Qm9va1Jlc3BvbnNlEiAKBWJvb2tzGAEgAygLMgouYm9vay5Cb29rUgVib29rcw==');
@$core.Deprecated('Use bookDescriptor instead')
const Book$json = const {
  '1': 'Book',
  '2': const [
    const {'1': 'isbn', '3': 1, '4': 1, '5': 9, '10': 'isbn'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'author', '3': 3, '4': 1, '5': 11, '6': '.book.Author', '10': 'author'},
  ],
};

/// Descriptor for `Book`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bookDescriptor = $convert.base64Decode('CgRCb29rEhIKBGlzYm4YASABKAlSBGlzYm4SFAoFdGl0bGUYAiABKAlSBXRpdGxlEiQKBmF1dGhvchgDIAEoCzIMLmJvb2suQXV0aG9yUgZhdXRob3I=');
@$core.Deprecated('Use authorDescriptor instead')
const Author$json = const {
  '1': 'Author',
  '2': const [
    const {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `Author`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authorDescriptor = $convert.base64Decode('CgZBdXRob3ISHQoKZmlyc3RfbmFtZRgBIAEoCVIJZmlyc3ROYW1lEhsKCWxhc3RfbmFtZRgCIAEoCVIIbGFzdE5hbWU=');
