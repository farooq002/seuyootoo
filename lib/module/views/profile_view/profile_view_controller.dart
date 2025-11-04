import 'package:get/get.dart';
import 'package:souyoutoo/model/category_model.dart';
import 'package:souyoutoo/utils/colors_name.dart';
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

  List<Categories> get boxItems => [
    Categories(
      name: 'First Victory'.tr,
      description: "Won your first case.",
      backgroundColor: appAmber,
      color: appBlack,
      textColor: appBlack,
      icon: tabTrial,
    ),
    Categories(
      name: 'Legal Eagle'.tr,
      description: "Completed 10 cases.",
      backgroundColor: appAmber,
      color: appBlack,
      textColor: appBlack,
      icon: icBooks,
    ),
    Categories(
      name: '?????'.tr,
      description: "Win 5 cases in a row.",
      backgroundColor: appLightGray,
      color: appDimGray,
      textColor: appgray,
      icon: icTrophy,
    ),
  ];
}
