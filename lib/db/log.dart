import 'package:drift/drift.dart';

@TableIndex(name: "timestamp", columns: {#timestamp})
class LogTable extends Table {
  TextColumn get id => text()();
  Int64Column get timestamp => int64()();
  TextColumn get tag => text()();
  TextColumn get payload => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}