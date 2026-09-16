import 'package:flutter/material.dart';
import 'screens/FormatsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audo formats',
      debugShowCheckedModeBanner: false,
      //темная тема
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      //
      home: const FormatsScreen(),
    );
  }
}