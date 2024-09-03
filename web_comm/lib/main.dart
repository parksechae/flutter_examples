import 'package:flutter/material.dart';
import 'package:sample/pages/home.dart';
import 'package:sample/pages/js_handler.dart'
    if (dart.library.html) 'package:sample/pages/js_handler_web.dart';
import 'package:sample/pages/wmc.dart'
    if (dart.library.html) 'package:sample/pages/wmc_web.dart';
import 'package:sample/pages/iframe.dart'
    if (dart.library.html) 'package:sample/pages/iframe_web.dart';

void main() {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.camera.request();
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
        '/': (context) => const MyHomePage(title: 'Inrteraction Test App'),
        '/home': (context) => const MyHomePage(title: 'Inrteraction Test App'),
        '/js': (context) => const JsHandlerPage(title: 'JS Handler'),
        '/wmc': (context) =>
            const WebMessageChannelPage(title: 'Web Message Channel'),
        '/iframe': (context) =>
            const IframePage(key: GlobalObjectKey(IframePage), title: 'Iframe'),
      },
      initialRoute: '/',
    );
  }
}
