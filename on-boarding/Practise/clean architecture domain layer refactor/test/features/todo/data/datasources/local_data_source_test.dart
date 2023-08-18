import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late LocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = LocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getLastTask', () {
    test(
      'should return null when there is no data in SharedPreferences',
      () async {
        // arrange
        when(mockSharedPreferences.getString('CACHED_TASK'))
            .thenReturn(null); // No cached data
        // act
        final result = await dataSource.getTask('CACHED_TASK');
        // assert
        verify(mockSharedPreferences.getString('CACHED_TASK'));
        expect(result, isNull); // Verify that the result is null
      },
    );

    final tasks = [
      const TaskModel(
        iconText: 'U',
        titleText: 'UI/UX APP Design',
        descriptionText: 'UI/UX APP Design',
        dateText: 'April, 29, 2023',
        taskId: '1',
        taskColor: Color.fromARGB(0, 2, 23, 232),
        isCompleted: false,
      ),
    ];

    test(
      'should return true when storing tasks is successful',
      () async {
        // act
        await dataSource.storeTasks(tasks);
        final tasksJson = tasks.map((task) => task.toJson()).toList();
        final expectedJsonString = json.encode(tasksJson);
        // assert
        verify(
          mockSharedPreferences.setString('CACHED_TASK', expectedJsonString),
        );
      },
    );
  });
}
