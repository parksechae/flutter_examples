import 'package:flutter/material.dart';
import 'package:sample/app.dart';

class SecondView extends StatefulWidget {
  const SecondView({super.key});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: getAppBar(context),
      //  ----------------------------------------------------------
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.deepPurple,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('This is the Second Page'),
          ),
        ),
      ),
      //  ----------------------------------------------------------
    );
  }
}
