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
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Hello"),
                      content: SingleChildScrollView(
                          child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  width: 200,
                                  height: 400,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                              Container(
                                  width: 200,
                                  height: 400,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                              Container(
                                  width: 200,
                                  height: 400,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                            ],
                          ),
                        ),
                      )),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("hello"),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Hello"),
                      content: SingleChildScrollView(
                          child: SizedBox(
                        height: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  width: 200,
                                  height: 100,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                              Container(
                                  width: 200,
                                  height: 100,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                              Container(
                                  width: 200,
                                  height: 100,
                                  color: Colors.red,
                                  child: const Text("This is a dialog")),
                            ],
                          ),
                        ),
                      )),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("list"),
            ),
          ],
        ),
      ),
      //  ----------------------------------------------------------
    );
  }
}
