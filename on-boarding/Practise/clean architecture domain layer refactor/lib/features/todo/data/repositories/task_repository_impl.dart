import 'package:dartz/dartz.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_info.dart';
import '../datasources/remote_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({required this.localDataSource, required  this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    List<TaskModel> tasks = await localDataSource.getTasks();

    try {
      return Right(tasks);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> getTask(String id) async {
    TaskModel task = await localDataSource.getTask(id);

    try {
      return Right(task);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }

  @override
  Future<Either<Failure, TaskModel>> addTask(TaskModel newTask) async {
    TaskModel result = await localDataSource.addTask(newTask);
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
  Future<Either<Failure, TaskModel>> deleteTask(TaskModel task) async {
    TaskModel result = await localDataSource.deleteTask(task);
    try {
      return Right(result);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }
}
