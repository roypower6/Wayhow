import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayhow/controllers/theme_controller.dart';
import 'package:wayhow/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeController
    Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Wayhow',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF0D1),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF0D1),
        brightness: Brightness.light,
        primaryColor: const Color(0xFF795757),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF795757),
          secondary: Color(0xFFF87C4C),
          error: Color(0xFFFF4552),
          background: Color(0xFFFFF0D1),
        ),
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B3030),
        ),
        scaffoldBackgroundColor: const Color(0xFF3B3030),
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFFF0D1),
        primaryColorDark: const Color(0xFF3B3030),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFF0D1),
          secondary: Color(0xFFF87C4C),
          error: Color(0xFFFF4552),
          background: Color(0xFF3B3030),
          surface: Color(0xFF2C2C2C),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
