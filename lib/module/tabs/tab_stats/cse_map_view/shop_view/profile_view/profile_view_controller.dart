import 'package:get/get.dart';
import 'package:souyoutoo/model/category_model.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class ProfileViewController extends GetxController {
  List<Categories> get categories => [
    Categories(name: 'WINS'.tr, price: "23"),
    Categories(name: 'LOSSES'.tr, price: "7"),
    Categories(name: 'WIN RATE'.tr, price: "76%"),
    Categories(
      name: 'total_hours'.tr,
      price: "7",
      isIconAvailable: true,
      icon: icStreak,
    ),
  ];
}
