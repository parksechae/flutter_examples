import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        // elevation: 100.0,
        // automaticallyImplyLeading: true,
        // centerTitle: true,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.blue,
        // toolbarHeight: 100,
        iconTheme: const IconThemeData(color: Colors.red),
        // titleSpacing: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: Colors.blue,
            height: 10,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => exitDialog(),
            );
          },
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.blue,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return exitDialog();
                  });
            },
          ),
        ),
      ),

      //  ----------------------------------------------------------
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (kDebugMode) {
                  print('ElevatedButton Pressed');
                }
              },
              child: const Text('Go to Second Page'),
            ),
            TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('TextButton Pressed');
                  }
                },
                child: const Text('Go to Third Page')),
            OutlinedButton(
                onPressed: () => {
                      // ignore: avoid_print
                      print('OutlinedButton Pressed'),
                    },
                child: const Text('Go to Fourth Page')),
          ],
        ),
      ),
      //  ----------------------------------------------------------
    );
  }
}

Widget exitDialog() {
  return AlertDialog(
    title: const Text('Exit App'),
    content: const Text('Are you sure you want to exit?'),
    actions: <Widget>[
      Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            print('Exit App');
          },
          child: const Text('Yes'),
        ),
      ),
    ],
  );
}
