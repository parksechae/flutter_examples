import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Title"),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Drawer Header Part"),
          ),
          ListTile(
            title: Text("Menu 1"),
          ),
        ],
      )),
      body: Center(
        child: Text("COUNT NUMBER: $count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => count++),
        tooltip: 'Test tooltip',
        child: const Icon(Icons.mouse),
      ),
    );
  }
}
