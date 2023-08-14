import 'package:layout_basics/features/todo/domain/entities/task.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepository repository;

  UpdateTaskUseCase(this.repository);

  Future<void> execute(Todo oldTask, Todo newTask) async {
    await repository.deleteTask(oldTask);
    await repository.addTask(newTask);
  }
}
