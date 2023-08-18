import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:layout_basics/features/todo/domain/repositories/task_repository.dart';
import 'package:http/http.dart' as http;
import 'package:layout_basics/features/todo/domain/usecases/get_tasks.dart';


@GenerateMocks(
  [
   TaskRepository,
   LocalDataSource,
   GetTasksUseCase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)

void main() {}