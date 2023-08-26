
import '../models/task_model.dart';

abstract class LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [
      const TaskModel(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
      ),
      const TaskModel(
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
  Future<void> addTask(TaskModel task) async {
    // Implement adding a task to the local database or storage
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    // Implement updating a task in the local database or storage
  }

  @override
  Future<void> deleteTask(TaskModel task) async {
    // Implement deleting a task from the local database or storage
  }
}
