import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:layout_basics/core/network/network_info.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';
import 'package:layout_basics/features/todo/data/repositories/task_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/input_converter.dart';
import 'features/todo/data/datasources/remote_data_source.dart';
import 'features/todo/domain/repositories/task_repository.dart';
import 'features/todo/domain/usecases/create_task.dart';
import 'features/todo/domain/usecases/delete_task.dart';
import 'features/todo/domain/usecases/get_task.dart';
import 'features/todo/domain/usecases/get_tasks.dart';
import 'features/todo/domain/usecases/update_task.dart';
import 'features/todo/presentation/bloc/task_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Register your use cases
  sl.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton<GetTaskUseCase>(
      () => GetTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton<CreateTaskUseCase>(
      () => CreateTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(sl<TaskRepository>()));
  sl.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(sl<TaskRepository>()));

  // core
  sl.registerLazySingleton<InputConverter>(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  //! data sources
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  //! Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
        localDataSource: sl(),
        networkInfo: sl(),
      ));
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImp(
      sharedPreferences: sl(),
    ),
  );


  //! Register your bloc
  sl.registerFactory<TaskBloc>(() => TaskBloc(
        sl<GetTasksUseCase>(),
        sl<GetTaskUseCase>(),
        sl<CreateTaskUseCase>(),
        sl<DeleteTaskUseCase>(),
        sl<UpdateTaskUseCase>(),
      ));
}
