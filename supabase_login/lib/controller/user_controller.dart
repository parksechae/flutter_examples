import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_login/main.dart';

class UserController extends GetxController {
  final RxBool _isSignedIn = false.obs;
  final Rx<User?> _user = Rx<User?>(null); // 사용자 정보를 저장하는 변수
  final Rx<Session?> _session = Rx<Session?>(null);

  get isSignedIn => _isSignedIn.value;
  get user => _user.value;

  Future<void> signUp({required String email, required String password}) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      log(response.toString());

      Get.snackbar('회원가입', "회원가입 성공", duration: const Duration(seconds: 1));
      Get.toNamed('/signin');
    } catch (e) {
      log(e.toString());
      Get.snackbar('회원가입 실패', e.toString(),
          duration: const Duration(seconds: 1));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session != null) {
        _isSignedIn.value = true;
        _user.value = response.user;
        _session.value = response.session;

        Get.snackbar('로그인', '로그인 성공!', duration: const Duration(seconds: 1));
        Get.offAllNamed('/home');
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('로그인 실패', e.toString(),
          duration: const Duration(seconds: 1));
    }
  }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      _isSignedIn.value = false;

      Get.snackbar('로그아웃', '로그아웃 성공!', duration: const Duration(seconds: 1));
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('로그아웃 실패', e.toString(),
          duration: const Duration(seconds: 1));
    }
  }
}
