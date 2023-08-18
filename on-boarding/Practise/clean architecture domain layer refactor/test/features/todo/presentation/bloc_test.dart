import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/utils/input_converter.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/create_task.dart';
import 'package:layout_basics/features/todo/domain/usecases/delete_task.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_task.dart';
import 'package:layout_basics/features/todo/domain/usecases/update_task.dart';
import 'package:mockito/mockito.dart';

import 'package:layout_basics/features/todo/presentation/bloc/task_bloc.dart';

import '../../../fixtures/test_helper.mocks.dart';

// Mock classes for the other use cases and dependencies
class MockGetTaskUseCase extends Mock implements GetTaskUseCase {}

class MockCreateTaskUseCase extends Mock implements CreateTaskUseCase {}

class MockDeleteTaskUseCase extends Mock implements DeleteTaskUseCase {}

class MockUpdateTaskUseCase extends Mock implements UpdateTaskUseCase {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late MockGetTasksUseCase mockGetTasksUseCase;
  late MockGetTaskUseCase mockGetTaskUseCase;
  late MockCreateTaskUseCase mockCreateTaskUseCase;
  late MockDeleteTaskUseCase mockDeleteTaskUseCase;
  late MockUpdateTaskUseCase mockUpdateTaskUseCase;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetTasksUseCase = MockGetTasksUseCase();
    mockGetTaskUseCase = MockGetTaskUseCase();
    mockCreateTaskUseCase = MockCreateTaskUseCase();
    mockDeleteTaskUseCase = MockDeleteTaskUseCase();
    mockUpdateTaskUseCase = MockUpdateTaskUseCase();
    mockInputConverter = MockInputConverter();
  });

  group('TaskBloc', () {
    late TaskBloc taskBloc;

    setUp(() {
      taskBloc = TaskBloc(
        mockGetTasksUseCase,
        mockGetTaskUseCase,
        mockCreateTaskUseCase,
        mockDeleteTaskUseCase,
        mockUpdateTaskUseCase,
      );
    });

    tearDown(() {
      taskBloc.close();
    });

    test('initial state is TaskLoading', () {
      expect(taskBloc.state, TaskLoading());
    });

    blocTest<TaskBloc, TaskState>(
      'emits TaskLoaded when LoadTasks is added',
      build: () => taskBloc,
      act: (bloc) => bloc.add(const LoadTasks(tasks: [
        TaskModel(
          iconText: 'U',
          titleText: 'UI/UX APP Design',
          descriptionText: 'UI/UX APP Design',
          dateText: 'April, 29, 2023',
          taskId: '1',
          taskColor: Colors.red,
          isCompleted: true,
        )
      ])),
      expect: () => [
        const TaskLoaded(tasks: [
          TaskModel(
            iconText: 'U',
            titleText: 'UI/UX APP Design',
            descriptionText: 'UI/UX APP Design',
            dateText: 'April, 29, 2023',
            taskId: '1',
            taskColor: Colors.red,
            isCompleted: true,
          )
        ])
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'emits TaskLoaded when LoadTask is added',
      build: () => taskBloc,
      act: (bloc) => bloc.add(const LoadTask(id: "1")),
      expect: () => [], // Add expected state after handling LoadTask event
    );

    // Add more tests for AddTask, UpdateTask, DeleteTask events
  });
}
