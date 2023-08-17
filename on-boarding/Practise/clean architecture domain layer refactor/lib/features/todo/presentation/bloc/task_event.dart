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

class AddTask extends TaskEvent {
  final TaskModel task;
  const AddTask({required this.task, required String id});
}

class UpdateTask extends TaskEvent {
  final TaskModel task;
  const UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {
  final TaskModel task;
  const DeleteTask({required this.task});
}
