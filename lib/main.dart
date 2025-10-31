import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/app_routes.dart';
import 'package:souyoutoo/utils/colors_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: 'app_name'.tr,
      initialRoute: '/',
      getPages: appRoutes,
    );
  }
}
