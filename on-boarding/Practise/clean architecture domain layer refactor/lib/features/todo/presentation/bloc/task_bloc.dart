import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase getTasks;
  final GetTaskUseCase getTask;
  final CreateTaskUseCase createTask;
  final DeleteTaskUseCase deleteTask;
  final UpdateTaskUseCase updateTask;
  TaskBloc(
    this.getTasks,
    this.getTask,
    this.createTask,
    this.deleteTask,
    this.updateTask,
  ) : super(TaskLoading()) {
    on<LoadTasks>(_onLoadTasks);
    on<LoadTaskSingle>(_onLoadTask);
    on<CreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<FilterTasks>(_onFilterTasks);
  }

  FutureOr<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading()); // Emit loading state

    final tasksEither = await getTasks(NoParams()); // Call the use case

    tasksEither.fold(
      (failure) {
        final errorMessage = mapFailureToMessage(failure);
        emit(TaskError(errorMessage)); // Emit error state
      },
      (tasks) {
        emit(TaskLoaded(tasks: tasks)); // Emit success state with tasks
      },
    );
  }

  FutureOr<void> _onFilterTasks(
    FilterTasks event,
    Emitter<TaskState> emit,
  ) async {
    if (state is TaskLoaded) {
      final filteredTasks = (state as TaskLoaded)
          .tasks
          .where((task) =>
              task.titleText.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(FilteredTasks(tasks: filteredTasks));
    }
  }
  

  FutureOr<void> _onLoadTask(
      LoadTaskSingle event, Emitter<TaskState> emit) async {
    emit(TaskLoading()); // Emit loading state

    final taskEither = await getTask(Params(number: event.id));

    taskEither.fold(
      (failure) {
        final errorMessage = mapFailureToMessage(failure);
        emit(TaskError(errorMessage)); // Emit error state
      },
      (task) {
        emit(const TaskLoadedSingle(
            id: '1')); // Emit success state with the single task
      },
    );
  }

  FutureOr<void> _onCreateTask(
      CreateTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading()); // Emit loading state

    final taskEither = await createTask(
      CreateTaskParams(task: event.task),
    );

    taskEither.fold(
      (failure) {
        final errorMessage = mapFailureToMessage(failure);
        emit(
          TaskError(errorMessage),
        ); // Emit error state
      },
      (task) {
        emit(
          TaskCreated(task: event.task),
        ); // Emit success state indicating task addition
      },
    );
  }

  FutureOr<void> _onDeleteTask(
      DeleteTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading()); // Emit loading state

    final deleteEither = await deleteTask(DeleteTaskParams(id: event.id));

    deleteEither.fold(
      (failure) {
        final errorMessage = mapFailureToMessage(failure);
        emit(TaskError(errorMessage)); // Emit error state
      },
      (_) {
        emit(TaskDeleted()); // Emit success state indicating task deletion
      },
    );
  }

  FutureOr<void> _onUpdateTask(
      UpdateTask event, Emitter<TaskState> emit) async {
    final updateEither = await updateTask(UpdateTaskParams(task: event.task));

    updateEither.fold(
      (failure) {
        final errorMessage = mapFailureToMessage(failure);
        emit(TaskError(errorMessage)); // Emit failure state
      },
      (_) {
        emit(TaskUpdated(updatedTask: event.task)); // Emit success state
      },
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error';
      case ConnectionFailure:
        return 'Connection Error';
      case DatabaseFailure:
        return 'Database Error';
      default:
        return 'An unexpected error occurred';
    }
  }
}
