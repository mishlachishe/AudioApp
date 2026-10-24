import 'package:audioapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/formats_page.dart';

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
        fontFamily: "mononoki" //шрифт
      ),
      home: const LoginPage(),
    );
  }
}