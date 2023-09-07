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

  final CreateTaskUseCase createTask;
  final DeleteTaskUseCase deleteTask;
  final GetTaskUseCase getTask;
  final GetTasksUseCase getTasks;
  final UpdateTaskUseCase updateTask;

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
    final originalTasks = (state as TaskLoaded).tasks;
    final filteredTasks = originalTasks.where((task) {
      return task.titleText.toLowerCase().contains(event.query.toLowerCase());
    }).toList();
    emit(TaskLoaded(filteredTasks: filteredTasks));
  }

  // FutureOr<void> _onFilterArticles(
//   FilterArticles event,
//   Emitter<ArticleState> emit,
// ) async {
//   final articlesEither = await getArticles(NoParams());

//   articlesEither.fold(
//     (failure) {
//       final errorMessage = mapFailureToMessage(failure);
//       emit(ArticleError(errorMessage));
//     },
//     (articles) {
//       emit(ArticleLoaded(articles: articles));
//     },
//   );

//   final originalArticles = (state as ArticleLoaded).articles;
//   final filteredArticles = originalArticles.where((article) {
  // Check if any tag contains the query (case-insensitive)
//     return article.tags.any((tag) =>
//         tag.toLowerCase().contains(event.query.toLowerCase()));
//   }).toList();

//   emit(ArticleLoaded(filteredArticles: filteredArticles));
// }

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
}
