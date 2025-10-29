import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/image_constant.dart';
import 'custom_tab_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF7D4E31), // Wood-like background color
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 80,

        decoration: BoxDecoration(
          color: const Color(0xFFFFDB60),
          border: Border.all(color: Colors.black, width: 4.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTabItem(
              label: 'HOME',
              image: tabHome,
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 2.0,
              radius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              width: 2.0,
            ),
            CustomTabItem(
              label: 'TRIAL',
              image: tabTrial,
              index: 1,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2.0,
              width: 2.0,
            ),
            CustomTabItem(
              image: tabCases,
              label: 'CASES',
              index: 2,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2.0,
              width: 2.0,
            ),
            CustomTabItem(
              image: tabStats,
              label: 'STATS',
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
            const VerticalDivider(
              color: Colors.black,
              thickness: 2.0,
              width: 2.0,
            ),
            CustomTabItem(
              image: tabNews,
              label: 'NEWS',
              index: 4,
              currentIndex: currentIndex,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
