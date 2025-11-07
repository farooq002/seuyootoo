import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/user_profile.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/utils/local_storage/storage_service.dart';

class TabHomeViewController extends BaseViewController {
  final size = MediaQuery.of(Get.context!).size;
  final HomeRepo repository = HomeRepoImpl();
  final streak = 0.obs;
  final profileData = GetProfileResponse().obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    getProfile();
  }

  loadUserData() {
    final data = StorageService.instance.getUser();
    if (data != null) {
      streak.value = data.streak;
    }
  }

  getProfile() async {
    startLoading();

    final response = await repository.getProfile();
    if (response != null) {
      stopLoading();
      debugPrint(response.toString());
      profileData.value = response;
    }

    stopLoading();
  }
}
