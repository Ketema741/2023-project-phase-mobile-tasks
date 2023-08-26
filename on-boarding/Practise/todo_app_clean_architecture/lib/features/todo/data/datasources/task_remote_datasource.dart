import '../../domain/entities/task.dart';
import '../models/task_model.dart';


abstract class TaskRemoteDataSource {
  Future<TaskModel> createTask(Task task);
  Future<TaskModel> getTask(int id);
  Future<TaskModel> updateTask(Task task);
  Future<TaskModel> completeTask(int id);
  Future<TaskModel> removeTask(int id);
  Future<List<TaskModel>> viewAllTasks();
}