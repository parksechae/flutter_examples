import 'package:flutter/material.dart';
import 'package:sample/pages/common.dart';

class JsHandlerPage extends StatefulWidget {
  const JsHandlerPage({super.key, required this.title});
  final String title;

  @override
  State<JsHandlerPage> createState() => _JsHandlerPageState();
}

class _JsHandlerPageState extends State<JsHandlerPage> {
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
                'This feature is not supported by the web',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Please use the app to access this feature.'),
            ],
          ),
        ),
        bottomNavigationBar: getBottomNavigationBar(context));
  }
}
