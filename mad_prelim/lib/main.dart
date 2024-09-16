import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'providers.dart';


void main() {
  final container = ProviderContainer();
  final taskService = container.read(taskServiceProvider);

  while (true) {
    print('Task Manager');
    print('1. Add Task');
    print('2. List Tasks');
    print('3. Complete Task');
    print('4. Exit');
    print('Choose an option:');

    String? option = stdin.readLineSync();
    if (option == '1') {
      print('Enter task title:');
      String? title = stdin.readLineSync();
      if (title != null && title.isNotEmpty) {
        taskService.addTask(title);
        print('Task added!');
      }
    } else if (option == '2') {
      print('Tasks:');
      for (var task in taskService.getTasks()) {
        print('${task.id}: ${task.title} (Completed: ${task.isCompleted})');
      }
    } else if (option == '3') {
      print('Enter task ID to complete:');
      String? idStr = stdin.readLineSync();
      if (idStr != null && int.tryParse(idStr) != null) {
        int id = int.parse(idStr);
        taskService.completeTask(id);
        print('Task marked as complete!');
      } else {
        print('Invalid ID');
      }
    } else if (option == '4') {
      break;
    } else {
      print('Invalid option');
    }
  }

  container.dispose();
}