import 'package:flutter/material.dart';

class SecondDeptPage extends StatefulWidget {
  const SecondDeptPage({super.key});

  @override
  State<SecondDeptPage> createState() => _SecondDeptPageState();
}

class _SecondDeptPageState extends State<SecondDeptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Dept Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is second dept page',
            ),
          ],
        ),
      ),
    );
  }
}
