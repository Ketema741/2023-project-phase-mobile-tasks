import 'package:layout_basics/features/todo/domain/entities/task.dart';

abstract class LocalDataSource {
  Future<List<Todo>> getTasks();
  Future<void> addTask(Todo task);
  Future<void> updateTask(Todo task);
  Future<void> deleteTask(Todo task);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<Todo>> getTasks() async {
    List<Todo> tasks = [
      const Todo(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
      ),
      const Todo(
        iconText: 'P',
        titleText: 'Project Planning',
        descriptionText: 'UI/UX APP Design',
        dateText: 'May, 15, 2023',
        taskId: '2',
      ),
    ];
    return tasks;
  }

  @override
  Future<void> addTask(Todo task) async {
    // Implement adding a task to the local database or storage
  }

  @override
  Future<void> updateTask(Todo task) async {
    // Implement updating a task in the local database or storage
  }

  @override
  Future<void> deleteTask(Todo task) async {
    // Implement deleting a task from the local database or storage
  }
}
