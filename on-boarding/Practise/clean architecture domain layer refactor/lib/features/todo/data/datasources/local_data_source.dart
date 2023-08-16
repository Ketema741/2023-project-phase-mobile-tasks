import '../models/task_model.dart';

abstract class LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> addTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<TaskModel> deleteTask(TaskModel task);

  // Future<void> cacheTask(TaskModel taskToCache);
}

class LocalDataSourceImpl implements LocalDataSource {
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

  @override
  Future<List<TaskModel>> getTasks() async {
    return tasks;
  }

  @override
  Future<TaskModel> getTask(String id) async {
    TaskModel foundTask = const TaskModel(
      iconText: '',
      titleText: 'No title',
      descriptionText: 'no description',
      dateText: 'no due date',
      taskId: '',
    );

    for (var task in tasks) {
      if (task.taskId == id) {
        foundTask = task;
        break;
      }
    }

    return foundTask;
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    tasks.add(task);
    return task;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    final index = tasks.indexWhere((t) => t.taskId == task.taskId);
    if (index != -1) {
      tasks[index] = task;
      return task;
    }

    return task;
  }

  @override
  Future<TaskModel> deleteTask(TaskModel task) async {
    tasks.removeWhere((t) => t.taskId == task.taskId);
    return task;
  }
}
