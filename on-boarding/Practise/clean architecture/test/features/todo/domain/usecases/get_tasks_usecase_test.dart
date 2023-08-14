import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/features/todo/domain/entities/task.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_tasks_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
   late GetTasksUseCase usecase;
   late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTasksUseCase(mockTaskRepository);
  });

  // const tNumber = 1;
  List<Todo> tTasks = [
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

  test(
    'should get tasks from the repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTasks())
          .thenAnswer((_) async =>  Right(tTasks)); // Return a List<Todo>

      // Act
      final result = await usecase.execute();

      // Assert
      expect(result,  Right(tTasks));
    },
  );
}
