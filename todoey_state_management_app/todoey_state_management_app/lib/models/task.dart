class Task {
  final String name;
  bool isDone;
  Task(this.name) : isDone = false;

  void toggleDone() => isDone = !isDone;
}
