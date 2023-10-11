import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  Future.delayed(threeSeconds, () {
    String result = 'task 2 data';
    print('Task 2 complete');
  });
  // sleep(threeSeconds);
  String result = 'task 2_2 data';
  print('Task 2_2 complete');
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
