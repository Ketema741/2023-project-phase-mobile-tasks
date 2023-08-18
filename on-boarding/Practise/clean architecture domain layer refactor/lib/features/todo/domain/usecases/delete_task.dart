import 'package:dartz/dartz.dart';
import 'package:layout_basics/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../repositories/task_repository.dart';

class DeleteTaskUseCase extends UseCase<String, DeleteTaskParams> {
  final TaskRepository taskRepository;
  DeleteTaskUseCase(this.taskRepository);
  
  @override
  Future<Either<Failure, String>> call(DeleteTaskParams params) async {
    return await taskRepository.deleteTask(params.id);
  }

}
