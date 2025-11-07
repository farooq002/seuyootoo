import 'package:flutter/material.dart';
import 'package:get/get.dart'; // 👈 If you're using GetX for navigation
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';
import 'package:souyoutoo/utils/local_storage/storage_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      bool isLoggedIn = StorageService.instance.getToken()?.isNotEmpty ?? false;
      if (!isLoggedIn) {
        Get.offAllNamed(loginRoute);
      } else {
        Get.offAllNamed(homeRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      body: Stack(
        fit: StackFit.expand,
        children: [
          appImageAsset(icSplashScreen, fit: BoxFit.cover),
          Center(child: appImageAsset(icJudge)),
        ],
      ),
    );
  }
}
