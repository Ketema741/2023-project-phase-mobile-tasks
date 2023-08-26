import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskModel> getTask(int id);
  Future<TaskModel> updateTask(TaskModel task);
  Future<TaskModel> completeTask(int id);
  Future<TaskModel> removeTask(int id);
  Future<List<TaskModel>> viewAllTasks();
  Future<void> cacheTask(TaskModel taskToCache);

}
