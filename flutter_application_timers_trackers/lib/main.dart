import 'package:flutter/material.dart';
import 'package:flutter_application_timers_trackers/day_button.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timers and Tracker PoC',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(199, 65, 144, 154),
          ),
          useMaterial3: true),
      home: const MyHomePageWithDay(
          title: 'Flutter Timers and Tracker Home Page'),
    );
  }
}

class MyHomePageWithDay extends StatefulWidget {
  const MyHomePageWithDay({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageWithDay> createState() => _MyHomePageWithDayState();
}

class _MyHomePageWithDayState extends State<MyHomePageWithDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Days'),
              Row(
                children: [
                  DayButton(dt: DateTime.now()),
                  const SizedBox(
                    width: 10,
                  ),
                  DayButton(dt: DateTime.now().add(const Duration(days: 1)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
