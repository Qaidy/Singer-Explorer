import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme/retro_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singer Explorer',
      theme: ThemeData(
        scaffoldBackgroundColor: RetroColors.background,
        canvasColor: RetroColors.background,
        colorScheme: const ColorScheme.light(
          primary: RetroColors.titleBar,
          secondary: RetroColors.accent,
          surface: RetroColors.background,
          error: RetroColors.secondary,
        ),
        fontFamily: 'Segoe UI',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: RetroColors.foreground,
            fontSize: 14,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: RetroColors.background,
          foregroundColor: RetroColors.foreground,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: RetroColors.foreground,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
