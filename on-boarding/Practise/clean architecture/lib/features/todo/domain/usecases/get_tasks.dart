import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/error/failures.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/task_model.dart';

class GetTasksUseCase extends UseCase<List<TaskModel>, NoParams> {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  @override
  Future<Either<Failure, List<TaskModel>>> call(NoParams params) async {
    return await repository.getTasks();
  }
}

