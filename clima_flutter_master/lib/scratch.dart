import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  //with this setup, task3 will use not loaded instead because nothing is making it to wait for the data.
  task1();

  task3(task2());
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  Duration threeSeconds = Duration(seconds: 3);
  String result = 'not loaded';
  Future.delayed(threeSeconds, () {
    String result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
