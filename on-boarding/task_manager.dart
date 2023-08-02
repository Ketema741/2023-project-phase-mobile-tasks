import 'task.dart';
import 'dart:io';

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print("No tasks found. 📭");
      return;
    }
    for (int i = 0; i < tasks.length; i++) {
      print('Task ${i + 1}:');
      print(tasks[i]);
    }
  }

  void viewCompletedTasks() {
    final completedTasks = tasks.where((task) => task.completed).toList();
    if (completedTasks.isEmpty) {
      print("No completed tasks found. ✅");
      return;
    }
    for (int i = 0; i < completedTasks.length; i++) {
      print('Completed Task ${i + 1}:');
      print(completedTasks[i]);
    }
  }

  void viewPendingTasks() {
    final pendingTasks = tasks.where((task) => !task.completed).toList();
    if (pendingTasks.isEmpty) {
      print("No pending tasks found. 🕒");
      return;
    }
    for (int i = 0; i < pendingTasks.length; i++) {
      print('Pending Task ${i + 1}:');
      print(pendingTasks[i]);
    }
  }

  void editTask(int index) {
    if (index >= 0 && index < tasks.length) {
      Task task = tasks[index];
      print("Current Task Details:");
      print(task);

      stdout.write("Enter new title or leave empty to keep current: ");
      String? newTitle = stdin.readLineSync();
      if (newTitle != null) {
        task.title = newTitle;
      }

      stdout.write("Enter new description or leave empty to keep current: ");
      String? newDescription = stdin.readLineSync();
      if (newDescription != null) {
        task.description = newDescription;
      }

      stdout.write("Enter new due date or leave empty to keep current: ");
      String? newDueDate = stdin.readLineSync();
      if (newDueDate != null) {
        task.dueDate = DateTime.parse(newDueDate);
      }

      stdout.write("Is the task completed? (yes/no): ");
      String? completedStatus = stdin.readLineSync()?.toLowerCase()?? "no";
      if (completedStatus == 'yes') {
        task.markAsCompleted();
      } else {
        task.markAsPending();
      }

      print("Task updated successfully.");
    } else {
      print("Invalid task index.");
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      print("Task deleted successfully.");
    } else {
      print("Invalid task index.");
    }
  }
}