import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/error/failures.dart';
import 'package:layout_basics/features/todo/domain/entities/task.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<Either<Failure, List<Todo>>> execute() async {
    return await repository.getTasks();
  }
}
