import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 5, 7, 17),
        primaryColor: Color.fromARGB(255, 5, 7, 17),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 7, 17),
        ),
      ),
      home: InputPage(),
    );
  }
}
