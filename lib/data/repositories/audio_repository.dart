import 'package:injectable/injectable.dart';
import '../../data/local/app_database.dart' as db;
import '../../models/audio_format.dart';

abstract class AudioRepository {
  Future<List<AudioFormat>> getAudioFormats();
}

@LazySingleton(as: AudioRepository)
class AudioRepositoryImpl implements AudioRepository {
  final db.AppDatabase _db;
  AudioRepositoryImpl(this._db);

  @override
  Future<List<AudioFormat>> getAudioFormats() async {
    final dbFormats = await _db.getAllFormats();
    return dbFormats.map((e) => AudioFormat(
      title: e.title,
      desc: e.desc,
      imagePath: e.imagePath,
    )).toList();
  }
}