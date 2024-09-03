import 'package:get/state_manager.dart';

class IndexController extends GetxController {
  final RxInt _index = 0.obs;
  final RxString _name = ''.obs;

  int get index => _index.value;

  String get name => _name.value;

  void changeIndex(int index) {
    _index.value = index;
  }

  void changeName(String name) {
    _name.value = name;
  }
}
