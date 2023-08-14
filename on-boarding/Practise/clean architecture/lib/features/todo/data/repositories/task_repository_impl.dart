import 'package:dartz/dartz.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final LocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Todo>>> getTasks() async {
    List<Todo> tasks = [
      const Todo(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
      ),
      const Todo(
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
  addTask(Todo newTask) {
    throw UnimplementedError();
  }
  
  @override
  deleteTask(Todo task) {
    throw UnimplementedError();
  }
  
  @override
  updateTask(Todo task) {
    throw UnimplementedError();
  }
}
