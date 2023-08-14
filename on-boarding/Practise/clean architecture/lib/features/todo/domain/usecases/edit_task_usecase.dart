import 'package:layout_basics/features/todo/domain/entities/task.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';

class EditTaskUseCase {
  final TaskRepository repository;

  EditTaskUseCase(this.repository);

  Future<void> execute(Todo task) async {
    await repository.updateTask(task);
  }
}
