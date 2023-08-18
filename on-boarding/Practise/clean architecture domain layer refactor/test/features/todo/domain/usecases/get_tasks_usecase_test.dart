import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_tasks.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_helper.mocks.dart';

void main() {
  late GetTasksUseCase usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTasksUseCase(mockTaskRepository);
  });

  // const tNumber = 1;
  List<TaskModel> tTasks = [
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

  test(
    'should get tasks from the repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTasks())
          .thenAnswer((_) async => Right(tTasks)); // Return a List<TaskModel>

      // Act
      final result = await usecase(NoParams());

      // Assert
      expect(result, Right(tTasks));
    },
  );

  
}
