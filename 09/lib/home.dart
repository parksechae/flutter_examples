import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.blue,
                        child: const Center(child: Text("1")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.yellow,
                        child: const Center(child: Text("1")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.red,
                        child: const Center(child: Text("1")),
                      ),
                    ],
                  ),
                ),
              ),
              // const Padding(padding: EdgeInsets.all(2)),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.yellow,
                        child: const Center(child: Text("2")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.blue,
                        child: const Center(child: Text("2")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.red,
                        child: const Center(child: Text("2")),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.red,
                        child: const Center(child: Text("3")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.blue,
                        child: const Center(child: Text("3")),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: Colors.yellow,
                        child: const Center(child: Text("3")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
        //  ----------------------------------------------------------
        );
  }
}

// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         //  ----------------------------------------------------------
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         //  ----------------------------------------------------------
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 300,
//                   color: Colors.green),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 300,
//                 color: Colors.blue,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 300,
//                 color: Colors.yellow,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 300,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//         )
//         //  ----------------------------------------------------------
//         );
//   }
// }
