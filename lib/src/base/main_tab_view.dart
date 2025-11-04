import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/module/pages/home_view/home_view.dart';
import 'package:souyoutoo/module/pages/news_view/news_view.dart';
import 'package:souyoutoo/module/pages/question_view/question_view.dart';
import 'package:souyoutoo/module/pages/stats/stats_view.dart';
import 'package:souyoutoo/module/pages/trial_view/trial_view.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class MainTabView extends StatelessWidget {
   MainTabView({super.key});

  // ✅ STATE OUTSIDE BUILD → works even when widget is stateless
  static final ValueNotifier<int> currentIndex = ValueNotifier(0);

  final pages = const [
    HomeView(),
    TrialView(),
    QuestionView(),
    StatsView(),
    NewsView(),
  ];

  final labels = [
    'HOME',
    'TRIAL',
    'CASES',
    'STATS',
    'NEWS',
  ];

  final icons = [
    tabHome,
    tabTrial,
    tabCases,
    tabStats,
    tabNews,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appBrown,

        // ✅ Body updates when ValueNotifier changes
        body: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (_, index, __) {
            return IndexedStack(
              index: index,
              children: pages,
            );
          },
        ),

        // ✅ Bottom Navigation
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (_, index, __) {
            return Row(
              children: List.generate(5, (i) {
                final isSelected = index == i;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => currentIndex.value = i,
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
