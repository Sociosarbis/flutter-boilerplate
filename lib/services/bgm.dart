import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/models/bgm/res.dart';
import 'package:flutter_boilerplate/utils/cache_disk_utils/cache_disk_utils.dart';

final client = Dio(BaseOptions(
  baseUrl: "https://api.bgm.tv",
));

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
  const BgmService();

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
}
