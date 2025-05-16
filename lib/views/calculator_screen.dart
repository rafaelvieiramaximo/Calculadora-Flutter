import 'package:app_calculadora/components/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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

  void calculateResult() {
    try {
      final parser = ShuntingYardParser();
      final expression = parser.parse(display.replaceAll('x', '*'));
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      if (eval == double.infinity) {
        mostrarErro('Divisão por zero');
        return;
      }
      setState(() {
        history = display;
        display = eval.toStringAsFixed(2);
      });
    } catch (e) {
      mostrarErro('Erro ao calcular');
    }
  }

  void mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget button(
    String text, {
    Color? colorText,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            colorText ?? Theme.of(context).textTheme.bodyLarge!.color,
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.indigo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  display,
                  style: const TextStyle(fontSize: 48, color: Colors.amber),
                ),
                const SizedBox(height: 10),
                Text(
                  history,
                  style: const TextStyle(fontSize: 18, color: Colors.yellow),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "History",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(history, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                button('7', onPressed: () => addToDisplay('7')),
                button('8', onPressed: () => addToDisplay('8')),
                button('9', onPressed: () => addToDisplay('9')),
                button('/', onPressed: () => addToDisplay('/')),
                button('4', onPressed: () => addToDisplay('4')),
                button('5', onPressed: () => addToDisplay('5')),
                button('6', onPressed: () => addToDisplay('6')),
                button('x', onPressed: () => addToDisplay('x')),
                button('1', onPressed: () => addToDisplay('1')),
                button('2', onPressed: () => addToDisplay('2')),
                button('3', onPressed: () => addToDisplay('3')),
                button('-', onPressed: () => addToDisplay('-')),
                button('.', onPressed: () => addToDisplay('.')),
                button('0', onPressed: () => addToDisplay('0')),
                button('+', onPressed: () => addToDisplay('+')),
                button('C', colorText: Colors.red, onPressed: clearDisplay),
                button('()', onPressed: insertParentheses),
                button('%', onPressed: applyPorcentage),
                button(
                  '=',
                  colorText: Colors.green,
                  onPressed: calculateResult,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
