import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/task_model.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskModel>>> getTasks();
  Future<Either<Failure, TaskModel>> getTask({required id});

  updateTask(TaskModel task) {}

  deleteTask(TaskModel task) {}

  addTask(TaskModel newTask) {}

}
