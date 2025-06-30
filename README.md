# package_b

A Flutter package providing UI components and utilities for iOS applications.

## Features

- **DataManager**: Process lists of numbers with mathematical operations
- **DataCard**: Custom iOS-style card widget for displaying calculation results
- **Integration**: Seamlessly integrates with package_a1 for calculations

## Usage

### Basic Data Processing

```dart
import 'package:package_b/package_b.dart';

void main() {
  final manager = DataManager();
  
  // Process a list of numbers
  final result = manager.processData([1, 2, 3, 4, 5]);
  print('Sum: ${result.sum}'); // Sum: 15
  print('Average: ${result.average}'); // Average: 3.0
  print('Count: ${result.count}'); // Count: 5
  
  // Increment all numbers
  final incremented = manager.incrementAll([1, 2, 3]); // [2, 3, 4]
  
  // Multiply all numbers
  final multiplied = manager.multiplyAll([1, 2, 3], 2); // [2, 4, 6]
}
```

### UI Components

```dart
import 'package:flutter/cupertino.dart';
import 'package:package_b/package_b.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final result = DataResult(sum: 15, average: 3.0, count: 5);
    
    return DataCard(
      result: result,
      title: 'Calculation Results',
    );
  }
}
```

## Dependencies

This package depends on:
- `package_a1`: For mathematical calculations using the Calculator class
- `flutter`: For UI components and widgets

## Example

See the `example/main.dart` file for a complete working example demonstrating all features of this package.

## Development

To run tests:
```bash
flutter test
```

To format code:
```bash
dart format .
```

To analyze code:
```bash
dart analyze .
```
