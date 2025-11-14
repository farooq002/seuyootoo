import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view.dart';
import 'package:souyoutoo/src/components/app_bar.dart';
import 'package:souyoutoo/src/components/app_button.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/app_text_field.dart';
import 'package:souyoutoo/src/components/background_container.dart';
import 'package:souyoutoo/src/components/upload_document.dart';
import 'package:souyoutoo/src/controller/home/home_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class CreateTicketView extends BaseView<HomeController> {
  CreateTicketView({super.key});

  @override
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget mBuild(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        titleText: 'HELP',
        centerTitle: false,
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
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(icBottom),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: AppAchievementContainer(
                color: appLightYellow,
                shadowColor: appAmber,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: AppTextRegular(
                          text: 'Create a Ticket',
                          fontSize: 16,
                        ),
                      ).paddingSymmetric(vertical: 10),
                      AppTextRegular(text: 'Title', fontSize: 12),
                      AppTextRegular(
                        text:
                            'In 85 or less characters summarize the topic of your ticket.',
                        fontSize: 9,
                      ).paddingSymmetric(vertical: 10),
                      AppTextField(
                        textController: TextEditingController(),
                        borderColor: appBlack,
                      ),
                      AppTextRegular(
                        text: 'Body',
                        fontSize: 12,
                      ).paddingSymmetric(vertical: 10),
                      AppTextRegular(
                        text:
                            'Explain what happened in detail below, remember to follow terms of service.',
                        fontSize: 9,
                      ),
                      AppTextField(
                        textController: TextEditingController(),
                        borderColor: appBlack,
                        minLine: 5,
                      ).paddingSymmetric(vertical: 10),
                      AppTextRegular(
                        text: 'Attachments (Optional)',
                        fontSize: 12,
                      ),
                      AppTextRegular(
                        text:
                            'Any extra files/images you would want staff to see, can be used to provide context.',
                        fontSize: 9,
                      ).paddingSymmetric(vertical: 10),
                      UploadDocument(
                        // ignore: invalid_use_of_protected_member
                        pickedFiles: controller.pickedFiles.value,
                        onUploadFiles: () => controller.uploadPdf(),
                        onRemoveFile: (index) =>
                            controller.pickedFiles.removeAt(index),
                      ),
                      AppElevatedButton(
                        text: 'Submit Ticket',
                        onPressed: () {},
                        offSetX: -6,
                        shadowColor: appLightBlack,
                        color: appDarkYellow,
                        textColor: appBlack,
                        offSetY: -6,
                      ),
                    ],
                  ).paddingAll(10),
                ),
              ).paddingAll(32),
            ),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     Positioned.fill(
      //       top: 0,
      //       // bottom: 100,
      //       child: appImageAsset(icBackground, fit: BoxFit.fill),
      //     ),

      //     // Positioned(
      //     //   top: MediaQuery.of(context).size.height / 8,
      //     //   left: 0,
      //     //   right: 0,
      //     //   child: appImageAsset(icJudge, height: 250),
      //     // ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: FractionallySizedBox(
      //         widthFactor: 1.0,
      //         heightFactor: 0.65,
      //         child: appImageAsset(icForeground, fit: BoxFit.fill),
      //       ),
      //     ),
      //     Positioned(
      //       top: MediaQuery.of(context).size.height * 0.43,
      //       bottom: 20,
      //       left: 0,
      //       right: 0,
      //       child:
      //     ),
      //   ],
      // ),
    );
  }
}
