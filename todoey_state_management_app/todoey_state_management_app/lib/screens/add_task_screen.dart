import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_state_management_app/models/task.dart';
import 'package:todoey_state_management_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            //new text is given to the title
            onChanged: (value) => newTaskTitle = value,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (!(newTaskTitle == null)) {
                final task = Task(newTaskTitle!);
                //this one does not need to listen the change caused by itself as it is just a function
                Provider.of<TaskData>(context, listen: false).addTask(task);
              }

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
