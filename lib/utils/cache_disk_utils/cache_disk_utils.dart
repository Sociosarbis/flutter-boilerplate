import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:logging/logging.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';

const longMaxValue = 0x7FFFFFFFFFFFFFFF;

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

final logger = Logger("CacheDiskUtils");

final class _DiskCacheManager {
  static const int _timeInfoLen = 14;
  int _cacheSize = 0;
  int _cacheCount = 0;
  final int _sizeLimit;
  final int _countLimit;
  final Map<FileSystemEntity, int> _lastUsageDates = {};
  final Directory _cacheDir;
  late final Future<int> _stream;

  _DiskCacheManager(this._cacheDir, this._sizeLimit, this._countLimit) {
    _stream = _cacheDir.list().asyncMap((event) async {
      final segments = event.uri.pathSegments;
      if (segments.isNotEmpty && segments.last.startsWith(_cachePrefix)) {
        final stat = await event.stat();
        _cacheSize += stat.size;
        _cacheCount += 1;
        _lastUsageDates[event] = stat.modified.microsecondsSinceEpoch;
      }
    }).length;
  }

  Future<void> _wait2InitOk() {
    return _stream;
  }

  Future<int> _getCacheSize() async {
    await _wait2InitOk();
    return _cacheSize;
  }

  Future<int> _getCacheCount() async {
    await _wait2InitOk();
    return _cacheCount;
  }

  Future<File> _getFileBeforePut(final String key) async {
    await _wait2InitOk();
    final file = File(join(_cacheDir.path, _getCacheNameByKey(key)));
    if (await file.exists()) {
      final size = await file.length();
      _cacheCount -= 1;
      _cacheSize -= size;
    }
    return file;
  }

  Future<File?> _getFileIfExists(final String key) async {
    final file = File(join(_cacheDir.path, _getCacheNameByKey(key)));
    if (!await file.exists()) return null;
    return file;
  }

  Future<void> _updateModify(final File file) async {
    final now = DateTime.now();
    await file.setLastModified(now);
    _lastUsageDates[file] = now.millisecondsSinceEpoch;
  }

  static Uint8List newByteArrayWithTime(
      final int second, final Uint8List data) {
    final time = utf8.encode(_createDueTime(second));
    final content = Uint8List(time.length + data.length);
    content.setAll(0, time);
    content.setAll(time.length, data);
    return content;
  }

  static String _createDueTime(final int seconds) {
    return "_\$${"${(DateTime.now().millisecondsSinceEpoch / 1000 + seconds)}".padLeft(10, "0")}\$_";
  }

  _getCacheNameByKey(final String key) {
    return "$_cachePrefix${key.substring(0, 3)}${key.substring(3).hashCode}";
  }

  Future<int> _removeOldest() async {
    if (_lastUsageDates.isEmpty) return 0;
    var oldestUsage = longMaxValue;
    File? oldestFile;
    final entries = _lastUsageDates.entries;
    for (final entry in entries) {
      final lastValueUsage = entry.value;
      if (lastValueUsage < oldestUsage) {
        oldestUsage = lastValueUsage;
        oldestFile = entry.key as File;
      }
    }
    if (oldestFile == null) return 0;
    final fileSize = await oldestFile.length();
    try {
      await oldestFile.delete();
      _lastUsageDates.remove(oldestFile);
      return fileSize;
    } catch (e) {
      logger.severe("can't not delete ${oldestFile.path}", e);
    }
    return 0;
  }

  Future<bool> _removeByKey(final String key) async {
    final file = await _getFileIfExists(key);
    if (file == null) return true;
    try {
      await file.delete();
    } catch (e) {
      logger.severe("can't not delete ${file.path}", e);
      return false;
    }
    _cacheSize -= await file.length();
    _cacheCount--;
    _lastUsageDates.remove(file);
    return true;
  }

