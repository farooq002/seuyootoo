import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_bar.dart';
import 'package:souyoutoo/components/app_button.dart';
import 'package:souyoutoo/components/app_image.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/components/app_text_icon.dart';
import 'package:souyoutoo/components/background_container.dart';
import 'package:souyoutoo/routes/app_navigation.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        leftIconSvg: icBack,
        onLeftIconPress: () => back(),
        customButton: AppTextIcon(
          onPressed: () {},
          icon: appImageAsset(icTrophy, height: 14),
          text: 'TOKENS 47',
        ),
        titleText: 'Shop',
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
                    color: appgray,
                    borderColor: appGray,
                    isShadowAvailblle: false,
                    child: appImageAsset(icTime).paddingSymmetric(vertical: 10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextRegular(
                          text: 'Extra Time',
                          fontSize: 10,
                          // fontFamily: 'PressStart2P',
                        ),
                        AppTextRegular(
                          text:
                              'Get 30 extra seconds for a tough case question.',
                          fontSize: 7,
                          lineLimit: 4,
                          overflow: true,
                          // fontFamily: 'VT323',
                        ),
                      ],
                    ).paddingAll(10),
                  ),
                  AppAchievementContainer(
                    color: appBlue,
                    borderColor: appGray,
                    isShadowAvailblle: false,
                    child: Column(
                      children: [
                        AppTextRegular(
                          text: '10',
                          fontSize: 8,
                          color: appAqua,
                        ).paddingOnly(bottom: 10),
                        appImageAsset(icFrame, height: 10),
                      ],
                    ).paddingAll(10),
                  ),
                ],
              ).paddingAll(10),
            ).paddingAll(10).marginAll(10),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Icon Container
                        AppAchievementContainer(
                          color: appAmber,
                          borderColor: appGray,
                          shadowColor: appBlack,
                          child: appImageAsset(
                            icSuitCase,
                            color: appBlack,
                            height: 30,
                          ).paddingAll(10),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'Leather Briefcase',
                                fontSize: 12,
                                // fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text:
                                    'A classic look for a seasoned professional.',
                                fontSize: 8,
                                // fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingAll(10).paddingOnly(left: 10),
                        ),
                        AppAchievementContainer(
                          color: appPurple,
                          borderColor: appGray,
                          shadowColor: appBlack,
                          child: Column(
                            children: [
                              AppTextRegular(
                                text: '150',
                                color: appWhite,
                                fontSize: 10,
                              ),
                              appImageAsset(
                                icFrame,
                                // color: appWhite,
                                height: 12,
                              ).paddingAll(10),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingAll(10),
                  AppAchievementContainer(
                    color: appShadowBrown,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'Golden Gavel',
                                fontSize: 12,
                                // fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text:
                                    'Show your status with this prestigious gavel skin.',
                                fontSize: 8,
                                // fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingAll(10).paddingOnly(left: 10),
                        ),
                        AppAchievementContainer(
                          color: appPurple,
                          borderColor: appGray,
                          shadowColor: appBlack,
                          child: Column(
                            children: [
                              AppTextRegular(
                                text: '500',
                                color: appWhite,
                                fontSize: 10,
                              ),
                              appImageAsset(
                                icFrame,
                                // color: appWhite,
                                height: 12,
                              ).paddingAll(10),
                            ],
                          ).paddingAll(10),
                        ),
                      ],
                    ).paddingAll(10),
                  ).paddingAll(10),
                  AppAchievementContainer(
                    color: appAmber,
                    borderColor: appBlack,
                    shadowColor: appBlack,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Icon Container
                        AppAchievementContainer(
                          color: appYellow,
                          borderColor: appGray,
                          shadowColor: appBlack,
                          child: appImageAsset(
                            icFrame,
                            color: appBrown,
                            height: 30,
                          ).paddingAll(10),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextRegular(
                                text: 'Token Pouch',
                                fontSize: 12,
                                // fontFamily: 'VT323',
                              ),
                              AppTextRegular(
                                text: 'A handful of tokens to get you started.',
                                fontSize: 8,
                                // fontFamily: 'VT323',
                              ),
                            ],
                          ).paddingAll(10).paddingOnly(left: 10),
                        ),
                        AppAchievementContainer(
                          color: appGreen,
                          borderColor: appGray,
                          shadowColor: appBlack,
                          child: AppTextButton(
                            text: '\$0.99',
                            color: appWhite,
                            fontSize: 10,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ).paddingAll(10),
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
