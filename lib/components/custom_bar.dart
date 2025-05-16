import 'package:flutter/material.dart';
import 'package:app_calculadora/styles/style.dart';
import 'package:app_calculadora/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? nextPage;
  final bool showBackButton;

  const CustomAppBar({super.key, this.nextPage, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: CalcColors.appBarNav),
      ),
      leading: IconButton(
        icon: const Icon(Icons.home_filled),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
      actions: [
        // Replace this with your actual theme notifier logic
        IconButton(
          icon: Icon(
            themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
          onPressed: () {
            themeNotifier.value =
                themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          },
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Calculadora - ${DateTime.now().year}',
              style: AppTextStyles.appBarText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
