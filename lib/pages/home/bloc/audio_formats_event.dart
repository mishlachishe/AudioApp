part of 'audio_formats_bloc.dart';

@immutable
sealed class AudioFormatsEvent {
  const AudioFormatsEvent();
}

final class LoadAudioFormatsEvent extends AudioFormatsEvent {
  const LoadAudioFormatsEvent();
}