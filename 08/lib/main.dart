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
  final List<Map> postList = [
    {'number': "1", 'color': Colors.red},
    {'number': "2", 'color': Colors.green},
    {'number': "3", 'color': Colors.blue},
    {'number': "4", 'color': Colors.yellow},
    {'number': "5", 'color': Colors.orange},
    {'number': "6", 'color': Colors.purple},
    {'number': "7", 'color': Colors.pink},
    {'number': "8", 'color': Colors.brown},
    {'number': "9", 'color': Colors.grey},
    {'number': "10", 'color': Colors.teal},
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
        // body: GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 4,
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 10,
        //     ),
        //     itemCount: postList.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return postContainer(
        //           postList[index]['number'], postList[index]['color']);
        //     }),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return postContainer(
                postList[index]['number'], postList[index]['color']);
          },
        ));
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
