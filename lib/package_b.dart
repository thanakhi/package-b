/// Package B - A Flutter package providing UI components and utilities.
///
/// This library exports all the public APIs of the package_b package.
/// Import this library to access UI components and utilities for iOS applications.
///
/// Example:
/// ```dart
/// import 'package:package_b/package_b.dart';
///
/// void main() {
///   final manager = DataManager();
///   final result = manager.processData([1, 2, 3, 4, 5]);
///   print('Sum: ${result.sum}, Average: ${result.average}');
/// }
/// ```
library;

import 'package:flutter/cupertino.dart';
import 'package:package_a1/package_a1.dart';

/// A data processing result class that holds calculation results.
class DataResult {
  /// The sum of all processed numbers.
  final int sum;
  
  /// The average of all processed numbers.
  final double average;
  
  /// The count of processed numbers.
  final int count;

  /// Creates a new [DataResult] with the given values.
  const DataResult({
    required this.sum,
    required this.average,
    required this.count,
  });

  @override
  String toString() => 'DataResult(sum: $sum, average: $average, count: $count)';
}

/// A data manager utility class that processes lists of numbers.
///
/// This class uses the Calculator from package_a1 for mathematical operations.
class DataManager {
  final Calculator _calculator = Calculator();

  /// Processes a list of integers and returns calculation results.
  ///
  /// Uses the Calculator from package_a1 to perform the sum calculation.
  ///
  /// Example:
  /// ```dart
  /// final manager = DataManager();
  /// final result = manager.processData([1, 2, 3, 4, 5]);
  /// print('Sum: ${result.sum}'); // Sum: 15
  /// ```
  DataResult processData(List<int> numbers) {
    if (numbers.isEmpty) {
      return const DataResult(sum: 0, average: 0.0, count: 0);
    }

    // Use Calculator from package_a1 to calculate sum
    int sum = 0;
    for (final number in numbers) {
      sum = _calculator.add(sum, number);
    }

    final average = sum / numbers.length;
    
    return DataResult(
      sum: sum,
      average: average,
      count: numbers.length,
    );
  }

  /// Increments each number in the list by one using Calculator.addOne().
  ///
  /// Example:
  /// ```dart
  /// final manager = DataManager();
  /// final result = manager.incrementAll([1, 2, 3]); // Returns [2, 3, 4]
  /// ```
  List<int> incrementAll(List<int> numbers) {
    return numbers.map((number) => _calculator.addOne(number)).toList();
  }

  /// Multiplies each number in the list by a given factor.
  ///
  /// Example:
  /// ```dart
  /// final manager = DataManager();
  /// final result = manager.multiplyAll([1, 2, 3], 3); // Returns [3, 6, 9]
  /// ```
  List<int> multiplyAll(List<int> numbers, int factor) {
    return numbers.map((number) => _calculator.multiply(number, factor)).toList();
  }
}

/// A custom iOS-style card widget for displaying data results.
class DataCard extends StatelessWidget {
  /// The data result to display.
  final DataResult result;
  
  /// Optional title for the card.
  final String? title;

  /// Creates a new [DataCard] widget.
  const DataCard({
    super.key,
    required this.result,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: CupertinoColors.systemGrey4,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.label,
              ),
            ),
            const SizedBox(height: 12),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('Count', '${result.count}', CupertinoColors.systemBlue),
              _buildStatItem('Sum', '${result.sum}', CupertinoColors.systemGreen),
              _buildStatItem('Average', result.average.toStringAsFixed(1), CupertinoColors.systemOrange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: CupertinoColors.secondaryLabel,
          ),
        ),
      ],
    );
  }
}
