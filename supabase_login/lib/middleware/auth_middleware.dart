import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_login/controller/user_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final userController = Get.find<UserController>();

    // 로그인이 안되어 있으면 로그인 페이지로 리디렉션
    if (!userController.isSignedIn) {
      return const RouteSettings(name: '/signin');
    }
    return null; // 로그인이 되어 있으면 리디렉션하지 않음
  }
}
