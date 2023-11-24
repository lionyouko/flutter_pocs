import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

// to be used with change notifier provider
class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task('Buy Milk'),
    Task('Buy Eggs'),
    Task('Buy Shame'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  //because this is the right way: we add and notify!
  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  //just a snapshot of the list
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
