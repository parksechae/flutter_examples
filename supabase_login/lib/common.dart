import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:supabase_login/controller/navigation_controller.dart';

class Common {
  static NavigationController navigationController =
      Get.find<NavigationController>();

  static Widget myBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        navigationController.changeIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.saved_search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person),
          label: '마이',
        ),
      ],
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationController.index,
      selectedItemColor: Colors.blue,
    );
  }
}
// Widget myBottomNavigationBar() {
//   NavigationController navigationController = Get.find<NavigationController>();

//   return BottomNavigationBar(
//     onTap: (index) {
//       navigationController.changeIndex(index);
//     },
//     items: const [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.search_outlined),
//         activeIcon: Icon(Icons.saved_search),
//         label: '검색',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home_outlined),
//         activeIcon: Icon(Icons.home),
//         label: '홈',
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.person_outlined),
//         activeIcon: Icon(Icons.person),
//         label: '마이',
//       ),
//     ],
//     backgroundColor: Colors.white,
//     type: BottomNavigationBarType.fixed,
//     // currentIndex: Get.find<HomeBottomController>().index,
//     currentIndex: navigationController.index,
//     selectedItemColor: Colors.blue,
//     // unselectedItemColor: Colors.black54,
//     // showSelectedLabels: false,
//     // showUnselectedLabels: false,
//     // enableFeedback: false,
//     // iconSize: 30.0,
//   );
// }
