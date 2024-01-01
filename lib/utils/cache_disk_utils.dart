import 'dart:io';
import 'dart:isolate';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

bool isWhitespace(int rune) =>
    (rune >= 0x0009 && rune <= 0x000D) ||
    rune == 0x0020 ||
    rune == 0x0085 ||
    rune == 0x00A0 ||
    rune == 0x1680 ||
    rune == 0x180E ||
    (rune >= 0x2000 && rune <= 0x200A) ||
    rune == 0x2028 ||
    rune == 0x2029 ||
    rune == 0x202F ||
    rune == 0x205F ||
    rune == 0x3000 ||
    rune == 0xFEFF;

final class StringUtils {
  static bool isSpace(String s) {
    for (final r in s.runes) {
      if (!isWhitespace(r)) {
        return false;
      }
    }
    return true;
  }
}

final class _DiskCacheManager {
  int _cacheSize = 0;
  int _cacheCount = 0;
  final int _sizeLimit;
  final int _countLimit;
  final Map<FileSystemEntity, int> _lastUsageDates = {};
  final Directory _cacheDir;
  late final Future<void> _stream;

  _DiskCacheManager(this._cacheDir, this._sizeLimit, this._countLimit) {
    _stream = _cacheDir.list().asyncMap((event) async {
      final segments = event.uri.pathSegments;
      if (segments.isNotEmpty && segments.last.startsWith(_cachePrefix)) {
        final stat = await event.stat();
        _cacheSize += stat.size;
        _cacheCount += 1;
        _lastUsageDates.update(event, (value) => stat.modified.millisecond);
      }
    }).last;
  }

  Future<void> _wait2InitOk() {
    return _stream;
  }

  Future<File> getFileBeforePut(final String key) async {
    await _wait2InitOk();
    final file = File(join(_cacheDir.path, _getCacheNameByKey(key)));
    if (await file.exists()) {
      final size = await file.length();
      _cacheCount -= 1;
      _cacheSize -= size;
    }
    return file;
  }

  Future<void> _updateModify(final File file) async {
    final now = DateTime.now();
    await file.setLastModified(now);
    _lastUsageDates.update(file, (value) => now.millisecond);
  }

  _getCacheNameByKey(final String key) {
    return "$_cachePrefix${key.substring(0, 3)}${key.substring(3).hashCode}";
  }
}

const String _cachePrefix = "cdu_";

final class CacheDiskUtils {
  static const int _defaultMaxSize = 0x7FFFFFFFFFFFFFFF;
  static const int _defaultMaxCount = 0xFFFFFFFF;
  static const String _typeByte = "by_";
  static const String _typeString = "st_";

  static const Map<String, CacheDiskUtils> cacheMap = {};

  final String _mCacheKey;
  final Directory _mCacheDir;
  final int _mMaxSize;
  final int _mMaxCount;

  static Future<CacheDiskUtils> getInstance() {
    return getInstance2("", _defaultMaxSize, _defaultMaxCount);
  }

  static Future<CacheDiskUtils> getInstance2(
      String cacheName, final int maxSize, final int maxCount) async {
    //
    if (StringUtils.isSpace(cacheName)) {
      cacheName = "cacheUtils";
    }
    final file = Directory.fromUri(Uri.directory(
        join("${await getApplicationCacheDirectory()}", cacheName)));

    return CacheDiskUtils.getInstance0(file, maxSize, maxCount);
  }

  factory CacheDiskUtils.getInstance0(
      final Directory cacheDir, final int maxSize, final int maxCount) {
    final cacheKey = "${cacheDir.absolute}_${maxSize}_$maxCount";
    var cache = cacheMap[cacheKey];
    cache ??= CacheDiskUtils._(cacheKey, cacheDir, maxSize, maxCount);
    return cache;
  }

  const CacheDiskUtils._(
      this._mCacheKey, this._mCacheDir, this._mMaxSize, this._mMaxCount);
}
