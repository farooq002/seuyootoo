import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';


abstract class BaseView<T extends BaseViewController> extends StatelessWidget {
  const BaseView({super.key});

  T get controller; // each child view will provide its controller

  Widget mBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// Actual screen UI
        Scaffold(
          body: mBuild(context),
        ),

        /// Loading overlay
        Obx(() {
          return controller.absorb.value
              ? Stack(
                  children: const [
                    Opacity(
                      opacity: 0.8,
                      child: ModalBarrier(
                          dismissible: false, color: Colors.black),
                    ),
                    Center(child: CircularProgressIndicator()),
                  ],
                )
              : const SizedBox.shrink();
        }),

      ],
    );
  }
}