import 'package:flutter_test/flutter_test.dart';
import 'package:package_b/package_b.dart';

void main() {
  group('DataManager Tests', () {
    late DataManager dataManager;

    setUp(() {
      dataManager = DataManager();
    });

    test('processData should calculate correct sum, average, and count', () {
      // Arrange
      final numbers = [1, 2, 3, 4, 5];

      // Act
      final result = dataManager.processData(numbers);

      // Assert
      expect(result.sum, equals(15));
      expect(result.average, equals(3.0));
      expect(result.count, equals(5));
    });

    test('processData should handle empty list', () {
      // Act
      final result = dataManager.processData([]);

      // Assert
      expect(result.sum, equals(0));
      expect(result.average, equals(0.0));
      expect(result.count, equals(0));
    });

    test('incrementAll should add 1 to each number', () {
      // Arrange
      final numbers = [1, 2, 3];

      // Act
      final result = dataManager.incrementAll(numbers);

      // Assert
      expect(result, equals([2, 3, 4]));
    });

    test('multiplyAll should multiply each number by factor', () {
      // Arrange
      final numbers = [1, 2, 3];
      final factor = 3;

      // Act
      final result = dataManager.multiplyAll(numbers, factor);

      // Assert
      expect(result, equals([3, 6, 9]));
    });
  });

  group('DataResult Tests', () {
    test('toString should return formatted string', () {
      // Arrange
      const result = DataResult(sum: 15, average: 3.0, count: 5);

      // Act
      final stringRepresentation = result.toString();

      // Assert
      expect(
        stringRepresentation,
        equals('DataResult(sum: 15, average: 3.0, count: 5)'),
      );
    });
  });
}
