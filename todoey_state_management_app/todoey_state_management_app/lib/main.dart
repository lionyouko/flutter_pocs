import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_state_management_app/models/task_data.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //implementing provider with this changenotifier provider
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TaskData();
      },
      child: MaterialApp(
        title: 'Todoey',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const TasksScreen(),
      ),
    );
  }
}
