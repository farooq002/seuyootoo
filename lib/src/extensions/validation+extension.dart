// ignore_for_file: file_names
import 'package:get/get.dart';

class SouyouTooValidations {
  static final shared = SouyouTooValidations();

  String? Function(dynamic value) password() => ((value) {
    final text = (value ?? '').toString().trim();
    if (text.isEmpty) {
      return 'Password is Required'.tr;
    } else if (!RegExp(
      r'^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:;<>?,./])',
    ).hasMatch(value)) {
      return 'Password is Required'.tr;
    }
    return null;
  });

  String? Function(dynamic value) email() => ((value) {
    final text = (value ?? '').toString().trim();
    if (text.isEmpty) {
      return 'Email is Required'.tr;
    } else if (!RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(value)) {
      return 'This Is not A Valid Email'.tr;
    }
    return null;
  });
}
