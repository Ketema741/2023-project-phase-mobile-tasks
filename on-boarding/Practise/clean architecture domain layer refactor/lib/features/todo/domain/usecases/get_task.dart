import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/error/failures.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

import '../../data/models/task_model.dart';

class GetTaskUseCase implements UseCase<TaskModel, Params> {
  final TaskRepository repository;

  GetTaskUseCase(this.repository);

  @override
  Future<Either<Failure, TaskModel>> call(Params params) async {
    return await repository.getTask(params.number);
  }
}

