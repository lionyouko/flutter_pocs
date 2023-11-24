import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_state_management_app/models/task.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task('Buy Milk'),
    Task('Buy Eggs'),
    Task('Buy Shame'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
