import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_state_management_app/models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  @override
  State<TaskList> createState() => _TaskListState();

  TaskList(this.tasks);
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    //this is the special function that builds list saving resources (much easier than in android)
    return ListView.builder(
      //context is BuildContext (tells where widget lives), and index is
      itemBuilder: (context, index) {
        // we not only build the listview builder, but we lifted again the state up, but this is hard to be doing
        return TaskTile(widget.tasks[index].name, widget.tasks[index].isDone,
            (bool? currentCheckBoxState) {
          setState(() {
            widget.tasks[index].toggleDone();
          });
        });
      },
      itemCount: widget.tasks.length,
    );
  }
}
