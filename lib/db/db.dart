import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_boilerplate/db/log.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';

part 'db.g.dart';

@DriftDatabase(tables: [LogTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase({ FutureOr<void> Function()? isolateSetup }): super(_openConnection(isolateSetup: isolateSetup));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection({ FutureOr<void> Function()? isolateSetup }) {
    return DatabaseConnection.delayed((() async {
      if (Platform.isAndroid) {
        final cachebase = (await getTemporaryDirectory()).path;
        sqlite3.tempDirectory = cachebase;
      }
      final appDir = await getApplicationDocumentsDirectory();
      print(appDir);
      final dbPath = join(appDir.path, "app.db");
      return NativeDatabase.createBackgroundConnection(File(dbPath), isolateSetup: isolateSetup);
    })());
  }
}