import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/detail_page.dart';
import 'pages/home/bloc/audio_formats_bloc.dart';
import 'theme/theme_cubit.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(); // Запуск DI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ThemeCubit>(), // Берем Cubit из DI
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Audio formats',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            //fontFamily: "mononoki",
            initialRoute: Routes.loading,
            routes: {
              Routes.loading: (context) => const LoadingPage(),
              Routes.login: (context) => const LoginPage(),
              Routes.register: (context) => const RegisterPage(),
              Routes.home: (context) => BlocProvider(
                create: (context) => getIt<AudioFormatsBloc>()..add(const LoadAudioFormatsEvent()),
                child: const HomePage(),
              ),
              Routes.detail: (context) => const DetailPage(),
            },
          );
        },
      ),
    );
  }
}