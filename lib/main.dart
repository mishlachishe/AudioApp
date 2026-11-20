import 'package:audioapp/pages/home/bloc/audio_formats_bloc.dart';
import 'package:audioapp/pages/home/detail_page.dart';
import 'package:audioapp/pages/home/home_page.dart';
import 'package:audioapp/pages/loading_page.dart';
import 'package:audioapp/pages/login_page.dart';
import 'package:audioapp/pages/register_page.dart';
import 'package:audioapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: "mononoki",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => BlocProvider(
          create: (context) => AudioFormatsBloc()..add(const LoadAudioFormatsEvent()),
          child: const HomePage(),
        ),
        Routes.detail: (context) => const DetailPage(),
      },
    );
  }
}