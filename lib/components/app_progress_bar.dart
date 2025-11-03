import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AchievementProgressBar extends StatelessWidget {
  final double currentValue;
  final double totalValue;

  const AchievementProgressBar({
    super.key,
    required this.currentValue,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    // final progress = (currentValue / totalValue).clamp(0.0, 1.0);

    return Container(
      height: 14,
      decoration: BoxDecoration(
        border: Border.all(color: appBlack, width: 1.5), // full white border
        color: appWhite, // base color (unfilled part)
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final progressWidth =
              constraints.maxWidth * (currentValue / totalValue);
          return Stack(
            children: [
              Container(color: Colors.white),
              Container(width: progressWidth, color: Colors.blue[400]),
            ],
          );
        },
      ),
    );
  }
}
