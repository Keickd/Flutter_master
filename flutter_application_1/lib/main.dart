import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SampleThreee(),
    );
  }
}

class SampleOne extends StatelessWidget {
  const SampleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200, maxWidth: 200),
            child: Container(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class SampleTwo extends StatelessWidget {
  const SampleTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(flex: 1, child: Container(color: Colors.red)),
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class SampleThreee extends StatelessWidget {
  const SampleThreee({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,

        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(color: Colors.red, height: 100, width: 100),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.1,
                heightFactor: 0.5,
                child: Container(color: Colors.purple),
              ),
            ),
            Container(color: Colors.yellow, height: 80, width: 100),
          ],
        ),
      ),
    );
  }
}
