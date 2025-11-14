import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_drop_down_text_field.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_field.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/components/round_background.dart';
import 'package:souyoutoo/src/components/upload_document.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class HelpView extends BaseView<HomeController> {
  HelpView({super.key});

  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'SUPPORT',
        leftIconSvg: icBack,
        onLeftIconPress: () => Get.back(),
      ),
      backgroundColor: appBrown,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icTop),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: [
                  AppAchievementContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appImageAsset(
                          icClock,
                          height: 40,
                          color: appBlack,
                        ).paddingOnly(right: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextRegular(
                              text: 'Response Time',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              color: appBlack,
                            ).paddingOnly(bottom: 10),
                            AppTextRegular(
                              text: 'Usually within 24 hours',
                              fontSize: 10,
                              textAlign: TextAlign.center,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingOnly(top: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icBottom),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            appImageAsset(icSupport).paddingOnly(right: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextRegular(
                                  text: 'Need Help?',
                                  fontSize: 14,
                                ),
                                AppTextRegular(
                                  text: 'We\'re here 24/7',
                                  fontSize: 8,
                                  color: appGray,
                                ),
                              ],
                            ),
                          ],
                        ),

                        AppTextRegular(
                          text:
                              'Send us a message and our support team will get back to you within 24 hours.',
                          fontSize: 8,
                          color: appGray,
                        ).paddingOnly(top: 10),
                      ],
                    ).paddingAll(10),
                  ),
                  AppTextRegular(
                    text: 'QUICK CONTACT',
                    fontSize: 8,
                    color: appAmber,
                  ).paddingSymmetric(vertical: 20),
                  // Obx(
                  //   () =>
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.9,
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
                            ?controller.categories[index].icons,
                            AppTextRegular(
                              text: controller.categories[index].name,
                              fontSize: 12,
                            ).paddingOnly(bottom: 10),
                          ],
                        ).paddingAll(10),
                      );
                    },
                  ),
                  // ),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    borderColor: appLightYellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(text: 'SEND MESSAGE', fontSize: 14),
                        AppTextRegular(
                          text: 'Subject',
                          fontSize: 9,
                        ).paddingSymmetric(vertical: 10),
                        AppDropDownTextfield(
                          textController: TextEditingController(),
                          placeholder: 'Select a topic...',
                        ),
                        AppTextRegular(
                          text: 'Your Email',
                          fontSize: 9,
                        ).paddingSymmetric(vertical: 10),
                        AppTextField(
                          textController: TextEditingController(),
                          placeholder: '',
                          hintText: 'email@example.com',
                        ),
                        AppTextRegular(
                          text: 'Message',
                          fontSize: 9,
                        ).paddingSymmetric(vertical: 10),
                        AppTextField(
                          textController: TextEditingController(),
                          placeholder: '',
                          hintText: 'Describe your issue...',
                          minLine: 5,
                        ),
                        AppTextRegular(
                          text: 'Attach Screenshot (Optional)',
                          fontSize: 9,
                        ).paddingSymmetric(vertical: 10),
                        UploadDocument(
                          pickedFiles: controller.pickedFiles.value,
                          onUploadFiles: () => controller.uploadPdf(),
                          onRemoveFile: (index) {
                            controller.pickedFiles.removeAt(index);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AppElevatedButton(
                              text: 'SEND MESSAGE',
                              onPressed: () {},
                              textSize: 14,
                              offSetX: -6,
                              offSetY: -6,
                              color: appRed,
                              borderColor: appBlack,
                              shadowColor: appBlack,
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingSymmetric(vertical: 20),
                  AppAchievementContainer(
                    color: appLightYellow,
                    shadowColor: appAmber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(text: 'POPULAR TOPICS', fontSize: 18),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appWhite,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'How to file a case?',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appWhite,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Track case status',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appWhite,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Refund policy',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ),
                        BackgroundBox(
                          onTap: () {},
                          backGroundColor: appWhite,
                          data: Row(
                            children: [
                              AppTextRegular(
                                text: 'Account issues',
                                fontSize: 12,
                              ),
                              const Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ).paddingAll(10),
                        ).paddingSymmetric(vertical: 10),
                      ],
                    ).paddingAll(10),
                  ),
                ],
              ).paddingAll(32),
            ),
          ],
        ),
      ),
    );
  }
}