  Future<void> _put(final File file) async {
    _cacheSize += await file.length();
    _cacheCount++;
    while (_cacheCount > _countLimit || _cacheSize > _sizeLimit) {
      _cacheSize -= await _removeOldest();
      _cacheCount--;
    }
  }

  static bool _isDue(final Uint8List? data) {
    final millis = _getDueTime(data);
    return millis != -1 && DateTime.now().millisecondsSinceEpoch > millis;
  }

  static int _getDueTime(final Uint8List? data) {
    if (_hasTimeInfo(data)) {
      final millis = _copyOfRange(data!, 2, 12);
      try {
        return int.parse(utf8.decode(millis)) * 1000;
      } catch (e) {
        return -1;
      }
    }
    return -1;
  }

  static Uint8List _copyOfRange(
      final Uint8List original, final int from, final int to) {
    final newLength = to - from;
    if (newLength < 0) {
      throw Exception("Illegal argument $from > $to");
    }
    final copy = Uint8List(newLength);
    copy.setAll(
        0, original.sublist(from, min(original.length - from, newLength)));
    return copy;
  }

  static bool _hasTimeInfo(final Uint8List? data) {
    return data != null &&
        data.length >= _timeInfoLen &&
        data[0] == '_'.codeUnitAt(0) &&
        data[1] == '\$'.codeUnitAt(0) &&
        data[12] == '\$'.codeUnitAt(0) &&
        data[13] == '_'.codeUnitAt(0);
  }

  static Uint8List _getDataWithoutDueTime(Uint8List data) {
    if (_hasTimeInfo(data)) {
      return _copyOfRange(data, _timeInfoLen, data.length);
    }
    return data;
  }
}

const String _cachePrefix = "cdu_";

final class CacheDiskUtils {
  static const int _defaultMaxSize = longMaxValue;
  static const int _defaultMaxCount = 0xFFFFFFFF;
  static const String _typeByte = "by_";
  static const String _typeString = "st_";
  static const String _typeJsonObject = "jo_";
  static const String _typeJsonArray = "ja_";

  static final Map<String, CacheDiskUtils> cacheMap = {};

  final _lock = Lock(reentrant: true);

  static final _clsLock = Lock();

  final String _mCacheKey;
  final Directory _mCacheDir;
  final int _mMaxSize;
  final int _mMaxCount;
  _DiskCacheManager? _mDiskCacheManager;

  static Future<CacheDiskUtils> getInstance(
      {String cacheName = "",
      Directory? cacheDir,
      final int maxSize = _defaultMaxSize,
      final int maxCount = _defaultMaxCount}) async {
    return _clsLock.synchronized(() async {
      if (cacheDir == null) {
        if (StringUtils.isSpace(cacheName)) {
          cacheName = "cacheUtils";
        }
        cacheDir = Directory.fromUri(Uri.directory(
            join((await getApplicationCacheDirectory()).path, cacheName)));
      }
      final cacheKey = "${cacheDir!.path}_${maxSize}_$maxCount";
      var cache = cacheMap[cacheKey];
      if (cache == null) {
        cache = CacheDiskUtils._(cacheKey, cacheDir!, maxSize, maxCount);
        cacheMap[cacheKey] = cache;
      }
      return cache;
    });
  }

  CacheDiskUtils._(
      this._mCacheKey, this._mCacheDir, this._mMaxSize, this._mMaxCount);

  Future<_DiskCacheManager?> _getDiskCacheManager() async {
    return _lock.synchronized(() async {
      if (!await _mCacheDir.exists()) {
        try {
          await _mCacheDir.create();
        } catch (e) {
          logger.severe("can't make dirs in ${_mCacheDir.path}");
          return _mDiskCacheManager;
        }
      }
      _mDiskCacheManager ??=
          _DiskCacheManager(_mCacheDir, _mMaxSize, _mMaxCount);
      return _mDiskCacheManager;
    });
  }

