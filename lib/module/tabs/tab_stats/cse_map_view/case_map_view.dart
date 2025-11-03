import 'package:flutter/material.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_image.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/routes/app_navigation.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class CaseMapView extends StatelessWidget {
  const CaseMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'Case Map',
        leftIconSvg: icBack,
        onLeftIconPress: () => back(),
        customButton: AppTextIcon(
          onPressed: () {},
          text: '47',
          icon: appImageAsset(icTrophy, height: 14),
          fontSize: 14,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: appImageAsset(icCaseMapImage, fit: BoxFit.fill),
      ),
    );
  }
}
