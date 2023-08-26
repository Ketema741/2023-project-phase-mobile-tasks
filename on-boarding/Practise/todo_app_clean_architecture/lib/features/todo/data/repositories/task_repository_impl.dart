import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_app_clean_architecture/core/error/exceptions.dart';
import 'package:todo_app_clean_architecture/core/error/failures.dart';
import 'package:todo_app_clean_architecture/features/todo/data/models/task_model.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/task.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/network/network_info.dart';
import '../datasources/task_local_datasource.dart';
import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Task>> completeTask(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Task>> createTask(Task task) async {
    final taskModel = await localDataSource.createTask(task.toModel());
    return Right(taskModel.toEntity());
  }

  @override
  Future<Either<Failure, Task>> getTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.getTask(id);
        localDataSource.cacheTask(remoteTask);
        return Right(remoteTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTask = await localDataSource.getTask(id);
        return Right(localTask);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Task>> removeTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.removeTask(id);
        final taskModel = await localDataSource.removeTask(id);
        return Right(taskModel.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure());
      }
    } else {
      final taskModel = await localDataSource.removeTask(id);
      return Right(taskModel.toEntity());
    }
  }
  
  @override
  Future<Either<Failure, Task>> updateTask(Task task) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.updateTask(task.toModel()));
      } on ServerException catch (e) {
        return Left(ServerFailure());
      }
    } else {
      final taskModel = await localDataSource.updateTask(task.toModel());
      return Right(taskModel.toEntity());
    }
  }
  
  
  @override
  Future<Either<Failure, List<Task>>> viewAllTasks() async {
    List<TaskModel> taskModels;

    if (await networkInfo.isConnected) {
      taskModels = await remoteDataSource.viewAllTasks();
    } else {
      taskModels = await localDataSource.viewAllTasks();
    }

    final tasks = taskModels.map((e) => e.toEntity()).toList();
    return Right(tasks);
  }


}
