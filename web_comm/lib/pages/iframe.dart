import 'package:flutter/material.dart';
import 'package:sample/pages/common.dart';

class IframePage extends StatefulWidget {
  const IframePage({super.key, required this.title});
  final String title;

  @override
  State<IframePage> createState() => _IframePageState();
}

class _IframePageState extends State<IframePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  ----------------------------------------------------------
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //  ----------------------------------------------------------
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'This feature is not supported by the app',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Please use the web browser to access this feature.'),
          ],
        ),
      ),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }
}
