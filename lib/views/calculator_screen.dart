import 'package:app_calculadora/components/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:app_calculadora/main.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  String history = '';
  bool abreParentese = true;

  void addToDisplay(String value) {
    setState(() {
      if (display == '0') {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void applyPorcentage() {
    try {
      final number = double.parse(display);
      setState(() {
        display = (number / 100).toString();
      });
    } catch (e) {}
  }

  void alternateSign() {
    setState(() {
      if (display.startsWith('-')) {
        display = display.substring(1);
      } else if (display != '0') {
        display = '-$display';
      }
    });
  }

  void clearDisplay() {
    setState(() {
      display = '0';
      history = '';
    });
  }

  void insertParentheses() {
    setState(() {
      if (display == '0') display = '';
      display += abreParentese ? '(' : ')';
      abreParentese = !abreParentese;
    });
  }

  void calculateResult(){
    try{
      final parser = ShuntingYardParser();
      final expression = parser.parse(display.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      setState((){
        history = display;
        display = eval.toStringAsFixed(2);
      })
    }catch (e){
      mostrarErro('Erro ao calcular');
    }
  }

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget button(String text, {Color? colorText, required VoidCallback onPressed}){
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colorText ?? Theme.of(context).textTheme.bodyLarge!.color,
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: Text(text),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const CustomAppBar(), body: Stack());
  }
}
