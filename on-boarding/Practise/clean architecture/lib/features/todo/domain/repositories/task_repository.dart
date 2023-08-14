import 'package:dartz/dartz.dart';
import 'package:layout_basics/features/todo/domain/entities/task.dart';

import '../../../../core/error/failures.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Todo>>> getTasks();

  updateTask(Todo task) {}

  deleteTask(Todo task) {}

  addTask(Todo newTask) {}

}
