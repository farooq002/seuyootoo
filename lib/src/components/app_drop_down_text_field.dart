import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AppDropDownTextfield<T> extends StatelessWidget {
  final TextEditingController textController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final Color? backgroundColor;
  final bool? isSecured;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final TextInputType? keyboardType;
  final TextInputAction? submitLabel;
  final void Function(T?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool? isTextFieldEnabled;
  final Color? placeholderColor;
  final InputBorder? outlineBorder;
  final bool obscureText;
  final bool? isLanguage;
  final List<DropdownMenuItem<T>>? items;
  final double textFieldPadding;
  final String? Function(T?)? validation;
  final T? value;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isExpanded;
  final Color? dropdownColor;

  const AppDropDownTextfield({
    Key? key,
    required this.textController,
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder,
    this.backgroundColor,
    this.isSecured = false,
    this.fontSize = 13.0,
    this.fontFamily,
    this.color,
    this.keyboardType = TextInputType.text,
    this.submitLabel = TextInputAction.next,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.isLanguage,
    this.onTap,
    this.isTextFieldEnabled = true,
    this.placeholderColor = Colors.black,
    this.outlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.zero,
    ),
    this.obscureText = false,
    this.textFieldPadding = 0,
    this.items,
    this.validation,
    this.value,
    this.hintText,
    this.hintStyle,
    this.isExpanded = false,
    this.dropdownColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.all(textFieldPadding),
            child: TextFormField(
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily ?? 'PressStart2P',
              ),
              controller: textController,
              readOnly: true,
              enabled: isTextFieldEnabled,
              obscureText: isSecured ?? obscureText,
              keyboardType: keyboardType,
              textInputAction: submitLabel,
              onChanged: (val) => onChanged?.call(val as T),
              onFieldSubmitted: onFieldSubmitted,

              // ✅ Order: use String validator if provided → else typed validation(T?) → else empty check
              validator: (val) {
                if (validator != null) return validator!(val);

                if (validation != null) {
                  // Map current selection (stored as text) to T?; for String T this is fine.
                  final T? selected = (textController.text.trim().isEmpty)
                      ? null
                      : textController.text as T?;
                  return validation!(selected);
                }

                // Default: empty check
                if ((val ?? '').trim().isEmpty) {
                  return (placeholder?.isNotEmpty ?? false)
                      ? '$placeholder ${'is_required'.tr}'
                      : 'Required';
                }
                return null;
              },

              decoration: InputDecoration(
                filled: true,
                fillColor: color ?? appWhite,
                border: outlineBorder,
                focusedBorder: outlineBorder,
                labelText: placeholder,
                labelStyle: const TextStyle(fontSize: 14),
                prefixIcon: prefixIcon,
                suffixIcon:
                    suffixIcon ??
                    PopupMenuButton<T>(
                      position: PopupMenuPosition.under,
                      icon: Transform.rotate(
                        angle: math.pi / -2,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      onSelected: (T value) {
                        textController.text = value.toString();
                        onChanged?.call(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return items?.map((DropdownMenuItem<T> item) {
                              return PopupMenuItem<T>(
                                value: item.value,
                                child: item.child,
                              );
                            }).toList() ??
                            [];
                      },
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                    ),
              ),
              // validator: validator ?? (_) => 'TextField is not Empty',
            ),
          ),
        );
      },
    );
  }
}