  Future<void> put(final String key, final Object value,
      {int saveTime = -1}) async {
    return _lock.synchronized(() async {
      if (value is String) {
        return _realPutBytes("$_typeString$key",
            Uint8List.fromList(utf8.encode(value)), saveTime);
      }
      if (value is Uint8List) {
        return _realPutBytes("$_typeByte$key", value, saveTime);
      }
      return _realPutBytes(
          value is List ? "$_typeJsonArray$key" : "$_typeJsonObject$key",
          Uint8List.fromList(utf8.encode(jsonEncode(value))),
          saveTime);
    });
  }

  Future<void> _realPutBytes(
      final String key, Uint8List? value, int saveTime) async {
    if (value == null) return;
    final diskCacheManager = await _getDiskCacheManager();
    if (diskCacheManager == null) return;
    if (saveTime >= 0) {
      value = _DiskCacheManager.newByteArrayWithTime(saveTime, value);
    }
    final file = await diskCacheManager._getFileBeforePut(key);
    await file.writeAsBytes(value);
    await diskCacheManager._updateModify(file);
    await diskCacheManager._put(file);
  }

  Future<Uint8List?> getBytes(final String key,
      {final Uint8List? defaultValue}) {
    return _realGetBytes("$_typeByte$key", defaultValue: defaultValue);
  }

  Future<String?> getString(final String key,
      {final String? defaultValue}) async {
    final bytes = await _realGetBytes("$_typeString$key");
    if (bytes == null) return defaultValue;
    return utf8.decode(bytes);
  }

  Future<List?> getJSONArray(final String key,
      {final List? defaultValue}) async {
    final bytes = await _realGetBytes("$_typeJsonArray$key");
    if (bytes == null) return defaultValue;
    try {
      final res = jsonDecode(utf8.decode(bytes));
      if (res is List) {
        return res;
      }
    } catch (e) {
      //
    }
    return null;
  }

  Future<Map<String, dynamic>?> getJSONObject(final String key,
      {final Map<String, dynamic>? defaultValue}) async {
    final bytes = await _realGetBytes("$_typeJsonObject$key");
    if (bytes == null) return defaultValue;
    try {
      final res = jsonDecode(utf8.decode(bytes));
      if (res is Map<String, dynamic>) {
        return res;
      }
    } catch (e) {
      //
    }
    return null;
  }

  Future<Uint8List?> _realGetBytes(final String key,
      {final Uint8List? defaultValue}) async {
    return _lock.synchronized(() async {
      final diskCacheManager = await _getDiskCacheManager();
      if (diskCacheManager == null) return defaultValue;
      final file = await diskCacheManager._getFileIfExists(key);
      if (file == null) return defaultValue;
      final data = await file.readAsBytes();
      if (_DiskCacheManager._isDue(data)) {
        await diskCacheManager._removeByKey(key);
        return defaultValue;
      }
      await diskCacheManager._updateModify(file);
      return _DiskCacheManager._getDataWithoutDueTime(data);
    });
  }

  Future<int> getCacheSize() async {
    final diskCacheManager = await _getDiskCacheManager();
    if (diskCacheManager == null) return 0;
    return diskCacheManager._getCacheSize();
  }

  Future<int> getCacheCount() async {
    final diskCacheManager = await _getDiskCacheManager();
    if (diskCacheManager == null) return 0;
    return diskCacheManager._getCacheCount();
  }

  Future<bool> remove(final String key) async {
    return _lock.synchronized(() async {
      final diskCacheManager = await _getDiskCacheManager();
      if (diskCacheManager == null) return false;
      return await diskCacheManager._removeByKey("$_typeByte$key") &&
          await diskCacheManager._removeByKey("$_typeString$key") &&
          await diskCacheManager._removeByKey("$_typeJsonArray$key") &&
          await diskCacheManager._removeByKey("$_typeJsonObject$key");
    });
  }

  @override
  String toString() {
    return "$_mCacheKey@${hashCode.toRadixString(16)}";
  }
}
