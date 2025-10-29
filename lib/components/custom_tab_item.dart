import 'package:flutter/material.dart';
import 'package:souyoutoo/components/app_text.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class CustomTabItem extends StatelessWidget {
  final String label;
  final int index;
  final int currentIndex;
  final String? image;
  final Function(int) onTap;

  const CustomTabItem({
    Key? key,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == currentIndex;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? appAmber : const Color(0xFFFFDB60),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Image.asset(
                image!,
                width: 24,
                height: 24,
                color: isSelected ? appBlack : appDimGray,
              ),
              isSelected
                  ? AppTextBold(text: label, fontSize: 12)
                  : AppTextRegular(text: label, fontSize: 12),
            ],
          ),
        ),
      ),
    );
  }
}
