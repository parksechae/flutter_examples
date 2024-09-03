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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var postList = [
    {'title': 'Title 1', 'color': Colors.deepPurple},
    {'title': 'Title 2', 'color': Colors.red},
    {'title': 'Title 3', 'color': Colors.blue},
    {'title': 'Title 4', 'color': Colors.yellow},
    {'title': 'Title 5', 'color': Colors.green},
    {'title': 'Title 6', 'color': Colors.orange},
    {'title': 'Title 7', 'color': Colors.pink},
    {'title': 'Title 8', 'color': Colors.purple},
    {'title': 'Title 9', 'color': Colors.brown},
    {'title': 'Title 10', 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          return postConainer(
            title: postList[index]['title'] as String,
            color: postList[index]['color'] as Color,
          );
        },
      ),
      //  ----------------------------------------------------------
    );
  }

  Widget postConainer(
      {String title = '',
      Color color = Colors.deepPurple,
      String description = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: color,
        ),
      ],
    );
  }
}
