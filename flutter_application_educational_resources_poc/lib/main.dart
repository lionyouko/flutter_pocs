import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Educational Resource PoC'),
          backgroundColor: Colors.amberAccent,
        ),
        body: const Center(
          child: Text('Educational Hints Everyday!'),
        ),
      ),
    );
  }
}
