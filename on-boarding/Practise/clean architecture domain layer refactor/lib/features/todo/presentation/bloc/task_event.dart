part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {
  final List<TaskModel> tasks;
  const LoadTasks({this.tasks = const <TaskModel>[]});
}

class LoadTask extends TaskEvent {
  final String id;
  const LoadTask({required this.id});
}

class LoadTaskSingle extends TaskEvent {
  final String id;
  const LoadTaskSingle({required this.id, required TaskModel task});
}

class CreateTask extends TaskEvent {
  final TaskModel task;
  const CreateTask({required this.task});
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  const UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final String id;
  const DeleteTask({required this.id});
}
