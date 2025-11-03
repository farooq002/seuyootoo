import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_image.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/components/background_container.dart';
import 'package:souyoutoo/module/views/profile_view/profile_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileViewController());
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'BACK',
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
        customButton: AppTextIcon(
          onPressed: () {},
          icon: appImageAsset(icTrophy, height: 14),
          text: 'TOKENS 47',
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            bottom: 100,
            child: Image.asset(icBackground, fit: BoxFit.fill),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.65,
              child: Image.asset(icForeground, fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppAchievementContainer(
                    color: appShadowBrown,
                    borderColor: appBlack,
                    shadowColor: appBlack,
                    child: Column(
                      children: [
                        Card(child: appImageAsset(icProfile)),
                        AppTextRegular(text: 'COUNSELORMAX', fontSize: 18),
                        AppTextRegular(text: 'LEVEL 5 - JUNIOR', fontSize: 12),
                        AppTextRegular(text: 'PARALEGAL', fontSize: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextRegular(
                              text: 'XP: 2750 / 5000',
                              fontSize: 12,
                            ),
                            Container(
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final progressWidth =
                                      constraints.maxWidth * (2750 / 5000);
                                  return Stack(
                                    children: [
                                      Container(color: Colors.white),
                                      Container(
                                        width: progressWidth,
                                        color: appGreen,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                      ],
                    ),
                  ).marginAll(10),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.4,
                        ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: appShadowBrown,
                        child: Column(
                          children: [
                            AppTextRegular(
                              text: controller.categories[index].name,
                              fontSize: 12,
                            ).paddingOnly(bottom: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.categories[index].isIconAvailable ==
                                        true
                                    ? appImageAsset(
                                        controller.categories[index].icon ?? '',
                                      )
                                    : SizedBox.shrink(),
                                AppTextBold(
                                  text:
                                      controller.categories[index].price ?? '0',

                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ],
                        ).paddingAll(10),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
