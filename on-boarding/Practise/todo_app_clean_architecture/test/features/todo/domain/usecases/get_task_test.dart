import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/usecases/get_task.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/task.dart';

import 'get_task_test.mocks.dart';

@GenerateMocks([TaskRepository])

void main() {
  late GetTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTask(mockTaskRepository);
  });

  const tTaskId = 1;
  final tTask = Task(
    id: tTaskId,
    title: "Test Title",
    description: "Test Description",
    dueDate: DateTime.now(),
  );

  test('should get task from repository', () async {
    when(mockTaskRepository.getTask(tTaskId))
        .thenAnswer((_) async => Right(tTask));

    final result = await usecase(Params(id: tTaskId));

    expect(result, Right(tTask));
    verify(mockTaskRepository.getTask(tTaskId));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
