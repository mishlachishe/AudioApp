import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../models/audio_format.dart';
import '../../../data/repositories/audio_repository.dart';

part 'audio_formats_event.dart';
part 'audio_formats_state.dart';

@injectable
class AudioFormatsBloc extends Bloc<AudioFormatsEvent, AudioFormatsState> {
  final AudioRepository _repository;

  AudioFormatsBloc(this._repository) : super(const AudioFormatsInitial()) {
    on<LoadAudioFormatsEvent>(_onLoadAudioFormats);
  }

  Future<void> _onLoadAudioFormats(
      LoadAudioFormatsEvent event,
      Emitter<AudioFormatsState> emit,
      ) async {
    emit(const AudioFormatsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final formats = await _repository.getAudioFormats();
      emit(AudioFormatsLoaded(formats));
    } catch (e) {
      emit(const AudioFormatsError('Не удалось загрузить данные'));
    }
  }
}