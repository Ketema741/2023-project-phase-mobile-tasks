import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getTasks();
  Future<Either<Failure, TaskModel>> getTask(String id);

  Future<Either<Failure, TaskModel>> updateTask(TaskModel task);

  Future<Either<Failure, String>> deleteTask(String id);

  Future<Either<Failure, Task>> createTask(TaskModel newTask);
}
