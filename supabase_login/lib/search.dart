import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:supabase_login/common.dart';
import 'package:supabase_login/controller/navigation_controller.dart';
import 'package:supabase_login/controller/user_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final UserController userController = Get.find<UserController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();

  Future<void> _signOut(BuildContext context) async {
    userController.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('검색 페이지')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (userController.isSignedIn) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('검색 페이지'),
                  ],
                );
              } else {
                return const Column(
                  children: [Text('로그인 하세요.')],
                );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => Common.myBottomNavigationBar()),
    );
  }
}
