import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:souyoutoo/routes/routes_name.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final box = GetStorage();
                box.write('isLoggedIn', true);
                Get.offAllNamed(homeRoute);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
