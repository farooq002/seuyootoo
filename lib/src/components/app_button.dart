import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

import 'app_text.dart';

class AppTextButton extends StatelessWidget {
  final text;
  final double? fontSize;
  final void Function() onPressed;
  final String? fontFamily;
  final bool? isUnderline;
  final Color? color;
  final Color? decorationColor;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.decorationColor,
    this.isUnderline = false,
    this.fontSize,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: AppTextThin(
        text: text,
        fontSize: fontSize,
        fontFamily: fontFamily,
        isUnderline: isUnderline,
        decorationColor: decorationColor,
        color: color,
      ),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Color? shadowColor;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? padding;
  final double? offSetX;
  final double? offSetY;
  final Size? minimumSize;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.textSize,
    this.padding,
    this.minimumSize,
    this.offSetX,
    this.borderColor,
    this.shadowColor,
    this.offSetY,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor ?? appLightBlack, width: 2),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? appLightBlack,
            offset: Offset(offSetX ?? 6, offSetY ?? 6),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          minimumSize: minimumSize,

          shadowColor: appLightBlack,
          padding: EdgeInsets.symmetric(
            horizontal: padding != null ? padding! : 16,
            vertical: padding ?? 12,
          ),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: AppTextBold(
          text: text,
          fontSize: textSize ?? 18,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AppOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: AppTextRegular(text: text),
    );
  }
}
