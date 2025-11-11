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

class NewCaseView extends BaseView<HomeController> {
  NewCaseView({super.key});
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
          icon: Image.asset(icFrame),
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
            bottom: 100,
            child: appImageAsset(icBackground, fit: BoxFit.fill),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 8,
            left: 0,
            right: 0,
            child: appImageAsset(icJudge, height: 250),
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
              borderColor: appAmber,
              color: appAmber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning, size: 14).paddingOnly(right: 10, top: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(
                          text: 'IMPORTANT NOTICE',
                          fontSize: 8,
                        ).paddingOnly(bottom: 10),
                        AppTextRegular(
                          text:
                              'Starting a new case will redirect you to the SueYouToo.com website where you\'ll need to create an account and provide case details.',
                          fontSize: 7,
                          lineLimit: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 42),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            bottom: 10,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: AppTextRegular(
                      text: 'SELECT CASE TYPE',
                      fontSize: 12,
                      color: appWhite,
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.caseData.length,
                    itemBuilder: (context, index) {
                      final caseData = controller.caseData[index];
                      return AppAchievementContainer(
                        color: appDimBrown,
                        borderColor: appDimBrown,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            caseData.icon != null
                                ? appImageAsset(
                                    caseData.icon ?? '',
                                    color: caseData.color,
                                    height: 14,
                                  ).paddingOnly(right: 10, top: 10)
                                : Icon(
                                    Icons.more_horiz,
                                    color: caseData.color,
                                    size: 14,
                                  ).paddingOnly(right: 10, top: 10),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextRegular(
                                    text: caseData.name,
                                    fontSize: 12,
                                  ).paddingOnly(bottom: 10),
                                  AppTextRegular(
                                    text: caseData.description ?? '',
                                    fontSize: 8,
                                    lineLimit: 10,
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ).paddingAll(10),
                      ).paddingAll(10);
                    },
                  ),

                  Center(
                    child: AppTextRegular(
                      text: 'WHAT YOU\'LL NEED',
                      fontSize: 12,
                      color: appWhite,
                    ),
                  ),
                  AppAchievementContainer(
                    color: appDimBrown,
                    borderColor: appDimBrown,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: appBlue,
                              size: 16,
                            ).paddingOnly(right: 10),
                            Expanded(
                              child: AppTextRegular(
                                text:
                                    'Valid email address for account creation',
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                        Row(
                          children: [
                            // Icon(Icons.insert_drive_file, color: appGreen),
                            appImageAsset(
                              icFolder,
                              color: appGreen,
                            ).paddingOnly(right: 10),
                            Expanded(
                              child: AppTextRegular(
                                text: 'Case details and relevant documents',
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 16,
                              color: appPurple,
                            ).paddingOnly(right: 10),
                            Expanded(
                              child: AppTextRegular(
                                text: 'Defendant information (name, address)',
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 16,
                              color: Colors.orange,
                            ).paddingOnly(right: 10),
                            Expanded(
                              child: AppTextRegular(
                                text: 'Estimated damages or claim amount',
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ).paddingAll(10),
                      ],
                    ),
                  ).paddingAll(10),
                  AppTextIcon(
                    text: 'CONTINUE TO WEBSITE',
                    onPressed: () {
                      Get.toNamed(caseUpdateRoute);
                    },
                    backgroundColor: appGreen,
                    foregroundColor: appBlack,
                    shadowColor: appLightBlack,
                    icon: appImageAsset(icWebsite),
                    offSetX: -6,
                    offSetY: -6,
                  ).paddingAll(10),

                  AppAchievementContainer(
                    color: appOftenWhite,
                    borderColor: appOftenWhite,
                    child: Row(
                      children: [
                        Icon(Icons.info, color: appBlue).paddingOnly(right: 10),
                        Expanded(
                          child: AppTextRegular(
                            text:
                                'You\'ll be redirected to SueYouToo.com to complete your case filing. Your progress will sync back to this app once submitted.',
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ).paddingAll(10),
                ],
              ).paddingAll(32),
            ),
          ),
        ],
      ),
    );
  }
}
