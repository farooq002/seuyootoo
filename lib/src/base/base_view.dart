import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';

abstract class BaseView<T extends BaseViewController> extends StatelessWidget {
  const BaseView({super.key});

  T get controller; // each child view will provide its controller

  Widget mBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Actual screen UI
        Scaffold(body: mBuild(context)),

        /// Loading overlay
        Obx(() {
          return controller.absorb.value
              ? Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.black,
                      ),
                    ),
                    Center(child: SpinKitPulsingGrid(color: appLightBrown)),
                  ],
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }
}
