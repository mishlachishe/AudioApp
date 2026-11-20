// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AudioFormatsTable extends AudioFormats
    with TableInfo<$AudioFormatsTable, AudioFormat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AudioFormatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
    'desc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, desc, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audio_formats';
  @override
  VerificationContext validateIntegrity(
    Insertable<AudioFormat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
        _descMeta,
        desc.isAcceptableOrUnknown(data['desc']!, _descMeta),
      );
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AudioFormat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AudioFormat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      desc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}desc'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
    );
  }

  @override
  $AudioFormatsTable createAlias(String alias) {
    return $AudioFormatsTable(attachedDatabase, alias);
  }
}

class AudioFormat extends DataClass implements Insertable<AudioFormat> {
  final int id;
  final String title;
  final String desc;
  final String imagePath;
  const AudioFormat({
    required this.id,
    required this.title,
    required this.desc,
    required this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    map['image_path'] = Variable<String>(imagePath);
    return map;
  }

  AudioFormatsCompanion toCompanion(bool nullToAbsent) {
    return AudioFormatsCompanion(
      id: Value(id),
      title: Value(title),
      desc: Value(desc),
      imagePath: Value(imagePath),
    );
  }

  factory AudioFormat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AudioFormat(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
      'imagePath': serializer.toJson<String>(imagePath),
    };
  }

  AudioFormat copyWith({
    int? id,
    String? title,
    String? desc,
    String? imagePath,
  }) => AudioFormat(
    id: id ?? this.id,
    title: title ?? this.title,
    desc: desc ?? this.desc,
    imagePath: imagePath ?? this.imagePath,
  );
  AudioFormat copyWithCompanion(AudioFormatsCompanion data) {
    return AudioFormat(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      desc: data.desc.present ? data.desc.value : this.desc,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AudioFormat(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AudioFormat &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc &&
          other.imagePath == this.imagePath);
}

class AudioFormatsCompanion extends UpdateCompanion<AudioFormat> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> desc;
  final Value<String> imagePath;
  const AudioFormatsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  AudioFormatsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
    required String imagePath,
  }) : title = Value(title),
       desc = Value(desc),
       imagePath = Value(imagePath);
  static Insertable<AudioFormat> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? desc,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  AudioFormatsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? desc,
    Value<String>? imagePath,
  }) {
    return AudioFormatsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AudioFormatsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AudioFormatsTable audioFormats = $AudioFormatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [audioFormats];
}

typedef $$AudioFormatsTableCreateCompanionBuilder =
    AudioFormatsCompanion Function({
      Value<int> id,
      required String title,
      required String desc,
      required String imagePath,
    });
typedef $$AudioFormatsTableUpdateCompanionBuilder =
    AudioFormatsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> desc,
      Value<String> imagePath,
    });

class $$AudioFormatsTableFilterComposer
    extends Composer<_$AppDatabase, $AudioFormatsTable> {
  $$AudioFormatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AudioFormatsTableOrderingComposer
    extends Composer<_$AppDatabase, $AudioFormatsTable> {
  $$AudioFormatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get desc => $composableBuilder(
    column: $table.desc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AudioFormatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AudioFormatsTable> {
  $$AudioFormatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get desc =>
      $composableBuilder(column: $table.desc, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);
}

class $$AudioFormatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AudioFormatsTable,
          AudioFormat,
          $$AudioFormatsTableFilterComposer,
          $$AudioFormatsTableOrderingComposer,
          $$AudioFormatsTableAnnotationComposer,
          $$AudioFormatsTableCreateCompanionBuilder,
          $$AudioFormatsTableUpdateCompanionBuilder,
          (
            AudioFormat,
            BaseReferences<_$AppDatabase, $AudioFormatsTable, AudioFormat>,
          ),
          AudioFormat,
          PrefetchHooks Function()
        > {
  $$AudioFormatsTableTableManager(_$AppDatabase db, $AudioFormatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AudioFormatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AudioFormatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AudioFormatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> desc = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
              }) => AudioFormatsCompanion(
                id: id,
                title: title,
                desc: desc,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String desc,
                required String imagePath,
              }) => AudioFormatsCompanion.insert(
                id: id,
                title: title,
                desc: desc,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AudioFormatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AudioFormatsTable,
      AudioFormat,
      $$AudioFormatsTableFilterComposer,
      $$AudioFormatsTableOrderingComposer,
      $$AudioFormatsTableAnnotationComposer,
      $$AudioFormatsTableCreateCompanionBuilder,
      $$AudioFormatsTableUpdateCompanionBuilder,
      (
        AudioFormat,
        BaseReferences<_$AppDatabase, $AudioFormatsTable, AudioFormat>,
      ),
      AudioFormat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AudioFormatsTableTableManager get audioFormats =>
      $$AudioFormatsTableTableManager(_db, _db.audioFormats);
}
