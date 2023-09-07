import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/error/failures.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/core/usecase/usecase.dart';

class CreateTaskUseCase implements UseCase<Task, CreateTaskParams> {
  final TaskRepository repository;

  CreateTaskUseCase(this.repository);

  @override
  Future<Either<Failure, Task>> call(CreateTaskParams params) async {
    return await repository.createTask(params.task);
  }
}

