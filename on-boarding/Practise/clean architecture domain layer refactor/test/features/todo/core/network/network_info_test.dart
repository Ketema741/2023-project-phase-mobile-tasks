import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:layout_basics/core/network/network_info.dart';
import 'package:mockito/mockito.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkInfo networkInfo;
  late MockInternetConnectionChecker mockConnectionChecker;

  setUp(() {
    mockConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockConnectionChecker);
  });

  group('isConnected', () {
    test('should return true if connected to mobile data', () async {
      final tHasConnectionFuture = Future.value(true);
      // Arrange
      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      // Act
      final isConnected = await networkInfo.isConnected;

      // Assert
      expect(isConnected, equals(tHasConnectionFuture));
    });

    test('should return false if not connected to mobile data', () async {
      final tHasConnectionFuture = Future.value(false);

      // Arrange
      when(mockConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      // Act
      final isConnected = await networkInfo.isConnected;

      // Assert
      expect(isConnected, false);
    });
  });
}
