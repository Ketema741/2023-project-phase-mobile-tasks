import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_clean_architecture/core/usecases/usecase.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/usecases/view_all_tasks.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/task.dart';

import 'view_all_tasks_test.mocks.dart';

@GenerateMocks([TaskRepository])

void main() {
  late ViewAllTasks usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = ViewAllTasks(mockTaskRepository);
  });

  final tTasks = <Task>[];

  test('should get task from repository', () async {
    when(mockTaskRepository.viewAllTasks())
        .thenAnswer((_) async => Right(tTasks));

    final result = await usecase(NoParams());

    expect(result, Right(tTasks));
    verify(mockTaskRepository.viewAllTasks());
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
