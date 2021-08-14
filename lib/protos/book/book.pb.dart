///
//  Generated code. Do not modify.
//  source: book.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

enum DeleteBookRequest_Selector {
  isbn, 
  title, 
  notSet
}

class DeleteBookRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeleteBookRequest_Selector> _DeleteBookRequest_SelectorByTag = {
    1 : DeleteBookRequest_Selector.isbn,
    2 : DeleteBookRequest_Selector.title,
    0 : DeleteBookRequest_Selector.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteBookRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'book'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isbn')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  DeleteBookRequest._() : super();
  factory DeleteBookRequest({
    $core.String? isbn,
    $core.String? title,
  }) {
    final _result = create();
    if (isbn != null) {
      _result.isbn = isbn;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory DeleteBookRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBookRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBookRequest clone() => DeleteBookRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBookRequest copyWith(void Function(DeleteBookRequest) updates) => super.copyWith((message) => updates(message as DeleteBookRequest)) as DeleteBookRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteBookRequest create() => DeleteBookRequest._();
  DeleteBookRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBookRequest> createRepeated() => $pb.PbList<DeleteBookRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBookRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBookRequest>(create);
  static DeleteBookRequest? _defaultInstance;

  DeleteBookRequest_Selector whichSelector() => _DeleteBookRequest_SelectorByTag[$_whichOneof(0)]!;
  void clearSelector() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get isbn => $_getSZ(0);
  @$pb.TagNumber(1)
  set isbn($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsbn() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsbn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class ListBookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListBookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'book'), createEmptyInstance: create)
    ..pc<Book>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'books', $pb.PbFieldType.PM, subBuilder: Book.create)
    ..hasRequiredFields = false
  ;

  ListBookResponse._() : super();
  factory ListBookResponse({
    $core.Iterable<Book>? books,
  }) {
    final _result = create();
    if (books != null) {
      _result.books.addAll(books);
    }
    return _result;
  }
  factory ListBookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListBookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListBookResponse clone() => ListBookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListBookResponse copyWith(void Function(ListBookResponse) updates) => super.copyWith((message) => updates(message as ListBookResponse)) as ListBookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBookResponse create() => ListBookResponse._();
  ListBookResponse createEmptyInstance() => create();
  static $pb.PbList<ListBookResponse> createRepeated() => $pb.PbList<ListBookResponse>();
  @$core.pragma('dart2js:noInline')
  static ListBookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListBookResponse>(create);
  static ListBookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Book> get books => $_getList(0);
}

class Book extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Book', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'book'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isbn')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOM<Author>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'author', subBuilder: Author.create)
    ..hasRequiredFields = false
  ;

  Book._() : super();
  factory Book({
    $core.String? isbn,
    $core.String? title,
    Author? author,
  }) {
    final _result = create();
    if (isbn != null) {
      _result.isbn = isbn;
    }
    if (title != null) {
      _result.title = title;
    }
    if (author != null) {
      _result.author = author;
    }
    return _result;
  }
  factory Book.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Book.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Book clone() => Book()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Book copyWith(void Function(Book) updates) => super.copyWith((message) => updates(message as Book)) as Book; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Book create() => Book._();
  Book createEmptyInstance() => create();
  static $pb.PbList<Book> createRepeated() => $pb.PbList<Book>();
  @$core.pragma('dart2js:noInline')
  static Book getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Book>(create);
  static Book? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get isbn => $_getSZ(0);
  @$pb.TagNumber(1)
  set isbn($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsbn() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsbn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  Author get author => $_getN(2);
  @$pb.TagNumber(3)
  set author(Author v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthor() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthor() => clearField(3);
  @$pb.TagNumber(3)
  Author ensureAuthor() => $_ensure(2);
}

class Author extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Author', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'book'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName')
    ..hasRequiredFields = false
  ;

  Author._() : super();
  factory Author({
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final _result = create();
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    return _result;
  }
  factory Author.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Author.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Author clone() => Author()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Author copyWith(void Function(Author) updates) => super.copyWith((message) => updates(message as Author)) as Author; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Author create() => Author._();
  Author createEmptyInstance() => create();
  static $pb.PbList<Author> createRepeated() => $pb.PbList<Author>();
  @$core.pragma('dart2js:noInline')
  static Author getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Author>(create);
  static Author? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);
}

