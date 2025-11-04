

import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class BaseViewController extends GetxController{

  final RoundedLoadingButtonController btnController = RoundedLoadingButtonController();
  final absorb = false.obs;

    void startLoading() {
    absorb.value = true;
    btnController.start();
  }

  void stopLoading() {
    absorb.value = false;
    btnController.stop();
  }
}