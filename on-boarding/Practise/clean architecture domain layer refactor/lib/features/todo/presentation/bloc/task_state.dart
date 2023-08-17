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

final class Error extends TaskState {
  final String message;
  const Error({this.message = "Error message"});

  @override
  List<Object> get props => [message];
}
