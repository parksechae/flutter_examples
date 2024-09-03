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
      // body: Column(
      //   children: [
      //     Expanded(
      //         flex: 2,
      //         // fit: FlexFit.tight,
      //         child: Container(
      //           // height: 150,
      //           color: Colors.green,
      //         )),
      //     Expanded(
      //         flex: 2,
      //         // fit: FlexFit.tight,
      //         child: Container(
      //           // height: 150,
      //           color: Colors.blue,
      //         )),
      //   ],
      // ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Container(
      //       height: 100,
      //       color: Colors.red,
      //       child: const Text('Item 1 - pretty big!'),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       fit: FlexFit.tight,
      //       child: Container(
      //         height: 100,
      //         color: Colors.blue,
      //         child: const Text('Item 2'),
      //       ),
      //     ),
      //     Flexible(
      //       flex: 1,
      //       // fit: FlexFit.t ight,
      //       child: Container(
      //         height: 100,
      //         color: Colors.orange,
      //         child: const Text('Item 3'),
      //       ),
      //     ),
      //   ],
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.red,
              child: const Text('Item 1 - pretty big!'),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('이번에 여기에 엄청나게 긴 글이 있으면 어떻게될까요?'),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 3'),
            ),
          ),
        ],
      ),
      //  ----------------------------------------------------------
    );
  }
}
