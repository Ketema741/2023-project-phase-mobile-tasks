import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class TaskEntity extends Equatable {
  final String iconText;
  final String titleText;
  final String descriptionText;
  final String dateText;
  final String taskId;
  final Color taskColor;
  final bool isCompleted;

  const TaskEntity({
    required this.iconText,
    required this.titleText,
    required this.descriptionText,
    required this.dateText,
    required this.taskId,
    Color? taskColor, // Default value for taskColor
    bool? isCompleted, // Default value for isCompleted
  })  : taskColor = taskColor ?? const Color.fromARGB(0, 23, 55, 55), // Assign default value if not provided
        isCompleted = isCompleted ?? false; // Assign default value if not provided

  @override
  List<Object?> get props => [
        iconText,
        titleText,
        descriptionText,
        dateText,
        taskId,
        taskColor,
        isCompleted,
      ];
}
