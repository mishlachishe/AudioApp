import 'package:audioapp/pages/profile_page.dart';
import 'package:flutter/material.dart';

class FormatsScreen extends StatefulWidget {
  const FormatsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FormatsScreenState();
  }
}

class _FormatsScreenState extends State<FormatsScreen> {
  final List<String> _images = const [
    "assets/img_mp3.png",
    "assets/img_wav.png",
    "assets/img_flac.png",
    "assets/img_aac.png",
    "assets/img_ogg.png"
  ];

  final List<Map<String, dynamic>> _formatsData = const [
    {
      "title": "MP3",
      "desc": "Сжатый формат, популярный для музыки",
      "iconBefore": Icons.music_note,
      "iconAfter": Icons.arrow_forward_ios,
    },
    {
      "title": "WAV",
      "desc": "Несжатый формат, высокое качество",
      "iconBefore": Icons.graphic_eq,
      "iconAfter": Icons.arrow_forward_ios,
    },
    {
      "title": "FLAC",
      "desc": "Сжатие без потерь качества",
      "iconBefore": Icons.album,
      "iconAfter": Icons.arrow_forward_ios,
    },
    {
      "title": "AAC",
      "desc": "Улучшенное сжатие по сравнению с MP3",
      "iconBefore": Icons.headphones,
      "iconAfter": Icons.arrow_forward_ios,
    },
    {
      "title": "OGG",
      "desc": "Открытый бесплатный формат",
      "iconBefore": Icons.audiotrack,
      "iconAfter": Icons.arrow_forward_ios,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Аудиоформаты",
          style: TextStyle(
            fontFamily: "mononoki",
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.greenAccent, size: 28),
            tooltip: 'Профиль',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                "Форматы",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Приложение для изучения популярных форматов аудиофайлов, их особенностей, степени сжатия и сфер применения.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      width: 130,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            _images[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _formatsData.length,
              itemBuilder: (context, index) {
                final item = _formatsData[index];
                return Card(
                  color: Colors.black26,
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: Icon(
                      item['iconBefore'],
                      color: Colors.greenAccent,
                      size: 32,
                    ),
                    title: Text(
                      item['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.limeAccent,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      item['desc'],
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: Icon(
                      item['iconAfter'],
                      color: Colors.grey,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Выбран формат: ${item['title']}',
                            style: const TextStyle(fontFamily: "mononoki"),
                          ),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 24),

            // Футер (ФИО и группа)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Клейменов М.Д. Группа: ИКБО-65-23",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}