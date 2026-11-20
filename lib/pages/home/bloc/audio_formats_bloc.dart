import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../mock/audio_formats_data.dart';
import '../../../../models/audio_format.dart';

part 'audio_formats_event.dart';
part 'audio_formats_state.dart';

class AudioFormatsBloc extends Bloc<AudioFormatsEvent, AudioFormatsState> {
  AudioFormatsBloc() : super(const AudioFormatsInitial()) {
    on<LoadAudioFormatsEvent>(_onLoadAudioFormats);
  }

  Future<void> _onLoadAudioFormats(
      LoadAudioFormatsEvent event,
      Emitter<AudioFormatsState> emit,
      ) async {
    emit(const AudioFormatsLoading());

    try {
      // задержка пол секунды
      await Future.delayed(const Duration(milliseconds: 500));

      emit(AudioFormatsLoaded(audioFormatsData));
    } catch (e) {
      emit(const AudioFormatsError('Не удалось загрузить список аудиоформатов'));
    }
  }
}