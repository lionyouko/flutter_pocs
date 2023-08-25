import 'package:flutter/material.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Educational Resource PoC')),
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: Text('Educational Hints Everyday!'),
        ),
        backgroundColor: const Color.fromARGB(255, 241, 230, 227),
      ),
    );
  }
}
