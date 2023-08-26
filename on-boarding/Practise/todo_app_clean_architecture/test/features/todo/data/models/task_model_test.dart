import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_clean_architecture/features/todo/data/models/task_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTaskModel = TaskModel(
    id: 1,
    title: "Test Title",
    description: "Test Description",
    dueDate: DateTime.parse('2019-01-01T00:00:00.000'),
  );

  test(
    "should be a subclass of task entity",
    () async {
      expect(tTaskModel, isA<TaskModel>());
    },
  );

  group('fromJson', () {
    test("should return a valid model ", () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('task.json'));

      final result = TaskModel.fromJson(jsonMap);
      expect(result, tTaskModel);
    });
  });

  group('toJson', () {
    test("should return a json map containing the proper data", () async {
      final result = tTaskModel.toJson();
      final expectedMap = {
        "id": 1,
        "title": "Test Title",
        "description": "Test Description",
        "dueDate": "2019-01-01T00:00:00.000",
        "isCompleted": false
      };
      expect(result, expectedMap);
    });
  });
}
