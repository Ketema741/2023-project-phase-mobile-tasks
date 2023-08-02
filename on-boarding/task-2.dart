import 'dart:io';
import 'task_manager.dart';
import 'task.dart';


void main() {
  TaskManager taskManager = TaskManager();

  while (true) {
    print("\n==== Task Manager 📝 ====");
    print("1. Add a new task");
    print("2. View all tasks");
    print("3. View completed tasks");
    print("4. View pending tasks");
    print("5. Edit a task");
    print("6. Delete a task");
    print("7. Exit");

    stdout.write("Enter your choice (1-7): ");
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter task title: ");
        String title = stdin.readLineSync() ?? "";

        stdout.write("Enter task description: ");
        String description = stdin.readLineSync()??"";

        stdout.write("Enter task due date (YYYY-MM-DD): ");
        String? dueDateInput = stdin.readLineSync();
        DateTime dueDate = DateTime.parse(dueDateInput ?? DateTime.now().toString());

        Task newTask = Task(title, description, dueDate);
        taskManager.addTask(newTask);
        print("Task added successfully. 🎉");
        break;

      case '2':
        print("📋 All Tasks:");
        taskManager.viewAllTasks();
        break;

      case '3':
        print("✅ Completed Tasks:");
        taskManager.viewCompletedTasks();
        break;

      case '4':
        print("🕒 Pending Tasks:");
        taskManager.viewPendingTasks();
        break;

      case '5':
        stdout.write("Enter the task index to edit: ");
        int editIndex = int.parse(stdin.readLineSync() ?? "-1");
        taskManager.editTask(editIndex);

        print("Task updated successfully. 🔄");
        break;

      case '6':
        stdout.write("Enter the task index to delete: ");
        int deleteIndex = int.parse(stdin.readLineSync() ?? "-1");
        taskManager.deleteTask(deleteIndex);
        print("Task deleted successfully. ❌");
        break;

      case '7':
        print("Goodbye! 👋");
        return;

      default:
        print("Invalid choice. Please try again. ❗");
    }
  }
}
