import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

class AudioFormats extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get desc => text()();
  TextColumn get imagePath => text()();
}

@lazySingleton
@DriftDatabase(tables: [AudioFormats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        await batch((b) {
          b.insertAll(audioFormats, [
            AudioFormatsCompanion.insert(title: 'MP3', desc: 'Сжатый формат, популярный для музыки', imagePath: 'assets/img_mp3.png'),
            AudioFormatsCompanion.insert(title: 'WAV', desc: 'Несжатый формат, высокое качество', imagePath: 'assets/img_wav.png'),
            AudioFormatsCompanion.insert(title: 'FLAC', desc: 'Сжатие без потерь качества', imagePath: 'assets/img_flac.png'),
            AudioFormatsCompanion.insert(title: 'AAC', desc: 'Улучшенное сжатие по сравнению с MP3', imagePath: 'assets/img_aac.png'),
            AudioFormatsCompanion.insert(title: 'OGG', desc: 'Открытый бесплатный формат', imagePath: 'assets/img_ogg.png'),
          ]);
        });
      },
    );
  }

  Future<List<AudioFormat>> getAllFormats() => select(audioFormats).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'audio_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}