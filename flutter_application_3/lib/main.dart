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
      home: SampleFour(),
    );
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.phone, size: 35, color: Colors.purple),
            Text('CALL', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        Column(
          children: [
            Icon(Icons.location_on_outlined, size: 35, color: Colors.purple),
            Text('ROUTE', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, size: 35, color: Colors.purple),
            Text('SHARE', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}

class SampleFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Synevir Mountain',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Text('More text'),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red.shade500),

          Text('41'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Sample Four'), centerTitle: true),
      body: ListView(
        children: [
          Image.asset(
            'assets/images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          Buttons(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lore',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
