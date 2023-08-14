import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Todo extends Equatable {
  final String iconText;
  final String titleText;
  final String? descriptionText;
  final String dateText;
  final Color taskColor;
  final String taskId;

  const Todo({
    required this.iconText,
    required this.titleText,
    required this.descriptionText,
    required this.dateText,
    required this.taskId,
    Color? taskColor, // Make taskColor nullable
  }) : taskColor = taskColor ?? Colors.grey;

  @override
  List<Object?> get props =>
      throw UnimplementedError(); // Set a default color if none is provided
}
