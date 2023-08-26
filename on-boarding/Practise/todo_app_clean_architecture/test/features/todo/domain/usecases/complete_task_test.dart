import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/usecases/complete_task.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/task.dart';


import 'complete_task_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late CompleteTask usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = CompleteTask(mockTaskRepository);
  });

  const tTaskId = 1;
  final tTask = Task(
    id: tTaskId,
    title: "Test Title",
    description: "Test Description",
    dueDate: DateTime.now(),
    isCompleted: true,
  );

  test('should complete a task from repository', () async {
    when(mockTaskRepository.completeTask(tTaskId))
        .thenAnswer((_) async => Right(tTask));

    final result = await usecase(Params(id: tTaskId));

    expect(result, Right(tTask));
    verify(mockTaskRepository.completeTask(tTaskId));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
