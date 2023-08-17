import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading()) {
    on<LoadTasks>(_onLoadTasks);
    on<LoadTask>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  FutureOr<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) {
    emit(
      TaskLoaded(tasks: event.tasks),
    );
  }

  FutureOr<void> _onLoadTask(LoadTask event, Emitter<TaskState> emit) {}

  FutureOr<void> _onAddTask(AddTask event, Emitter<TaskState> emit) {}

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {}

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {}
}
