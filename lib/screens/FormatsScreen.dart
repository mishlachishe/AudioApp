import 'package:flutter/material.dart';

//класс теперь динамический
class FormatsScreen extends StatefulWidget {
  const FormatsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FormatsScreenState();
  }
}

//отдельное состояние
class _FormatsScreenState extends State<FormatsScreen> { //stateless -> stateful
  final List<String> _images = const [
    "assets/img_mp3.png",
    "assets/img_wav.png",
    "assets/img_flac.png",
    "assets/img_aac.png",
    "assets/img_ogg.png"
  ]; //массив из ассетов

  //КАРТИНКИ
  int _currIdx = 0;
  void _nextImage() {
    setState(() {
      _currIdx = (_currIdx + 1) % 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text(
          "Аудиоформаты",
          style: TextStyle(
            fontFamily: "mononoki", //кастомный шрифт
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 24
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              context: context,
              child: Center(
                child: Text(
                  "Форматы",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildCard(
              context: context,
              child: Text(
                "Приложение для изучения популярных форматов аудиофайлов, их особенностей, степени сжатия и сфер применения.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildCard(
                    context: context,
                    height: 200,
                    //смена картинки по клику
                    child: GestureDetector(
                      onTap: _nextImage,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          _images[_currIdx],
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Expanded(
                  flex: 3,
                  child: _buildCard(
                    context: context,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildItem("1. mp3"),
                          _buildItem("2. wav"),
                          _buildItem("3. flac"),
                          _buildItem("4. aac"),
                          _buildItem("5. ogg")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            //кнопка для переключеня
            Center(
              child: ElevatedButton.icon(
                onPressed: _nextImage,
                icon: const Icon(Icons.skip_next),
                label: const Text(
                  "Следующее изображение",
                  style: TextStyle(fontFamily: "mononoki", fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
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
  //доп метод для постройки карточки с инфой
  Widget _buildCard ({
    required BuildContext context,
    required Widget child,
    double? height,
  }) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3)
          ),
        ],
        border: Border.all(
          color:Colors.black12,
        ),
      ),
      child: child,
    );
  }
  //доп метод для постройки пунктов списка
  Widget _buildItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.limeAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}