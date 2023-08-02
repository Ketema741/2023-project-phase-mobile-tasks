import 'dart:io';

class Task {
  String? title;
  String? description;
  DateTime dueDate;
  bool completed;

  Task(this.title, this.description, this.dueDate, {this.completed = false});

  void markAsCompleted() {
    completed = true;
  }

  void markAsPending() {
    completed = false;
  }

  @override
  String toString() {
    String statusEmoji = completed ? "✅" : "🕒";
    return '📌 Title: $title\n📝 Description: $description\n⏰ Due Date: $dueDate\n$statusEmoji Status: ${completed ? "Completed" : "Pending"}\n';
  }
}

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
        String? title = stdin.readLineSync();

        stdout.write("Enter task description: ");
        String? description = stdin.readLineSync();

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
