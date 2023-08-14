import 'package:layout_basics/features/todo/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Todo>> getTasks();
  Future<void> addTask(Todo task);
  Future<void> updateTask(Todo task);
  Future<void> deleteTask(Todo task);
}
