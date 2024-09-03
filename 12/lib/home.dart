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
    const imgUrl = 'https://picsum.photos/250?image=9';
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        // alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: const Image(
          image: NetworkImage(imgUrl),
          fit: BoxFit.fill,
        ),
      ),
      //  ----------------------------------------------------------
      // body: Column(
      //   children: [
      //     SizedBox(
      //       height: MediaQuery.of(context).size.height * 0.3,
      //       child: const Image(
      //         image: NetworkImage('https://picsum.photos/250?image=9'),
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //     Container(
      //       alignment: Alignment.center,
      //       height: MediaQuery.of(context).size.height * 0.3,
      //       width: MediaQuery.of(context).size.width,
      //       color: Colors.blue,
      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: const [
      //           Image(
      //             image: NetworkImage('https://picsum.photos/250?image=8'),
      //           ),
      //           Image(
      //             image: NetworkImage('https://picsum.photos/250?image=21'),
      //           ),
      //           Image(
      //             image: NetworkImage('https://picsum.photos/250?image=30'),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       height: MediaQuery.of(context).size.height * 0.2,
      //       alignment: Alignment.center,
      //       color: Colors.amber,
      //       // height: 200,
      //       // width: 200,
      //       child: ListView(
      //         // scrollDirection: Axis.horizontal,
      //         padding: const EdgeInsets.all(10),
      //         children: [
      //           Image.asset('images/car2.png'),
      //           Image.asset('images/car.png'),
      //           Image.asset('images/car2.png'),
      //           Image.asset('images/car.png'),
      //           Image.asset('images/car2.png'),
      //           Image.asset('images/car.png'),
      //           Image.network('https://picsum.photos/250?image=30')
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      //  ----------------------------------------------------------
    );
  }
}
