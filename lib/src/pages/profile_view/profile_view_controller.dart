import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/category_model.dart';
import 'package:souyoutoo/model/home_models/achievements_response.dart';
import 'package:souyoutoo/model/home_models/user_profile.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

import 'package:souyoutoo/utils/image_constant.dart';

class ProfileViewController extends BaseViewController {
  List<Categories> get categories => [
    Categories(name: 'WINS'.tr, price: "23"),
    Categories(name: 'LOSSES'.tr, price: "7"),
    Categories(name: 'WIN RATE'.tr, price: "76%"),
    Categories(
      name: 'Streak'.tr,
      price: ' ${profileData.value.streak ?? 0}',
      isIconAvailable: true,
      icon: icStreak,
    ),
  ];

  final HomeRepo repository = HomeRepoImpl();
  final profileData = GetProfileResponse().obs;
  final achievementData = AchievementsResponse().obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getAchievements();
  }

  getProfile() async {
    startLoading();

    final response = await repository.getProfile();
    if (response != null) {
      stopLoading();
      debugPrint(response.toString());
      // Get.offAllNamed();
      profileData.value = response;
    }

    stopLoading();
  }

  getAchievements() async {
    startLoading();

    final response = await repository.achievements();
    if (response != null) {
      stopLoading();
      debugPrint(response.toString());
      achievementData.value = response;
    }

    stopLoading();
  }
}
