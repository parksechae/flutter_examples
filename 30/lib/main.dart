import 'package:flutter/material.dart';
import 'package:sample/home.dart';
import 'package:sample/sub/firstDeptPage.dart';
import 'package:sample/sub/secondDeptPage.dart';
import 'package:sample/sub/successPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page...'),
        '/success': (context) => const SuccessPage(),
        '/first': (context) => const FirstDeptPage(),
        '/second': (context) => const SecondDeptPage(),
      },
      initialRoute: '/',
    );
  }
}
