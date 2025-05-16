import 'package:flutter/material.dart';

class CalcColors {
  static const LinearGradient appBarNav = LinearGradient(
    colors: [
      Color.fromARGB(194, 219, 167, 132),
      Color.fromARGB(255, 202, 111, 13),
    ],
  );
  static const Color appBarText = Color.fromARGB(255, 122, 94, 94);
  static const Color shadow = Colors.black;
  static const Color white = Color.fromARGB(255, 255, 255, 255);
}

class AppTextStyles {
  static const TextStyle appBarText = TextStyle(
    fontSize: 20,
    color: CalcColors.appBarText,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textTime = TextStyle(
    fontSize: 60,
    color: CalcColors.white,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(color: CalcColors.shadow, offset: Offset(2, 2), blurRadius: 10),
    ],
  );
}

class AppThemes {
  static final light = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 20),
    ),
  );

  static final dark = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 20),
    ),
  );
}
