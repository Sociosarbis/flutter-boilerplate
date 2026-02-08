import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/db/db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid/ulid.dart';
import 'package:sqlite3/open.dart';
import 'package:sqlite3/sqlite3.dart';

import '../../test_utils.dart';

void useSystemLibrary() {
  open.overrideFor(OperatingSystem.windows,
      () => DynamicLibrary.open("c:/Windows/System32/winsqlite3.dll"));
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    if (Platform.isWindows) {
      useSystemLibrary();
    }
    const pathPluginChannel = MethodChannel('plugins.flutter.io/path_provider');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathPluginChannel, (methodCall) async {
      switch (methodCall.method) {
        case "getApplicationDocumentsDirectory":
          return "./";
      }
      return null;
    });
  });
  group("Database", () {
    test("save log to db", () async {
      final database = AppDatabase(
        isolateSetup: () {
          useSystemLibrary();
        },
      );
      const count = 130000;
      final bench = Benchmark();
      var items = List.generate(
          count,
          (index) => LogTableCompanion.insert(
              id: Ulid().toString(),
              timestamp: BigInt.from(DateTime.now().millisecondsSinceEpoch),
              tag: "test",
              payload: Value(jsonEncode({"msg": "hello"}))));
      await bench.run(() => database.batch((batch) {
            batch.insertAll(database.logTable, items);
          }));
      items = List.generate(
          count,
          (index) => LogTableCompanion.insert(
              id: Ulid().toString(),
              timestamp: BigInt.from(DateTime.now().millisecondsSinceEpoch),
              tag: "test",
              payload: Value(jsonEncode({"msg": "hello"}))));
      await bench.run(() => database.batch((batch) {
            batch.insertAll(database.logTable, items);
          }));
      final db = sqlite3.open("app.db");
      bench.run(() {
        final stmt = db.prepare(
            "INSERT INTO log_table (id,timestamp,tag,payload) VALUES (?,?,?,?)");
        db.execute("BEGIN TRANSACTION");
        for (var i = 0; i < count; i++) {
          stmt.execute([
            Ulid().toString(),
            BigInt.from(DateTime.now().millisecondsSinceEpoch).toString(),
            "test",
            jsonEncode({"msg": "hello"})
          ]);
        }
        db.execute("COMMIT");
      });
      db.dispose();
    });

    test("select and delete", () async {
      final database = AppDatabase(
        isolateSetup: () {
          useSystemLibrary();
        },
      );
      final bench = Benchmark();
      late final List<LogTableData> rows;
      await bench.run(() async {
        rows = await (database.select(database.logTable)
              ..where((tbl) => tbl.timestamp.isSmallerOrEqualValue(
                  BigInt.from(DateTime.now().millisecondsSinceEpoch)))
              ..limit(1000))
            .get();
      });
      await bench.run(() async {
        database.batch((batch) {
          batch.delete;
        });
        await (database.delete(database.logTable)
              ..where((row) => row.id.isIn(rows.map((e) => e.id))))
            .go();
      });

      await bench.run(() async {
        final rows = await database.customSelect(
            "select id from log_table where timestamp <= ? limit 1000",
            variables: [
              Variable(BigInt.from(DateTime.now().millisecondsSinceEpoch))
            ]).get();
        await database.customStatement(
            "delete from log_table where id in (${rows.map((e) => '?').join(",")})",
            rows.map((e) => e.data["id"]).toList(growable: false));
      });
    });
  });
}
