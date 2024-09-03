import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_test/counter_controller.dart';
import 'package:getx_test/first.dart';
import 'package:getx_test/home.dart';
import 'package:getx_test/index_controller.dart';
import 'package:getx_test/second.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
  });

  final CounterController counterController = Get.put(CounterController());
  final IndexController indexController = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          onTap: (index) {
            if (index == 0) {
              // Navigator.pushNamed(context, '/home');
              Get.off(() => const MyHomePage(title: 'Home'));
            } else if (index == 1) {
              // Navigator.pushNamed(context, '/first');
              Get.off(() => const FirstPage());
            } else if (index == 2) {
              // Navigator.pushNamed(context, '/second');
              Get.off(() => const SecondPage());
            }
            onItemTapped(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              activeIcon: Icon(Icons.list_alt),
              label: 'First',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              activeIcon: Icon(Icons.person),
              label: 'Second',
            ),
          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: indexController.index,
          selectedItemColor: Colors.blue,
        ));
  }

  void onItemTapped(int index) {
    // IndexController의 changeIndex 메서드를 호출하여 상태 업데이트
    // counterController.increment();
    // Get.find<IndexController>().changeIndex(index);
    indexController.changeIndex(index);
  }
}
