import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final Color? backgroundColor;
  final TextEditingController textController;
  final bool? isSecured;
  final double? fontSize;
  final String? fontFamily;
  final TextInputType? keyboardType;
  final TextInputAction? submitLabel;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool? isTextFieldEnabled;
  final Color? placeholderColor;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? outlineBorder;
  final String? hintText;
  final bool obscureText;
  final double textFieldPadding;
  final int? minLine;
  final int? maxLine;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder,
    this.backgroundColor = Colors.white,
    required this.textController,
    this.inputFormatters,
    this.isSecured = false,
    this.fontSize = 12.0,
    this.hintText,
    this.fontFamily,
    this.keyboardType = TextInputType.text,
    this.submitLabel = TextInputAction.next,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.isTextFieldEnabled = true,
    this.placeholderColor = appBlack,
    this.outlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: appBlack),
      borderRadius: BorderRadius.zero,
    ),
    this.obscureText = false,
    this.textFieldPadding = 0,
    this.minLine,
    this.maxLine,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (field) {
        final hasError = field.errorText != null;
        return TextFormField(
          maxLines: (minLine ?? 1) > 1 ? null : 1,
          minLines: minLine,
          validator: validator,
          controller: textController,
          keyboardType: keyboardType,
          textInputAction: submitLabel,
          enabled: isTextFieldEnabled,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          style: TextStyle(fontSize: fontSize),
          focusNode: focusNode,
          onChanged: (value) {
            field.didChange(value);
            if (onChanged != null) onChanged!(value);
          },
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            errorText: field.errorText,
            errorMaxLines: 3,
            border: outlineBorder,
            focusedBorder: outlineBorder,
            labelText: placeholder,
            hintText: hintText,

            labelStyle: const TextStyle(fontSize: 14),
            hintStyle: TextStyle(
              fontSize: 18,
              fontFamily: 'VT323',
              locale: Locale('ar'),
              color: hasError ? fieldErorr : placeholderColor,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ).paddingAll(textFieldPadding);
      },
    );
  }
}

class AppSecureTextField extends StatelessWidget {
  final TextEditingController textController;
  final Widget? suffixIcon;
  final bool? obscureText;

  const AppSecureTextField({
    super.key,
    required this.textController,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      textController: textController,
      suffixIcon: suffixIcon,
      obscureText: obscureText ?? false,
    );
  }
}
