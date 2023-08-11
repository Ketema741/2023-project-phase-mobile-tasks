import 'package:flutter/material.dart';

class Task {
  final String iconText;
  final String titleText;
  final String? descriptionText;
  final String dateText;
  final Color taskColor;
  final String taskId;

  Task({
    required this.iconText,
    required this.titleText,
    required this.descriptionText,
    required this.dateText,
     required this.taskId,
    Color? taskColor, // Make taskColor nullable
  }) : taskColor =
            taskColor ?? Colors.grey; // Set a default color if none is provided
  
}
