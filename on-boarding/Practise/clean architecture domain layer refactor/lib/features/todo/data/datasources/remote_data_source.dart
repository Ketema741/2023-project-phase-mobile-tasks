import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> addTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<String> deleteTask(String id);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final SharedPreferences sharedPreferences;

  RemoteDataSourceImp({required this.sharedPreferences});

  @override
  Future<TaskModel> addTask(TaskModel task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<String> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
