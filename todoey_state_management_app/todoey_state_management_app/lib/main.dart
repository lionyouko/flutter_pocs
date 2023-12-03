import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_state_management_app/models/task_data.dart';
import 'package:todoey_state_management_app/service/theme_service.dart';
import 'package:todoey_state_management_app/themes.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeService();
      },
      child: const MyApp()));
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
      child: Consumer<ThemeService>(builder: (context, themeService, child) {
        return MaterialApp(
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const TasksScreen(),
        );
      }),
    );
  }
}
