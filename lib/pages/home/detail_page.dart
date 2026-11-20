import 'package:flutter/material.dart';
import '../../../models/audio_format.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioFormat args = ModalRoute.of(context)!.settings.arguments as AudioFormat;

    return Scaffold(
      appBar: AppBar(
        title: Text("ПУНКТ: ${args.title}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12),
              ),
              child: Image.asset(args.imagePath, height: 200),
            ),
            const SizedBox(height: 24),
            Text(
              "Описание пункта ${args.title}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              args.desc,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}