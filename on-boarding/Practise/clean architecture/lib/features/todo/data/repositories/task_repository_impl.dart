import 'package:dartz/dartz.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';

import '../../../../core/error/failures.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    List<TaskModel> tasks = [
      const TaskModel(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
      ),
      const TaskModel(
        iconText: 'P',
        titleText: 'Project Planning',
        descriptionText: 'UI/UX APP Design',
        dateText: 'May, 15, 2023',
        taskId: '2',
      ),
    ];
    
    try {
      return Right(tasks);
    } catch (e) {
      return const Left(DatabaseFailure("Database failure"));
    }
  }
  
  @override
  addTask(TaskModel newTask) {
    throw UnimplementedError();
  }
  
  @override
  deleteTask(TaskModel task) {
    throw UnimplementedError();
  }
  
  @override
  updateTask(TaskModel task) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, TaskModel>> getTask({required id}) {
    throw UnimplementedError();
  }
}
