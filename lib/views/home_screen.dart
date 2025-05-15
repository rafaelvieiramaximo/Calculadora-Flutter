import 'package:app_calculadora/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_calculadora/controller/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String timeString;
  late String dateString;

  @override
  void initState() {
    super.initState();
    timeString = _formatTime(DateTime.now());
    dateString = _formatDate(DateTime.now());
    Future.delayed(Duration.zero, () {
      setState(() {});
    });
    _startClock();
  }

  void _startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          timeString = _formatTime(DateTime.now());
          dateString = _formatDate(DateTime.now());
        });
        _startClock();
      }
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/Math.jpeg", fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timeString, style: AppTextStyles.textTime),
                const SizedBox(height: 10),
                Text(
                  dateString,
                  style: AppTextStyles.textTime.copyWith(fontSize: 24),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 190,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                mouseCursor: SystemMouseCursors.click,
                icon: const Icon(Icons.calculate),
                iconSize: 100,
                color: const Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  NavigationController.goTo(context, '/calculadora');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
