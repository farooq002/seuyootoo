import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/instance_manager.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_image.dart';
import 'package:souyoutoo/components/app_progress_bar.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/background_container.dart';
import 'package:souyoutoo/module/tabs/tab_stats/cse_map_view/case_map_view.dart';
import 'package:souyoutoo/module/tabs/tab_stats/cse_map_view/shop_view/profile_view/profile_view.dart';
import 'package:souyoutoo/module/tabs/tab_stats/cse_map_view/shop_view/shop_view.dart';
// import 'package:souyoutoo/module/tabs/tab_stats/tab_stats_view_controller.dart';
import 'package:souyoutoo/routes/app_navigation.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class TabStatsView extends StatelessWidget {
  const TabStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(TabStatsViewController());
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: null,
        // onLeftIconPress: () => back(),
        // titleText: 'BACK',
        titleText: 'Achievements',
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
            top: 10,
            left: 0,
            right: 0,
            child: AppAchievementContainer(
              color: appWhite,
              borderColor: appBlack,
              shadowColor: appBlack,
              child: Row(
                children: [
                  /// Icon Container
                  AppAchievementContainer(
                    color: appLightGray,
                    borderColor: appGray,
                    shadowColor: appBlack,
                    child: appImageAsset(
                      icSuitCase,
                      color: appGray,
                    ).paddingAll(10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(
                          text: 'CASE GRINDER',
                          fontSize: 14,
                          fontFamily: 'VT323',
                        ),
                        AppTextRegular(
                          text: 'Complete 10 weekly goals.',
                          fontSize: 12,
                          fontFamily: 'VT323',
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AchievementProgressBar(
                              currentValue: 2750,
                              totalValue: 5000,
                            ),
                            AppTextRegular(
                              text: '7 / 10',
                              fontFamily: 'VT323',
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 10),
                  ),
                ],
              ).paddingAll(10),
            ).paddingAll(10),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => push(ShopView()),
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appBlack,
                      shadowColor: appBlack,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            borderColor: appGray,
                            shadowColor: appBlack,
                            child: appImageAsset(
                              tabTrial,
                              color: appBlack,
                              height: 30,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'FIRST VICTORY',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'You won your first case!',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
                  ),
                  GestureDetector(
                    onTap: () => push(const CaseMapView()),
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appBlack,
                      shadowColor: appBlack,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            borderColor: appGray,
                            shadowColor: appBlack,
                            child: appImageAsset(
                              icBook,
                              // color: appGray,
                              height: 24,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'JUNIOR PARALEGAL',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'Reached Level 5.',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
                  ),
                  GestureDetector(
                    onTap: () => push(const ProfileView()),
                    child: AppAchievementContainer(
                      color: appWhite,
                      borderColor: appBlack,
                      shadowColor: appBlack,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Icon Container
                          AppAchievementContainer(
                            color: appAmber,
                            borderColor: appGray,
                            shadowColor: appBlack,
                            child: appImageAsset(
                              icHat,
                              // color: appGray,
                              height: 24,
                            ).paddingAll(10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'BOOKING',
                                fontSize: 18,
                                fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'Completed 10 Lessons.',
                                fontSize: 14,
                                fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingOnly(left: 10).paddingAll(10),
                          appImageAsset(icCheck, color: appDimGreen),
                          AppTextRegular(
                            text: 'Completed',
                            fontFamily: 'VT323',
                            fontSize: 14,
                          ),
                        ],
                      ).paddingAll(10),
                    ).paddingAll(10),
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
