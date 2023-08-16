import 'package:dartz/dartz.dart';

import 'package:layout_basics/core/error/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/task_model.dart';
import '../repositories/task_repository.dart';

class UpdateTaskUseCase extends UseCase<TaskModel, UpdateTaskParams> {
  final TaskRepository taskRepository;

  UpdateTaskUseCase(this.taskRepository);

  @override
  Future<Either<Failure, TaskModel>> call(UpdateTaskParams params) async {
    return await taskRepository.updateTask(params.task);
  }
}
