import 'package:flutter/material.dart';

class NavigationController {
  static void goTo(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
