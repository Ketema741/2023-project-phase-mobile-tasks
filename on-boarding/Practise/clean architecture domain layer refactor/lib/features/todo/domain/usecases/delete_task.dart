import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';

import '../../../../core/error/failures.dart';
import '../repositories/task_repository.dart';

class DeleteTaskUseCase extends UseCase<TaskModel, UpdateTaskParams> {
  final TaskRepository taskRepository;
  DeleteTaskUseCase(this.taskRepository);
  
  @override
  Future<Either<Failure, TaskModel>> call(UpdateTaskParams params) async {
    return await taskRepository.deleteTask(params.task);
  }

}
