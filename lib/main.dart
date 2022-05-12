import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // i can specify the theme for the page or the widget or what ever i want like button

      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}
