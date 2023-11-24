import 'package:flutter/material.dart';
import 'package:todoey_state_management_app/widgets/task_list.dart';
import 'package:todoey_state_management_app/screens/add_task_screen.dart';
import 'package:todoey_state_management_app/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // now we passing the state since this part, instead of task_list, but now they are in the highest point of widget tree
  List<Task> tasks = [
    Task('Buy Milk'),
    Task('Buy Eggs'),
    Task('Buy Shame'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: buildButtomSHeet,
          );
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    size: 30,
                    color: Colors.lightBlueAccent,
                    Icons.list,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TaskList(tasks),
            ),
          )
        ],
      ),
    );
  }

  Widget buildButtomSHeet(BuildContext context) =>
      AddTaskScreen((newTaskTitle) {
        setState(() {
          tasks.add(Task(newTaskTitle));
        });
        //pop the buttomsheet
        Navigator.pop(context);
      });
}
