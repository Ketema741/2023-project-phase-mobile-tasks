import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/network/network_info.dart';
import 'package:layout_basics/features/todo/data/datasources/local_data_source.dart';
import 'package:layout_basics/features/todo/data/datasources/remote_data_source.dart';
import 'package:layout_basics/features/todo/data/models/task_model.dart';
import 'package:layout_basics/features/todo/data/repositories/task_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late TaskRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TaskRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getTask', () {
    const tNumber = "2";
    const tTaskModel =
        TaskModel(
      iconText: 'P',
      titleText: 'Project Planning',
      descriptionText: 'UI/UX APP Design',
      dateText: 'May, 15, 2023',
      taskId: '2',
    );
    const TaskModel tTask = tTaskModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getTask(tNumber);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getTask(tNumber))
              .thenAnswer((_) async => tTaskModel);
          // act
          final result = await repository.getTask(tNumber);
          // assert
          verify(mockRemoteDataSource.getTask(tNumber));
          expect(result, equals(const Right(tTask)));
        },
      );

  //     test(
  //       'should cache the data locally when the call to remote data source is successful',
  //       () async {
  //         // arrange
  //         when(mockRemoteDataSource.getConcreteNumberTrivia(any))
  //             .thenAnswer((_) async => tNumberTriviaModel);
  //         // act
  //         await repository.getConcreteNumberTrivia(tNumber);
  //         // assert
  //         verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
  //         verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
  //       },
  //     );

  //     test(
  //       'should return server failure when the call to remote data source is unsuccessful',
  //       () async {
  //         // arrange
  //         when(mockRemoteDataSource.getConcreteNumberTrivia(any))
  //             .thenThrow(ServerException());
  //         // act
  //         final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // assert
  //         verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
  //         verifyZeroInteractions(mockLocalDataSource);
  //         expect(result, equals(Left(ServerFailure())));
  //       },
  //     );
  //   });

  //   runTestsOffline(() {
  //     test(
  //       'should return last locally cached data when the cached data is present',
  //       () async {
  //         // arrange
  //         when(mockLocalDataSource.getLastNumberTrivia())
  //             .thenAnswer((_) async => tNumberTriviaModel);
  //         // act
  //         final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // assert
  //         verifyZeroInteractions(mockRemoteDataSource);
  //         verify(mockLocalDataSource.getLastNumberTrivia());
  //         expect(result, equals(Right(tNumberTrivia)));
  //       },
  //     );

  //     test(
  //       'should return CacheFailure when there is no cached data present',
  //       () async {
  //         // arrange
  //         when(mockLocalDataSource.getLastNumberTrivia())
  //             .thenThrow(CacheException());
  //         // act
  //         final result = await repository.getConcreteNumberTrivia(tNumber);
  //         // assert
  //         verifyZeroInteractions(mockRemoteDataSource);
  //         verify(mockLocalDataSource.getLastNumberTrivia());
  //         expect(result, equals(Left(CacheFailure())));
  //       },
  //     );
  //   });
  // });

  group('getTasks', () {
    const tTaskModel =
        TaskModel(
    iconText: 'U',
    titleText: 'UI/UX APP Design',
    descriptionText: 'UI/UX APP Design',
    dateText: 'April, 29, 2023',
    taskId: '3',
  );
    const TaskModel tTask = tTaskModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getTasks();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

  //   runTestsOnline(() {
  //     test(
  //       'should return remote data when the call to remote data source is successful',
  //       () async {
  //         // arrange
  //         when(mockRemoteDataSource.getRandomNumberTrivia())
  //             .thenAnswer((_) async => tNumberTriviaModel);
  //         // act
  //         final result = await repository.getRandomNumberTrivia();
  //         // assert
  //         verify(mockRemoteDataSource.getRandomNumberTrivia());
  //         expect(result, equals(Right(tNumberTrivia)));
  //       },
  //     );

  //     test(
  //       'should cache the data locally when the call to remote data source is successful',
  //       () async {
  //         // arrange
  //         when(mockRemoteDataSource.getRandomNumberTrivia())
  //             .thenAnswer((_) async => tNumberTriviaModel);
  //         // act
  //         await repository.getRandomNumberTrivia();
  //         // assert
  //         verify(mockRemoteDataSource.getRandomNumberTrivia());
  //         verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
  //       },
  //     );

  //     test(
  //       'should return server failure when the call to remote data source is unsuccessful',
  //       () async {
  //         // arrange
  //         when(mockRemoteDataSource.getRandomNumberTrivia())
  //             .thenThrow(ServerException());
  //         // act
  //         final result = await repository.getRandomNumberTrivia();
  //         // assert
  //         verify(mockRemoteDataSource.getRandomNumberTrivia());
  //         verifyZeroInteractions(mockLocalDataSource);
  //         expect(result, equals(Left(ServerFailure())));
  //       },
  //     );
  //   });

  //   runTestsOffline(() {
  //     test(
  //       'should return last locally cached data when the cached data is present',
  //       () async {
  //         // arrange
  //         when(mockLocalDataSource.getLastNumberTrivia())
  //             .thenAnswer((_) async => tNumberTriviaModel);
  //         // act
  //         final result = await repository.getRandomNumberTrivia();
  //         // assert
  //         verifyZeroInteractions(mockRemoteDataSource);
  //         verify(mockLocalDataSource.getLastNumberTrivia());
  //         expect(result, equals(Right(tNumberTrivia)));
  //       },
  //     );

  //     test(
  //       'should return CacheFailure when there is no cached data present',
  //       () async {
  //         // arrange
  //         when(mockLocalDataSource.getLastNumberTrivia())
  //             .thenThrow(CacheException());
  //         // act
  //         final result = await repository.getRandomNumberTrivia();
  //         // assert
  //         verifyZeroInteractions(mockRemoteDataSource);
  //         verify(mockLocalDataSource.getLastNumberTrivia());
  //         expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}