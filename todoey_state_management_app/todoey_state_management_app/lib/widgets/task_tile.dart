import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  //1 callback is defined here
  void checkboxCallback(bool? currentCheckBoxState) {
    setState(() {
      isChecked = currentCheckBoxState ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'this is a task',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(isChecked, checkboxCallback),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkboxState;
  final void Function(bool?)? toggleCheckboxState;

  const TaskCheckBox(this.checkboxState, this.toggleCheckboxState);

  @override
  Widget build(Object context) {
    return Checkbox(
      //3 callback then changes this value as it makes build checkbox with the new value of the older checkbox
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      //2 callback is used here, triggering the rebuild because has a reset
      onChanged: toggleCheckboxState,
    );
  }
}
