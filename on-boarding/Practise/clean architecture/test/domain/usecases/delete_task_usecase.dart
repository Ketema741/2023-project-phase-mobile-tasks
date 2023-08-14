import 'package:layout_basics/features/todo/domain/entities/task.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> execute(Todo task) async {
    await repository.deleteTask(task);
  }
}
