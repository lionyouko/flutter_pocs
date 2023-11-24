import 'package:flutter/material.dart';
import 'package:todoey_state_management_app/models/task.dart';
import 'package:todoey_state_management_app/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this is the special function that builds list saving resources (much easier than in android)
    return Consumer(
      builder: (BuildContext context, TaskData taskData, Widget? child) {
        return ListView.builder(
          //context is BuildContext (tells where widget lives), and index is
          itemBuilder: (context, index) {
            Task task = taskData.tasks[index];
            // we not only build the listview builder, but we lifted again the state up, but this is hard to be doing
            return TaskTile(
              task.name,
              task.isDone,
              (bool? currentCheckBoxState) {
                //we will maintain the callback in this one even with provider
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
