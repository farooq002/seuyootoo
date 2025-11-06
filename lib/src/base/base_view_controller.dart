

import 'package:get/get.dart';

class BaseViewController extends GetxController{

  final absorb = false.obs;

    void startLoading() {
    absorb.value = true;
  }

  void stopLoading() {
    absorb.value = false;
  }
}