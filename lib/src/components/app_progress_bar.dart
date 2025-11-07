import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AchievementProgressBar extends StatelessWidget {
  final dynamic currentValue;
  final dynamic totalValue;

  const AchievementProgressBar({
    super.key,
    required this.currentValue,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      decoration: BoxDecoration(
        border: Border.all(color: appBlack, width: 1.5),
        color: appWhite,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final progressWidth =
              constraints.maxWidth *
              ((totalValue == 0 ? 0 : currentValue / totalValue).clamp(
                0.0,
                1.0,
              ));
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
