import 'package:flutter/cupertino.dart';
import 'package:package_b/package_b.dart';

void main() {
  runApp(const PackageBExampleApp());
}

class PackageBExampleApp extends StatelessWidget {
  const PackageBExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Package B Example',
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  final DataManager _dataManager = DataManager();
  final List<int> _numbers = [1, 2, 3, 4, 5];
  DataResult? _result;

  void _processData() {
    setState(() {
      _result = _dataManager.processData(_numbers);
    });
  }

  void _incrementData() {
    setState(() {
      final incremented = _dataManager.incrementAll(_numbers);
      _result = _dataManager.processData(incremented);
    });
  }

  void _multiplyData() {
    setState(() {
      final multiplied = _dataManager.multiplyAll(_numbers, 2);
      _result = _dataManager.processData(multiplied);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Package B Example'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Sample Data: ${_numbers.join(', ')}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton.filled(
                    onPressed: _processData,
                    child: const Text('Process'),
                  ),
                  CupertinoButton.filled(
                    onPressed: _incrementData,
                    child: const Text('+1 All'),
                  ),
                  CupertinoButton.filled(
                    onPressed: _multiplyData,
                    child: const Text('×2 All'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_result != null)
                DataCard(
                  result: _result!,
                  title: 'Calculation Results',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
