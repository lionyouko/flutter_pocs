import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final void Function() deleteTaskCallback;

  TaskTile(this.taskTitle, this.isChecked, this.checkboxCallback,
      this.deleteTaskCallback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        //3 callback then changes this value as it makes build checkbox with the new value of the older checkbox
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        //2 callback is used here, triggering the rebuild because has a reset
        onChanged: checkboxCallback,
      ),
      onLongPress: deleteTaskCallback,
    );
  }
}
