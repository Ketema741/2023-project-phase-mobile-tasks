import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_task.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTaskUseCase usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = GetTaskUseCase(mockTaskRepository);
  });

  // const tNumber = 1;
  TaskModel tTask = const TaskModel(
    iconText: 'U',
    titleText: 'UI/UX APP Design',
    descriptionText: 'UI/UX APP Design',
    dateText: 'April, 29, 2023',
    taskId: '1',
  );

  test(
    'should get task from the repository',
    () async {
      // Arrange
      when(mockTaskRepository.getTask("1"))
          .thenAnswer((_) async => Right(tTask)); // Return a TaskModel

      // Act
      final result = await usecase(const Params(number: "1"));

      // Assert
      expect(result, Right(tTask));
    },
  );
}
