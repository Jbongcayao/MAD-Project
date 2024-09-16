import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];
  int _nextId = 1; // Start IDs from 1

  List<Task> getTasks() => _tasks;

  void addTask(String title) {
    final task = Task(id: _nextId++, title: title);
    _tasks.add(task);
  }

  void completeTask(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isCompleted: true);
    }
  }
}