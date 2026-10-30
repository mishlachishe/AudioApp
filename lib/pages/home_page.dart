import 'package:flutter/material.dart';
import '../routes.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _formatsData = const [
    {
      "title": "MP3",
      "desc": "Сжатый формат, популярный для музыки",
      "iconBefore": Icons.music_note,
    },
    {
      "title": "WAV",
      "desc": "Несжатый формат, высокое качество",
      "iconBefore": Icons.graphic_eq,
    },
    {
      "title": "FLAC",
      "desc": "Сжатие без потерь качества",
      "iconBefore": Icons.album,
    },
    {
      "title": "AAC",
      "desc": "Улучшенное сжатие по сравнению с MP3",
      "iconBefore": Icons.headphones,
    },
    {
      "title": "OGG",
      "desc": "Открытый бесплатный формат",
      "iconBefore": Icons.audiotrack,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "АУДИОФОРМАТЫ",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      ),
      body: _selectedIndex == 0 ? _buildHomeContent() : const ProfilePage(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black45,
        indicatorColor: Colors.greenAccent.withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Colors.greenAccent),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Colors.greenAccent),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Адаптивность: если ширина больше 600 - 2 колонки
        final isWideScreen = constraints.maxWidth > 600;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Название ПО: Изучение аудиоформатов",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Описание: Приложение для изучения популярных форматов аудиофайлов.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 20),

              isWideScreen
                  ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: _formatsData.length,
                itemBuilder: (context, index) => _buildCard(index),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _formatsData.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildCard(index),
                ),
              ),

              const SizedBox(height: 24),
              // Футер (ФИО и группа)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.person, size: 32, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Клейменов М.Д. Группа: ИКБО-65-23",
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard(int index) {
    final item = _formatsData[index];
    return Card(
      color: Colors.black26,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(item['iconBefore'], color: Colors.greenAccent, size: 32),
        title: Text(
          item['title'],
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.limeAccent, fontSize: 18),
        ),
        subtitle: Text(item['desc'], style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: item,
          );
        },
      ),
    );
  }
}