import 'package:app_calculadora/views/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_calculadora/views/home_screen.dart';

void main() {
  runApp(const Project_App_Calculator());
}

// ignore: camel_case_types
class Project_App_Calculator extends StatelessWidget {
  const Project_App_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Calculadora',
      debugShowCheckedModeBanner:
          false, //Serve para remover a faixa de debug no canto superior direito
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/calculadora': (context) => const CalculatorScreen(),
      },
    );
  }
}
