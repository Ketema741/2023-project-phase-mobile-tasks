import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task_model.dart';

abstract class LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel?> getTask(String id);
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<String> deleteTask(String id);

  Future<bool> storeTasks(List<TaskModel> tasks);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TaskModel>> getTasks() async {
    final tasksString = sharedPreferences.getString('CACHED_TASK');
    if (tasksString != null) {
      final tasksJson = jsonDecode(tasksString) as List<dynamic>;
      return tasksJson.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
    } else {
      return [];
    }
  }

 @override
Future<TaskModel?> getTask(String id) async {
  final tasks = await getTasks();

  for (var task in tasks) {
    if (task.taskId == id) {
      return task; // Return the found task
    }
  }

  return null; // Return null if no task is found
}


  @override
  Future<TaskModel> createTask(TaskModel task) async {
    final tasks = await getTasks();
    tasks.add(task);
    await storeTasks(tasks);
    return task;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((t) => t.taskId == task.taskId);
    if (index != -1) {
      tasks[index] = task;
      await storeTasks(tasks);
      return task;
    }

    return task;
  }

  @override
  Future<String> deleteTask(String id) async {
    final tasks = await getTasks();
    tasks.removeWhere((t) => t.taskId == id);
    await storeTasks(tasks);
    return "Task removed successfully";
  }

  @override
  Future<bool> storeTasks(List<TaskModel> tasks) async {
    try {
      final tasksJson = tasks.map((task) => task.toJson()).toList();
      final tasksString = json.encode(tasksJson);
      await sharedPreferences.setString('CACHED_TASK', tasksString);
      return true; // Return true if storing is successful
    } catch (e) {
      return false; // Return false if an error occurs during storing
    }
  }
}
