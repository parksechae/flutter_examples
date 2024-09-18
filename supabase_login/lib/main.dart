import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/instance_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_login/controller/navigation_controller.dart';
import 'package:supabase_login/controller/user_controller.dart';
import 'package:supabase_login/home.dart';
import 'package:supabase_login/middleware/auth_middleware.dart';
import 'package:supabase_login/mypage.dart';
import 'package:supabase_login/search.dart';
import 'package:supabase_login/siginin.dart';
import 'package:supabase_login/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'http://127.0.0.1:54321',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
  );

  runApp(MyApp());
}

var supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final UserController userController = Get.put(UserController());
  final NavigationController navigationController =
      Get.put(NavigationController());

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
      initialRoute: '/home',
      // routes: {
      //   '/signin': (context) => SignInPage(),
      //   '/signup': (context) => SignUpPage(),
      //   '/home': (context) => HomePage(),
      // },
      getPages: [
        GetPage(name: '/signin', page: () => const SignInPage()),
        GetPage(name: '/signup', page: () => const SignUpPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(
            name: '/mypage',
            page: () => MyPage(),
            middlewares: [AuthMiddleware()]),
        GetPage(
            name: '/search',
            page: () => SearchPage(),
            middlewares: [AuthMiddleware()]),
      ],
    );
  }
}
