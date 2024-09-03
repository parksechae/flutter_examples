import 'package:flutter/material.dart';

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
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Text("Hello"),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Text("Hello"),
              ),
            ),
          ],
        )
        //  ----------------------------------------------------------
        );
  }
}
