import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/create_task.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late CreateTaskUseCase usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = CreateTaskUseCase(mockTaskRepository);
  });

  // const tNumber = 1;
  TaskModel tTask = const TaskModel(
    iconText: 'U',
    titleText: 'UI/UX APP Design',
    descriptionText: 'UI/UX APP Design',
    dateText: 'April, 29, 2023',
    taskId: '3',
  );

  test(
    'should add task to the repository',
    () async {
      // Arrange
      when(mockTaskRepository.addTask(tTask))
          .thenAnswer((_) async => Right(tTask)); // Return a TaskModel

      // Act
      final result = await usecase(CreateTaskParams(task: tTask));

      // Assert
      expect(result, Right(tTask));
    },
  );
}
