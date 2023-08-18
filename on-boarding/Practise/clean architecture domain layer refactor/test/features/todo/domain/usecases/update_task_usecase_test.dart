import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/usecase/usecase.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/update_task.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/test_helper.mocks.dart';

void main() {
  late UpdateTaskUseCase usecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecase = UpdateTaskUseCase(mockTaskRepository);
  });

  TaskModel tTask = const TaskModel(
    iconText: 'U',
    titleText: 'UI/UX APP Design',
    descriptionText: 'UI/UX APP Design',
    dateText: 'April, 29, 2023',
    taskId: '1',
    taskColor: Color.fromARGB(2, 2, 122, 23),
  );

  test("It should update task Model", () async {
    // arrange
    when(mockTaskRepository.updateTask(tTask)).thenAnswer((_) async => Right(tTask));

    // act
      final result = await usecase(UpdateTaskParams(task: tTask));

    // assert
    expect(result, equals(Right(tTask)));
  });
}
