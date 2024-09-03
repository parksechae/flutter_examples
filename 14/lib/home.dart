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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.blue,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          radius: 0.4,
          stops: const [0.0, 0.2, 0.9],
          colors: [
            Colors.blue[900] as Color,
            Colors.red[900] as Color,
            Colors.green[900] as Color
          ],
        )
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.blue[900] as Color,
            //     Colors.red[900] as Color,
            //     Colors.green[900] as Color
            //   ],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   stops: const [0.0, 0.2, 0.9],
            // ),
            ),
        child: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
      //  ----------------------------------------------------------
    );
  }
}
