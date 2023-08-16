import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/error/failures.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import '../../data/models/task_model.dart';

class CreateTaskUseCase implements UseCase<void, CreateTaskParams> {
  final TaskRepository repository;

  CreateTaskUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateTaskParams params) async {
    return await repository.addTask(params.task);
  }
}

class CreateTaskParams {
  final TaskModel task;

  CreateTaskParams({required this.task});
}
