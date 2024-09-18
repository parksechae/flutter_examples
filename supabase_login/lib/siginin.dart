import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_login/controller/user_controller.dart';
import 'package:supabase_login/main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userController = Get.find<UserController>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    userController.signIn(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text = 'root@localhost';
    _passwordController.text = 'root1234!';

    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: '이메일'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: '비밀번호'),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: _signIn,
                child: const Text('로그인'),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/signup');
                  },
                  child: const Text('회원가입')),
            ]),
          ],
        ),
      ),
    );
  }
}
