import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_login/common.dart';
import 'package:supabase_login/controller/navigation_controller.dart';
import 'package:supabase_login/controller/user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UserController userController = Get.find<UserController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();

  Future<void> _signOut(BuildContext context) async {
    userController.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 페이지')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (userController.isSignedIn) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('email : ${userController.user!.email}'),
                    const SizedBox(height: 20),
                    Text('id : ${userController.user!.id}'),
                    const SizedBox(height: 20),
                    Text('createdAt : ${userController.user!.createdAt}'),
                    const SizedBox(height: 20),
                    Text('updatedAt : ${userController.user!.updatedAt}'),
                    const SizedBox(height: 20),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/signin');
                        },
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
