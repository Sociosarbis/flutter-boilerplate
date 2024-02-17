import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/models/bgm/paged_response.dart';
import 'package:flutter_boilerplate/models/bgm/res.dart';
import 'package:flutter_boilerplate/models/bgm/subject.dart';
import 'package:flutter_boilerplate/utils/cache_disk_utils/cache_disk_utils.dart';

class CancellableFuture<T> implements Future<T> {
  final Future<T> _fut;
  final CancelToken _cancelToken;
  const CancellableFuture(this._fut, this._cancelToken);

  factory CancellableFuture.fromFutureBuilder(
      Future<T> Function(CancelToken) builder) {
    final cancelToken = CancelToken();
    return CancellableFuture(builder(cancelToken), cancelToken);
  }

  void cancel([Object? reason]) {
    this._cancelToken.cancel(reason);
  }

  @override
  Stream<T> asStream() {
    return this._fut.asStream();
  }

  @override
  Future<T> catchError(Function onError, {bool Function(Object error)? test}) {
    return this._fut.catchError(onError, test: test);
  }

  @override
  Future<R> then<R>(FutureOr<R> Function(T value) onValue,
      {Function? onError}) {
    return this._fut.then(onValue, onError: onError);
  }

  @override
  Future<T> timeout(Duration timeLimit, {FutureOr<T> Function()? onTimeout}) {
    return this._fut.timeout(timeLimit, onTimeout: onTimeout);
  }

  @override
  Future<T> whenComplete(FutureOr<void> Function() action) {
    return this._fut.whenComplete(action);
  }
}

class BgmService {
  late final Dio client;
  BgmService({required String personalAccessToken}) {
    client = Dio(BaseOptions(baseUrl: "https://api.bgm.tv", headers: {
      "Authorization": "Bearer $personalAccessToken",
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0"
    }));
  }

  static const calendarCacheKey = "bgm_calendar";

  CancellableFuture<List<GetCalendarItem>> getCalendar() {
    return CancellableFuture<List<GetCalendarItem>>.fromFutureBuilder(
        (cancelToken) async {
      final res = await client.get("/calendar", cancelToken: cancelToken);
      if (res.data is List) {
        final ret = (res.data as List)
            .map((e) => GetCalendarItem.fromJson(e))
            .toList(growable: false);
        CacheDiskUtils.getInstance().then((value) {
          return value.put(calendarCacheKey, ret);
        });
        return ret;
      }
      return [];
    });
  }

  CancellableFuture<PagedResponse<Subject>> searchSubjects(
      {required int offset,
      required int limit,
      String? sort,
      List<int>? types}) {
    return CancellableFuture<PagedResponse<Subject>>.fromFutureBuilder(
        (cancelToken) async {
      final res = await client.post("/v0/search/subjects",
          data: {
            "nsfw": true,
            "sort": sort,
            "filter": {
              "type": types,
              "rank": [">0"]
            }
          },
          queryParameters: {"offset": offset, "limit": limit},
          cancelToken: cancelToken);
      return PagedResponse<Subject>.fromJson(
          res.data, (p0) => Subject.fromJson(p0 as Map<String, dynamic>));
    });
  }
}
