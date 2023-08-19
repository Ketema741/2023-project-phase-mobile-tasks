import 'package:dartz/dartz.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;
  // final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({required this.localDataSource, required  this.networkInfo});

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    if (await networkInfo.isConnected) { // Check network connectivity
      List<TaskModel> tasks = await localDataSource.getTasks();
      return Right(tasks);
    } else {
      return const Left(ConnectionFailure("No network connection")); // Handle network failure
    }
  }
  
  @override
  Future<Either<Failure, TaskModel>> getTask(String id) async {
    if (await networkInfo.isConnected) { // Check network connectivity
      TaskModel? task = await localDataSource.getTask(id);
      return Right(task!);
    } else {
      return const Left(ConnectionFailure("No network connection")); // Handle network failure
    }
  }

  @override
  Future<Either<Failure, TaskModel>> createTask(TaskModel newTask) async {
    TaskModel result = await localDataSource.createTask(newTask);
    try {
      return Right(result);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> updateTask(TaskModel task) async {
    TaskModel result = await localDataSource.updateTask(task);
    try {
      return Right(result);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }

  @override
  Future<Either<Failure, String>> deleteTask(String id) async {
    String result = await localDataSource.deleteTask(id);
    try {
      return Right(result);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }
}
