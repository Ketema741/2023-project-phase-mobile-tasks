part of 'task_bloc.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage =
    'Invalid Input - The number must be a positive integer or zero.';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskLoading extends TaskState {}

final class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  const TaskLoaded({this.tasks = const <TaskModel>[]});

  @override
  List<Object> get props => [tasks];
}

final class TaskLoadedSingle extends TaskState {
  final String id;
  const TaskLoadedSingle({this.id = "1"});

  @override
  List<Object> get props => [id];
}

class TaskCreated extends TaskState {
  final TaskModel task;

  const TaskCreated({required this.task});

  @override
  List<Object> get props => [task];
}

class TaskDeleted extends TaskState {}
class TaskUpdated extends TaskState {
  final TaskModel updatedTask;

  const TaskUpdated({required this.updatedTask});

  @override
  List<Object> get props => [updatedTask];
}


final class TaskError extends TaskState {
  final String message;
  const TaskError(String mapFailureToMessage, {this.message = "Error message"});

  @override
  List<Object> get props => [message];
}
