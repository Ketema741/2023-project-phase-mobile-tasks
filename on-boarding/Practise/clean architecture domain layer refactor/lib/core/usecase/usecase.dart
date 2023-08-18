import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/todo/data/models/task_model.dart';
import '../error/failures.dart';

// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Params extends Equatable {
  final String number;

  const Params({required this.number});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CreateTaskParams extends Equatable {
  final TaskModel task;

  const CreateTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTaskParams extends Equatable {
  final TaskModel task;

  const UpdateTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}
class DeleteTaskParams extends Equatable {
  final String id;

  const DeleteTaskParams({required this.id});

  @override
  List<Object?> get props => [id];
}

