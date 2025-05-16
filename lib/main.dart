import 'package:app_calculadora/styles/style.dart';
import 'package:app_calculadora/views/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_calculadora/views/home_screen.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
void main() {
  runApp(const Project_App_Calculator());
}

// ignore: camel_case_types
class Project_App_Calculator extends StatelessWidget {
  const Project_App_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'App Calculadora',
          debugShowCheckedModeBanner:
              false, //Serve para remover a faixa de debug no canto superior direito
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: currentMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/calculadora': (context) => const CalculatorScreen(),
          },
        );
      },
    );
  }
}
