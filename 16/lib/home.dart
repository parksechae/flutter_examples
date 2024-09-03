import 'package:flutter/material.dart';
import 'package:sample/second.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondView()));
            },
            // onTap: () => Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => const SecondView())),
            child: Container(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(10),
              child: const Text('Go to Second Page'),
            )),
      ),
      //  ----------------------------------------------------------
    );
  }
}
