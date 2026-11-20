part of 'audio_formats_bloc.dart';

@immutable
sealed class AudioFormatsState {
  const AudioFormatsState();
}

final class AudioFormatsInitial extends AudioFormatsState {
  const AudioFormatsInitial();
}

final class AudioFormatsLoading extends AudioFormatsState {
  const AudioFormatsLoading();
}

final class AudioFormatsLoaded extends AudioFormatsState {
  final List<AudioFormat> formats;
  const AudioFormatsLoaded(this.formats);
}

final class AudioFormatsError extends AudioFormatsState {
  final String message;
  const AudioFormatsError(this.message);
}