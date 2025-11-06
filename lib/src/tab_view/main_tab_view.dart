import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/pages/home_view/home_view.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class MainTabView extends StatelessWidget {
  MainTabView({super.key});

  // ✅ STATE OUTSIDE BUILD → works even when widget is stateless
  static final ValueNotifier<int> currentIndex = ValueNotifier(0);

  final pages = const [
    HomeView(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder()
  ];

  final labels = ['HOME', 'TRIAL', 'CASES', 'STATS', 'NEWS'];

  final icons = [tabHome, tabTrial, tabCases, tabStats, tabNews];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appBrown,

        body: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (_, index, __) {
            return IndexedStack(index: index, children: pages);
          },
        ),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (_, index, __) {
            return Row(
              children: List.generate(5, (i) {
                final isSelected = index == i;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      switch (i) {
                        case 0:
                          currentIndex.value = 0;
                        case 1:
                          Get.toNamed(trailRoute);
                        case 2:
                          Get.toNamed(questionRoute);
                        case 3:
                          Get.toNamed(statsRoute);
                        case 4:
                          Get.toNamed(newsRoute);
                          break;
                        default:
                          currentIndex.value = 0;
                      }
                    },
                    child: Container(
                      height: 76,
                      decoration: BoxDecoration(
                        color: isSelected ? appAmber : appYellow,
                        border: Border.all(color: appBlack, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            icons[i],
                            width: 24,
                            height: 24,
                            color: isSelected ? appBlack : appGray,
                          ),
                          AppTextBold(
                            text: labels[i],
                            fontSize: 12,
                            color: isSelected ? appBlack : appGray,
                          ),
                        ],
                      ).paddingOnly(top: 8),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
