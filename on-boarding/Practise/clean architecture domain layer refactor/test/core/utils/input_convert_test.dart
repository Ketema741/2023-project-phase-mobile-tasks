import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_basics/core/utils/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () async {
        // arrange
        const str = '123';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, const Right(123));
      },
    );
    test(
      'should return a failure when the string is not an integer',
      () async {
        // arrange
        const str = 'abc';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, const Left(InvalidInputFailure("Invalid input")));
      },
    );
  });

  test(
  'should return a failure when the string is a negative integer',
  () async {
    // arrange
    const str = '-123';
    // act
    final result = inputConverter.stringToUnsignedInteger(str);
    // assert
    expect(result, const Left(InvalidInputFailure("Invalid input")));
  },
);
}
