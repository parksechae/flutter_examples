import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_test/first.dart';
import 'package:getx_test/home.dart';
import 'package:getx_test/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const FirstPage(),
      routes: {
        '/': (context) => const MyHomePage(title: 'Home'),
        '/home': (context) => const MyHomePage(title: 'Home'),
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
      initialRoute: '/',
    );
  }
}
