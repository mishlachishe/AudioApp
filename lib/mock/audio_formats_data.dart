import 'package:flutter/material.dart';
import '../models/audio_format.dart';

const List<AudioFormat> audioFormatsData = [
  AudioFormat(
    title: "MP3",
    desc: "Сжатый формат, популярный для музыки",
    iconBefore: Icons.music_note,
  ),
  AudioFormat(
    title: "WAV",
    desc: "Несжатый формат, высокое качество",
    iconBefore: Icons.graphic_eq,
  ),
  AudioFormat(
    title: "FLAC",
    desc: "Сжатие без потерь качества",
    iconBefore: Icons.album,
  ),
  AudioFormat(
    title: "AAC",
    desc: "Улучшенное сжатие по сравнению с MP3",
    iconBefore: Icons.headphones,
  ),
  AudioFormat(
    title: "OGG",
    desc: "Открытый бесплатный формат",
    iconBefore: Icons.audiotrack,
  ),
];