import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required String iconText,
    required String titleText,
    required String descriptionText,
    required String dateText,
    required String taskId,
    Color? taskColor,
    bool? isCompleted,
  }) : super(
          iconText: iconText,
          titleText: titleText,
          descriptionText: descriptionText,
          taskId: taskId,
          dateText: dateText,
          taskColor: taskColor ?? Colors.grey,
          isCompleted: isCompleted ?? false,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        iconText: json['iconText'],
        titleText: json['titleText'],
        descriptionText: json['descriptionText'],
        taskId: json['taskId'],
        dateText: json['dateText'],
        taskColor: json['taskColor'],
        isCompleted: json['isCompleted'],
      );

  Map<String, dynamic> toJson() {
    int taskColorValue = taskColor.value;

    return {
      'iconText': iconText,
      'titleText': titleText,
      'descriptionText': descriptionText,
      'taskId': taskId,
      'dateText': dateText,
      'taskColor': taskColorValue,
      'isCompleted': isCompleted,
    };
  }
}
