import 'package:flutter/material.dart';
import 'package:sample/pages/common.dart';

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
      body: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Interaction Test App'),
        // ),
        body: const Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'Interaction Test Page Between App and Web',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                  'JS Handler, Web Message Channel are pages for running the only app.'),
              SizedBox(height: 20),
              Text('iframe is page for running the only web.'),
              SizedBox(height: 20),
              Text(
                  'web run command : flutter run -d chrome --web-hostname=0.0.0.0 --web-port=8080'),
            ],
          ),
        ),
        bottomNavigationBar: getBottomNavigationBar(context),
      ),
    );
  }
}
