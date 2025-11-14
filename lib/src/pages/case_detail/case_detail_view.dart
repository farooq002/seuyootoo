import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_icon.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class CaseDetailView extends BaseView<HomeController> {
  CaseDetailView({super.key});
  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'My Case',
        centerTitle: false,
        onLeftIconPress: () => Get.back(),
        customButton: AppTextIcon(
          icon: appImageAsset(icFrame),
          onPressed: () {},
          text: 'Tokens 47',
          fontSize: 14,
          foregroundColor: appWhite,
          backgroundColor: appBlack,
          borderColor: appBlack,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            // bottom: 100,
            child: appImageAsset(icBackground, fit: BoxFit.fill),
          ),

          // Positioned(
          //   top: MediaQuery.of(context).size.height / 8,
          //   left: 0,
          //   right: 0,
          //   child: appImageAsset(icJudge, height: 250),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 0.65,
              child: appImageAsset(icForeground, fit: BoxFit.fill),
            ),
          ),

          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: AppTextIcon(
              text: 'Start a Case',
              onPressed: () {
                Get.toNamed(newCaseRoute);
              },
              backgroundColor: appGreen,
              foregroundColor: appBlack,
              shadowColor: appLightBlack,
              icon: Icon(Icons.add),
              offSetX: -6,
              offSetY: -6,
            ).paddingSymmetric(horizontal: 42),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextRegular(
                    text: 'Active Cases',
                    fontSize: 12,
                  ).paddingOnly(bottom: 20),
                  AppAchievementContainer(
                    borderColor: appDimBrown,
                    color: appDimBrown,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: appRed,
                                border: Border.all(width: 2, color: appBlack),
                              ),
                            ).paddingOnly(right: 10),
                            AppTextRegular(
                              text: 'CASE #2024-001',
                              fontSize: 12,
                            ),
                            const Spacer(),
                            AppAchievementContainer(
                              color: appAmber,
                              borderColor: appBlack,
                              isShadowAvailable: false,
                              child: AppTextRegular(
                                text: 'PENDING',
                                fontSize: 8,
                              ).paddingAll(10),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text: 'Personal Injury - Auto Accident',
                          fontSize: 12,
                        ),
                        AppTextRegular(
                          text:
                              'for damages sustained in rear-end collision on Main St.',
                          fontSize: 12,
                        ),
                        Row(
                          children: [
                            appImageAsset(
                              icClock,
                              color: appGray,
                              height: 16,
                            ).paddingOnly(right: 4),
                            AppTextRegular(
                              text: 'Filed 3 days ago',
                              fontSize: 8,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                AppTextRegular(
                                  text: '\$',
                                  fontSize: 12,
                                  color: appGreen,
                                ),
                                AppTextRegular(
                                  text: '\$15,000',
                                  fontSize: 8,
                                  color: appGreen,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    borderColor: appDimBrown,
                    color: appDimBrown,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: appGreen,
                                border: Border.all(width: 2, color: appBlack),
                              ),
                            ).paddingOnly(right: 10),
                            AppTextRegular(
                              text: 'CASE #2024-001',
                              fontSize: 12,
                            ),
                            const Spacer(),
                            AppAchievementContainer(
                              color: appGreen,
                              borderColor: appBlack,
                              borderWidth: 2.0,
                              isShadowAvailable: false,
                              child: AppTextRegular(
                                text: 'ACTIVE',
                                fontSize: 8,
                              ).paddingAll(10),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text: 'Personal Injury - Auto Accident',
                          fontSize: 12,
                        ),
                        AppTextRegular(
                          text:
                              'for damages sustained in rear-end collision on Main St.',
                          fontSize: 12,
                        ),
                        Row(
                          children: [
                            appImageAsset(
                              icClock,
                              color: appGray,
                              height: 16,
                            ).paddingOnly(right: 4),
                            AppTextRegular(
                              text: 'Filed 3 days ago',
                              fontSize: 8,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                AppTextRegular(
                                  text: '\$',
                                  fontSize: 12,
                                  color: appGreen,
                                ),
                                AppTextRegular(
                                  text: '\$15,000',
                                  fontSize: 8,
                                  color: appGreen,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 30),
                  AppTextRegular(
                    text: 'RECENT UPDATES',
                    fontSize: 12,
                  ).paddingOnly(bottom: 20),
                  AppAchievementContainer(
                    borderColor: appAmber,
                    color: appAmber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appImageAsset(icNotification).paddingOnly(right: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'CASE #2024-001 UPDATE',
                                fontSize: 12,
                              ),
                              AppTextRegular(
                                text:
                                    'Defendant has filed a response. Review required within 7 days.',
                                fontSize: 9,
                                lineLimit: 2,
                              ).paddingOnly(bottom: 20),
                              AppTextRegular(
                                text: '2 hours ago',
                                fontSize: 9,
                                lineLimit: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppAchievementContainer(
                    borderColor: appDimBrown,
                    color: appDimBrown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appImageAsset(icFolder).paddingOnly(right: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'DOCUMENT UPLOADED',
                                fontSize: 12,
                              ),
                              AppTextRegular(
                                text:
                                    'Medical records have been uploaded to Case #2024-001.',
                                fontSize: 9,
                                lineLimit: 2,
                              ).paddingOnly(bottom: 20),
                              AppTextRegular(
                                text: '1 day ago',
                                fontSize: 9,
                                lineLimit: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    borderColor: appDimBrown,
                    color: appDimBrown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appImageAsset(icBattery).paddingOnly(right: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'COURT DATE SCHEDULED',
                                fontSize: 12,
                              ),
                              AppTextRegular(
                                text:
                                    'Preliminary hearing set for Case #2024-002 on March 15th.',
                                fontSize: 9,
                                lineLimit: 2,
                              ).paddingOnly(bottom: 20),
                              AppTextRegular(
                                text: '3 days ago',
                                fontSize: 9,
                                lineLimit: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppTextRegular(
                    text: 'COMPLETED CASES',
                    fontSize: 12,
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    onTap: () => Get.toNamed(caseUpdateRoute),
                    borderColor: appDimBrown,
                    color: appDimBrown,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: appGreen,
                                border: Border.all(width: 2, color: appBlack),
                              ),
                            ).paddingOnly(right: 10),
                            AppTextRegular(
                              text: 'CASE #2023-045',
                              fontSize: 12,
                            ),
                            const Spacer(),
                            AppAchievementContainer(
                              color: appGreen,
                              borderColor: appBlack,
                              borderWidth: 2.0,
                              isShadowAvailable: false,
                              child: AppTextRegular(
                                text: 'SETTLED',
                                fontSize: 8,
                              ).paddingAll(10),
                            ),
                          ],
                        ),
                        AppTextRegular(
                          text: 'Landlord Dispute - Security Deposit',
                          fontSize: 12,
                        ),
                        AppTextRegular(
                          text:
                              'Successfully recovered full security deposit plus damages from landlord.',
                          fontSize: 12,
                        ).paddingOnly(bottom: 10),
                        Row(
                          children: [
                            appImageAsset(
                              icCheck,
                              color: appGreen,
                              height: 16,
                            ).paddingOnly(right: 4),
                            AppTextRegular(
                              text: 'Completed 2 weeks ago',
                              fontSize: 8,
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                AppTextRegular(
                                  text: '\$',
                                  fontSize: 12,
                                  color: appGreen,
                                ),
                                AppTextRegular(
                                  text: '\$2,200',
                                  fontSize: 8,
                                  color: appGreen,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                ],
              ).paddingAll(32),
            ),
          ),
        ],
      ),
    );
  }
}
