import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_clean_architecture/core/error/exceptions.dart';
import 'package:todo_app_clean_architecture/core/error/failures.dart';
import 'package:todo_app_clean_architecture/core/network/network_info.dart';
import 'package:todo_app_clean_architecture/features/todo/data/datasources/task_local_datasource.dart';
import 'package:todo_app_clean_architecture/features/todo/data/datasources/task_remote_datasource.dart';
import 'package:todo_app_clean_architecture/features/todo/data/models/task_model.dart';
import 'package:todo_app_clean_architecture/features/todo/data/repositories/task_repository_impl.dart';
import 'package:todo_app_clean_architecture/features/todo/domain/entities/task.dart';

import 'task_repository_impl_test.mocks.dart';

@GenerateMocks([
  TaskRemoteDataSource,
  TaskLocalDataSource,
  NetworkInfo,
])
void main() {
  late MockTaskRemoteDataSource mockRemoteDataSource;
  late MockTaskLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late TaskRepositoryImpl repository;

  setUp(() {
    const tTaskId = 1;
    final tTaskmodel = TaskModel(
      id: tTaskId,
      title: "Test title",
      description: "Test description",
      dueDate: DateTime(2020, 1, 1),
    );

    mockRemoteDataSource = MockTaskRemoteDataSource();
    when(mockRemoteDataSource.getTask(tTaskId))
        .thenAnswer((_) => Future.value(tTaskmodel));

    mockLocalDataSource = MockTaskLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = TaskRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getTask', () {
    const tTaskId = 1;
    final tTaskModel = TaskModel(
      id: tTaskId,
      title: "Test title",
      description: "Test description",
      dueDate: DateTime(2020, 1, 1),
    );

    final Task tTask = tTaskModel.toEntity();

    test('should check if device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.getTask(tTaskId);
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      // This setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tTaskId))
              .thenAnswer((_) async => tTaskModel);
          // act
          final result = await repository.getTask(tTaskId);
          // assert
          verify(mockRemoteDataSource.getTask(tTaskId));
          expect(result, equals(Right(tTask.toModel())));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tTaskId))
              .thenAnswer((_) async => tTaskModel);
          // act
          await repository.getTask(tTaskId);
          // assert
          verify(mockRemoteDataSource.getTask(tTaskId));
          verify(mockLocalDataSource.cacheTask(tTaskModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tTaskId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getTask(tTaskId);
          // assert
          verify(mockRemoteDataSource.getTask(tTaskId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}
