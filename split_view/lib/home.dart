import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String myName;

  void test() {
    String? name = null;
    print('name length : ${name?.length}');
    myName = 'psc';
    print('myName length : ${myName.length}');
    hello(cnt: 1, greetText: 'world');
    hello(cnt: 2);
    world('psc', 30);
    world('psc2');
  }

  // void hello(int cnt, {required String greetText}) {
  void hello({int cnt = 0, String greetText = ''}) {
    if (kDebugMode) {
      print('hello ${cnt}, ${greetText}');
    }
  }

  void world(String name, [int age = 7]) {
    print('name : ${name}, age : ${age}');
  }

  @override
  void initState() {
    // TODO: implement initState
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SplitView(
        viewMode: SplitViewMode.Vertical,
        indicator: const SplitIndicator(viewMode: SplitViewMode.Vertical),
        activeIndicator: const SplitIndicator(
          viewMode: SplitViewMode.Vertical,
          isActive: true,
        ),
        controller: SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
        onWeightChanged: (w) => print("Vertical $w"),
        children: [
          // SplitView(
          //   viewMode: SplitViewMode.Vertical,
          //   indicator: const SplitIndicator(viewMode: SplitViewMode.Vertical),
          //   activeIndicator: const SplitIndicator(
          //     viewMode: SplitViewMode.Vertical,
          //     isActive: true,
          //   ),
          //   children: [
          //     Container(
          //       color: Colors.red,
          //       child: const Center(child: Text("View1")),
          //     ),
          //     Container(
          //       color: Colors.blue,
          //       child: const Center(child: Text("View2")),
          //     ),
          //     Container(
          //       color: Colors.green,
          //       child: const Center(child: Text("View3")),
          //     ),
          //   ],
          //   onWeightChanged: (w) => print("Horizon: $w"),
          // ),
          Container(
            color: Colors.purple,
            child: const Center(child: Text("View4")),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(child: Text("View5")),
          ),
        ],
      ),
    );
  }
}
