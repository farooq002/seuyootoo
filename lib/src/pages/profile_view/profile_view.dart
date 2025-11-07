import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/pages/profile_view/profile_view_controller.dart';
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
        customButton: Obx(
          () => AppTextIcon(
            onPressed: () {},
            icon: appImageAsset(icTrophy, height: 14),
            text: 'TOKENS ${controller.profileData.value.tokens ?? 1}',
          ),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppAchievementContainer(
                    color: appShadowBrown,
                    borderColor: appShadowBrown,
                    shadowColor: appBlack,
                    child: Column(
                      children: [
                        Obx(
                          () => Card(
                            child:
                                controller.profileData.value.profileImage !=
                                    null
                                ? Image.network(
                                    controller.profileData.value.profileImage!,
                                    height: 100,
                                  )
                                : appImageAsset(icProfile, height: 30),
                          ),
                        ),
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
                          childAspectRatio: 2.3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(width: 2, color: appBlack),
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
                  ).paddingAll(10),
                  AppAchievementContainer(
                    borderColor: appLightYellow,
                    color: appLightYellow,
                    borderWidth: 4.0,
                    shadowColor: appBlack,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: AppTextRegular(
                            text: 'ACHIEVEMENTS',
                            fontSize: 14,
                          ).paddingAll(10).paddingOnly(top: 10),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // itemCount: controller
                          //     .achievementData
                          //     .value
                          //     .achievement
                          //     ?.length, // ??
                          itemCount: controller.boxItems.length,
                          itemBuilder: (context, index) {
                            // final boxItem = controller.boxItems[index];
                            final achievements = controller
                                .achievementData
                                .value
                                .achievement?[index];
                            return Row(
                              children: [
                                AppAchievementContainer(
                                  borderWidth: 4.0,
                                  color: appAmber,
                                  isShadowAvailblle: false,
                                  borderColor: appBlack,
                                  child: achievements?.icon != null
                                      ? Image.network(achievements?.icon ?? '')
                                      : appImageAsset(
                                          tabTrial,
                                          color: appBlack,
                                          height: 20,
                                        ).paddingAll(10),
                                ).paddingAll(10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextRegular(
                                      text:
                                          achievements?.name ?? "boxItem.name",
                                      fontSize: 12,
                                      color: appBlack,
                                    ),
                                    AppTextRegular(
                                      text:
                                          achievements?.description ??
                                          // boxItem.description ??
                                          '',
                                      fontSize: 10,
                                      color: appgray,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),

                        AppElevatedButton(
                          text: 'VIEW ALL',
                          color: appBlue,
                          onPressed: () {},
                          textSize: 12,
                        ).paddingAll(10).paddingOnly(bottom: 10),
                      ],
                    ),
                  ).paddingAll(10),
                  AppElevatedButton(
                    text: 'EDIT PROFILE',
                    color: appPurple,
                    onPressed: () {},
                    textSize: 14,
                  ).paddingAll(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
