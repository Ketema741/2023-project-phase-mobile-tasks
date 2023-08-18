import '../models/task_model.dart';

abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> addTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<String> deleteTask(String id);
}
