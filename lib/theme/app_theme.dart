import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87, fontFamily: "mononoki"),
      titleMedium: TextStyle(color: Colors.black, fontFamily: "mononoki", fontWeight: FontWeight.bold),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    iconTheme: const IconThemeData(color: Colors.green),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.green,
      textColor: Colors.black87,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Colors.greenAccent.withOpacity(0.3),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontFamily: "mononoki", color: Colors.black87),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.greenAccent,
      foregroundColor: Colors.black,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white, fontFamily: "mononoki"),
      titleMedium: TextStyle(color: Colors.white, fontFamily: "mononoki", fontWeight: FontWeight.bold),
    ),
    cardTheme: CardThemeData(
      color: Colors.black26,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    iconTheme: const IconThemeData(color: Colors.greenAccent),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.greenAccent,
      textColor: Colors.white70,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black45,
      indicatorColor: Colors.greenAccent.withOpacity(0.3),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontFamily: "mononoki", color: Colors.white70),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}