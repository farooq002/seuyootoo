import 'package:flutter/material.dart';
import 'package:souyoutoo/utils/colors_name.dart';

import 'app_text.dart';

class AppTextButton extends StatelessWidget {
  final text;
  final double? fontSize;
  final void Function() onPressed;
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
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: AppTextThin(
        text: text,
        fontSize: fontSize,
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
  final Color? textColor;
  final double? textSize;
  final double? padding;
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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        minimumSize: minimumSize,
        padding: EdgeInsets.symmetric(
          horizontal: padding != null ? padding! : 16,
          vertical: padding ?? 12,
        ),
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(width: 2, color: appBlack),
        ),
        elevation: 5, // optional: keep shadow
      ),
      onPressed: onPressed,
      child: AppTextBold(
        text: text,
        fontSize: textSize ?? 18,
        color: textColor ?? Colors.white,
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
