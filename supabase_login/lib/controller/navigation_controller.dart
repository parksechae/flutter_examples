import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _index = 1.obs;

  int get index => _index.value;

  void changeIndex(int index) {
    _index.value = index;

    if (index == 0) {
      Get.offAllNamed('/search');
    } else if (index == 2) {
      Get.offAllNamed('/mypage');
    } else {
      Get.offAllNamed('/home');
    }
  }
}
