import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:todo_app_clean_architecture/core/error/failures.dart';
import 'package:todo_app_clean_architecture/core/usecases/usecase.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class GetTask implements UseCase<Task, Params> {
  final TaskRepository repository;

  GetTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(Params params) async {
    return await repository.getTask(params.id);
  }
}

class Params extends Equatable {
  final int id;
  Params({required this.id});

  @override
  List<Object?> get props => [id];
}
