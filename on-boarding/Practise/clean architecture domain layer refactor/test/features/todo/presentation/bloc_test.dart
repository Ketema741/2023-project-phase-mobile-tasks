import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/util/input_converter.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_task.dart';
import 'package:layout_basics/features/todo/domain/usecases/get_tasks.dart';
import 'package:layout_basics/features/todo/presentation/bloc/task_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetTasks extends Mock
    implements GetTasksUseCase {}

class MockGetTask extends Mock implements GetTaskUseCase {}

class MockInputConverter extends Mock implements InputConverter {}


void main() {
  TaskBloc bloc;
  MockGetTasks mockGetConcreteNumberTrivia;
  MockGetTask mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;
  
  group('TaskBloc', () {
    late TaskBloc taskBloc;

    setUp(() {
      taskBloc = TaskBloc();
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
