import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/task_model.dart';

/// Interface for remote data source
abstract class RemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<TaskModel> deleteTask(String id);
}

/// Implementation of [TaskRemoteDataSource]
class RemoteDataSourceImp extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImp({required this.client});

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    try {
      final response = await client.post(
        Uri.parse(apiBaseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()),
      );

      if (response.statusCode == 200) {
        try {
          final decoded = jsonDecode(response.body)['data'];

          final taskModel = TaskModel.fromJson(decoded);
          return taskModel;
        } on FormatException {
          throw ServerException.invalidResponse();
        }
      } else {
        throw ServerException.operationFailed();
      }
    } catch (e) {
      throw ServerException.connectionFailed();
    }
  }

  @override
  Future<TaskModel> deleteTask(String id) async {
    try {
      final response = await client.delete(
        Uri.parse('$apiBaseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200) {
        throw ServerException.operationFailed();
      }

      try {
        final decoded = jsonDecode(response.body)['date'];

        final taskModel = TaskModel.fromJson(decoded);

        return taskModel;
      } on FormatException {
        throw ServerException.invalidResponse();
      }
    } catch (e) {
      throw ServerException.connectionFailed();
    }
  }

  @override
  Future<TaskModel> getTask(String id) async {
    try {
      final response = await client.get(Uri.parse('$apiBaseUrl/$id'),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        try {
          final decoded = jsonDecode(response.body)['data'];
          final taskModel = TaskModel.fromJson(decoded);
          return taskModel;
        } on FormatException {
          throw ServerException.invalidResponse();
        }
      } else {
        throw ServerException.operationFailed();
      }
    } catch (e) {
      throw ServerException.connectionFailed();
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final response = await client.get(Uri.parse(apiBaseUrl),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        try {
          final decoded = jsonDecode(response.body)['data'];

          final taskModels =
              decoded.map<TaskModel>((e) => TaskModel.fromJson(e)).toList();

          return taskModels;
        } catch (e) {
          throw ServerException.invalidResponse();
        }
      } else {
        throw ServerException.operationFailed();
      }
    } catch (e) {
      throw ServerException.connectionFailed();
    }
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    try {
      final response = await client.put(
        Uri.parse('$apiBaseUrl/${task.taskId}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(task.toJson()),
      );

      if (response.statusCode != 200) {
        throw ServerException.operationFailed();
      }

      return task;
    } catch (e) {
      throw ServerException.connectionFailed();
    }
  }
}