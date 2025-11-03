import 'package:get/state_manager.dart';

class MainTabViewController extends GetxController {
  var currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
