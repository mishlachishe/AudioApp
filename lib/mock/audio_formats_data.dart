import 'package:flutter/material.dart';
import '../models/audio_format.dart';

const List<AudioFormat> audioFormatsData = [
  AudioFormat(
    title: "MP3",
    desc: "Сжатый формат, популярный для музыки",
    imagePath: "assets/img_mp3.png",
  ),
  AudioFormat(
    title: "WAV",
    desc: "Несжатый формат, высокое качество",
    imagePath: "assets/img_wav.png",
  ),
  AudioFormat(
    title: "FLAC",
    desc: "Сжатие без потерь качества",
    imagePath: "assets/img_flac.png",
  ),
  AudioFormat(
    title: "AAC",
    desc: "Улучшенное сжатие по сравнению с MP3",
    imagePath: "assets/img_aac.png",
  ),
  AudioFormat(
    title: "OGG",
    desc: "Открытый бесплатный формат",
    imagePath: "assets/img_ogg.png",
  ),
];