import '../../domain/entities/task.dart';

part 'task_mapper.dart';

class TaskModel extends Task {
  TaskModel({
    required int id,
    required String title,
    required String description,
    required DateTime dueDate,
    bool isCompleted = false,
  }) : super(
            id: id,
            title: title,
            description: description,
            dueDate: dueDate,
            isCompleted: isCompleted);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        dueDate: DateTime.parse(json['dueDate']),
        isCompleted: json['isCompleted']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "dueDate": dueDate.toIso8601String(),
      "isCompleted": isCompleted
    };
  }
}
