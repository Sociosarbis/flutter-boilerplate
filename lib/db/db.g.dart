// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $LogTableTable extends LogTable
    with TableInfo<$LogTableTable, LogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<BigInt> timestamp = GeneratedColumn<BigInt>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.bigInt, requiredDuringInsert: true);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, timestamp, tag, payload];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_table';
  @override
  VerificationContext validateIntegrity(Insertable<LogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.bigInt, data['${effectivePrefix}timestamp'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload']),
    );
  }

  @override
  $LogTableTable createAlias(String alias) {
    return $LogTableTable(attachedDatabase, alias);
  }
}

class LogTableData extends DataClass implements Insertable<LogTableData> {
  final String id;
  final BigInt timestamp;
  final String tag;
  final String? payload;
  const LogTableData(
      {required this.id,
      required this.timestamp,
      required this.tag,
      this.payload});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['timestamp'] = Variable<BigInt>(timestamp);
    map['tag'] = Variable<String>(tag);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    return map;
  }

  LogTableCompanion toCompanion(bool nullToAbsent) {
    return LogTableCompanion(
      id: Value(id),
      timestamp: Value(timestamp),
      tag: Value(tag),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
    );
  }

  factory LogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogTableData(
      id: serializer.fromJson<String>(json['id']),
      timestamp: serializer.fromJson<BigInt>(json['timestamp']),
      tag: serializer.fromJson<String>(json['tag']),
      payload: serializer.fromJson<String?>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'timestamp': serializer.toJson<BigInt>(timestamp),
      'tag': serializer.toJson<String>(tag),
      'payload': serializer.toJson<String?>(payload),
    };
  }

  LogTableData copyWith(
          {String? id,
          BigInt? timestamp,
          String? tag,
          Value<String?> payload = const Value.absent()}) =>
      LogTableData(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        tag: tag ?? this.tag,
        payload: payload.present ? payload.value : this.payload,
      );
  @override
  String toString() {
    return (StringBuffer('LogTableData(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('tag: $tag, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timestamp, tag, payload);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogTableData &&
          other.id == this.id &&
          other.timestamp == this.timestamp &&
          other.tag == this.tag &&
          other.payload == this.payload);
}

class LogTableCompanion extends UpdateCompanion<LogTableData> {
  final Value<String> id;
  final Value<BigInt> timestamp;
  final Value<String> tag;
  final Value<String?> payload;
  final Value<int> rowid;
  const LogTableCompanion({
    this.id = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.tag = const Value.absent(),
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LogTableCompanion.insert({
    required String id,
    required BigInt timestamp,
    required String tag,
    this.payload = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        timestamp = Value(timestamp),
        tag = Value(tag);
  static Insertable<LogTableData> custom({
    Expression<String>? id,
    Expression<BigInt>? timestamp,
    Expression<String>? tag,
    Expression<String>? payload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timestamp != null) 'timestamp': timestamp,
      if (tag != null) 'tag': tag,
      if (payload != null) 'payload': payload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LogTableCompanion copyWith(
      {Value<String>? id,
      Value<BigInt>? timestamp,
      Value<String>? tag,
      Value<String?>? payload,
      Value<int>? rowid}) {
    return LogTableCompanion(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      tag: tag ?? this.tag,
      payload: payload ?? this.payload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<BigInt>(timestamp.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogTableCompanion(')
          ..write('id: $id, ')
          ..write('timestamp: $timestamp, ')
          ..write('tag: $tag, ')
          ..write('payload: $payload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $LogTableTable logTable = $LogTableTable(this);
  late final Index timestamp =
      Index('timestamp', 'CREATE INDEX timestamp ON log_table (timestamp)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [logTable, timestamp];
}
