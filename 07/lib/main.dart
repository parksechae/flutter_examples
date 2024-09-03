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

  @override
  Widget build(BuildContext context) {
    var items = [
      postContainer("1", Colors.red),
      postContainer("2", Colors.green),
      postContainer("3", Colors.blue),
      postContainer("4", Colors.yellow),
      postContainer("5", Colors.orange),
      postContainer("6", Colors.purple),
      postContainer("7", Colors.pink),
      postContainer("8", Colors.brown),
      postContainer("9", Colors.teal),
    ];
    return Scaffold(
        //  ----------------------------------------------------------
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        //  ----------------------------------------------------------
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: items,
          ),
        )
        //  ----------------------------------------------------------

        //  ----------------------------------------------------------
        );
  }

  Container postContainer(String title, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Center(child: Text('NO : $title')),
    );
  }
}
