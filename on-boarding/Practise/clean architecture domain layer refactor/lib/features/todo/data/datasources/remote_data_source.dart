import '../models/task_model.dart';

abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(int id);
}
