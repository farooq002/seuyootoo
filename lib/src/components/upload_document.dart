import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/src/components/app_image.dart';
import 'package:souyoutoo/src/components/app_text.dart';
import 'package:souyoutoo/src/components/round_background.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class UploadDocument extends StatelessWidget {
  final List<PlatformFile> pickedFiles;
  final Function onUploadFiles;
  final String? text;
  final Function(int) onRemoveFile;
  const UploadDocument({
    super.key,
    this.text,
    required this.pickedFiles,
    required this.onUploadFiles,
    required this.onRemoveFile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          radius: const Radius.circular(12),
          borderPadding: const EdgeInsets.symmetric(vertical: 12),
          color: appBlack,
          borderType: BorderType.Rect,
          strokeWidth: 2,
          // dashPattern: [, 1],
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                appImageAsset(uploadFile).paddingOnly(top: 22, bottom: 8),

                GestureDetector(
                  onTap: () => onUploadFiles(),
                  child: AppTextRegular(
                    textAlign: TextAlign.center,
                    text: 'DROP OR UPLOAD'.tr,
                    fontSize: 10,
                  ).paddingAll(10),
                ),
              ],
            ),
          ).paddingOnly(bottom: 22),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pickedFiles.length,
          itemBuilder: (context, index) {
            final file = pickedFiles[index];
            return BackgroundBox(
              innerPadding: 4,
              radius: 8,
              onTap: () {},
              data: Row(
                children: [
                  appImageAsset(
                    uploadFile,
                    color: Theme.of(context).secondaryHeaderColor,
                  ).paddingOnly(top: 8, bottom: 8),
                  const SizedBox(height: 10),
                  Expanded(
                    child: AppTextRegular(
                      overflow: true,
                      text: file.name,
                      textAlign: TextAlign.center,
                      fontSize: 10,
                    ).paddingOnly(left: 10),
                  ),
                  // const Spacer(),
                  GestureDetector(
                    onTap: () => onRemoveFile(index),
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: Theme.of(context).primaryColor == appBlack
                          ? appWhite
                          : appBlack,
                    ),
                  ),
                ],
              ).marginSymmetric(horizontal: 8),
            ).marginSymmetric(vertical: 10);
          },
        ),
      ],
    );
  }
}

// class UploadImage extends StatelessWidget {
//   final RxList<PlatformFile> pickedFiles;
//   final Function onUploadFiles;
//   final Function(int) onRemoveFile;
//   final BuildContext? dialogContext;
//   final String? text;
//   final bool? isTapOnItem;

//   const UploadImage({
//     super.key,
//     required this.pickedFiles,
//     required this.onUploadFiles,
//     required this.onRemoveFile,
//     this.text,
//     this.dialogContext,
//     this.isTapOnItem = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         DottedBorder(
//           padding: const EdgeInsets.all(8),
//           radius: const Radius.circular(12),
//           color: appGray,
//           borderType: BorderType.RRect,
//           strokeWidth: 0.4,
//           dashPattern: const [8, 6],
//           child: GestureDetector(
//             onTap: () => onUploadFiles(),
//             child: Center(
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(context.height / 2),
//                       color: appLightGray,
//                     ),
//                     child: const AppSVGImage(
//                       imageName: uploadFile,
//                       width: 32,
//                       height: 32,
//                     ),
//                   ),
//                   AppTextRegular(
//                     text: text ?? 'upload_image'.tr,
//                     fontSize: 14,
//                   ).paddingOnly(left: 10),
//                 ],
//               ),
//             ),
//           ),
//         ).paddingOnly(bottom: 22),
//         Obx(
//           () => ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             // ignore: invalid_use_of_protected_member
//             itemCount: pickedFiles.value.length,
//             itemBuilder: (context, index) {
//               // ignore: invalid_use_of_protected_member
//               final file = pickedFiles.value[index];
//               return BackgroundBox(
//                 innerPadding: 4,
//                 radius: 8,
//                 onTap: () {},
//                 data: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: AppSVGImage(
//                         imageName: uploadFile,
//                         imageColor: Theme.of(context).secondaryHeaderColor,
//                       ),
//                     ).paddingOnly(right: 10),
//                     Expanded(
//                       child: AppTextSemiBold(
//                         text: file.name,
//                         textAlign: TextAlign.center,
//                         fontSize: 10,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                       onTap: () => onRemoveFile(index),
//                       child: const Icon(Icons.clear, size: 18),
//                     ),
//                   ],
//                 ).marginSymmetric(horizontal: 8),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
