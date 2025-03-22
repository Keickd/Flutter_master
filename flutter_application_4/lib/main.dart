import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

enum Operation { add, multiply, division, substract }

class _CalculatorState extends State<Calculator> {
  double _result = 0;
  double _firstNumber = 0;
  double _secondNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            _fieldsContainer(),
            _operationsBoard(),
            Text(
              "Result is: ${_result.toStringAsFixed(2)}",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fieldsContainer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onChanged: (text) {
              _firstNumber = double.tryParse(text) ?? 0;
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            onChanged: (text) {
              _secondNumber = double.tryParse(text) ?? 0;
            },
          ),
        ),
      ],
    );
  }

  Future<bool> _validate(double value) async {
    if (value == 0) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("division by 0"),
            content: Text("value cannot be 0"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );

      setState(() {
        _result = 0;
      });
      return false;
    }

    return true;
  }

  void _calculate(Operation operation) async {
    switch (operation) {
      case Operation.add:
        setState(() {
          _result = _firstNumber + _secondNumber;
        });
        break;
      case Operation.substract:
        setState(() {
          _result = _firstNumber - _secondNumber;
        });
        break;
      case Operation.multiply:
        setState(() {
          _result = _firstNumber * _secondNumber;
        });
        break;
      case Operation.division:
        if (await _validate(_secondNumber)) {
          setState(() {
            _result = _firstNumber / _secondNumber;
          });
        }

        break;
    }
  }

  Widget _operationsBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => _calculate(Operation.add),
                  child: Text(
                    "+",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => _calculate(Operation.substract),
                  child: Text(
                    "-",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => _calculate(Operation.multiply),
                  child: Text(
                    "*",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () => _calculate(Operation.division),
                  child: Text(
                    "/",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
