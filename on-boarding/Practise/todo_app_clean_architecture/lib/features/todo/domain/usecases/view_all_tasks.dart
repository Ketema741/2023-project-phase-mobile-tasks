import 'package:dartz/dartz.dart' hide Task;
import 'package:todo_app_clean_architecture/core/error/failures.dart';
import 'package:todo_app_clean_architecture/core/usecases/usecase.dart';

import '../entities/task.dart';
import '../repositories/task_repository.dart';

class ViewAllTasks implements UseCase<List<Task>, NoParams> {
    final TaskRepository repository;

  ViewAllTasks(this.repository);
  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.viewAllTasks();
  }

}