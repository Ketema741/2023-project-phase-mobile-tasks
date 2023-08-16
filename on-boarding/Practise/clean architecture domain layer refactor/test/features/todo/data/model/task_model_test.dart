import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/domain/entities/task.dart';

import '../../../../helpers/read_json.dart';

void main() {
  const testTaskModel = TaskModel(
    iconText: 'U',
    titleText: 'UI/UX APP Design',
    descriptionText: 'UI/UX APP Design',
    dateText: 'April, 29, 2023',
    taskId: '1',
    isCompleted: false,
  );

  test('should be subclass of task entity', () async {
    // assert
    expect(testTaskModel, isA<TaskEntity>());
  });

  test(
    'should valid model',
    () async {
      // Arrange

      final Map<String, dynamic> jsonMap = json.decode(
        readJson("helpers/dummy_data/dummy_task_response.json"),
      );
      // Act
      final result = TaskModel.fromJson(jsonMap);

      // Assert
      expect(result, equals(testTaskModel));
    },
  );

  test(
    'should valid json',
    () async {
      // Act
      final result = testTaskModel.toJson();

      final expectedJsonMap = {
        "iconText": "U",
        "titleText": "UI/UX APP Design",
        "descriptionText": "UI/UX APP Design",
        "dateText": "April, 29, 2023",
        "taskId": "1",
        "isCompleted": false,
        'taskColor': const Color(0xff9e9e9e)
            .value, // Serialize the color value as an integer
      };

      // Assert
      expect(result, equals(expectedJsonMap));
    },
  );
}
