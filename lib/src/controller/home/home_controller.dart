import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/category_model.dart';
import 'package:souyoutoo/model/home_models/logged_user_response.dart';
import 'package:souyoutoo/model/home_models/user_profile.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/src/components/app_file_picker.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class HomeController extends BaseViewController {
  final HomeRepo homeRepo = HomeRepoImpl();
  final myCaseData = LoggedUserCasesResponses().obs;
  final selectedIndex = false.obs;
  final selectedPushIndex = false.obs;
  final selectedEmailIndex = false.obs;
  final selectedMarketingIndex = false.obs;
  final selectedAutoSyncIndex = false.obs;
  final pickedFiles = <PlatformFile>[].obs;
  final profileData = GetProfileResponse().obs;
  final check = false.obs;
  final List<Categories> caseData = [
    Categories(
      name: 'PERSONAL INJURY',
      icon: icCar,
      color: appRed,
      description: 'Auto accidents, slip & fall, medical malpractice',
    ),
    Categories(
      name: 'CONTRACT DISPUTE',
      icon: icFolder,
      color: appBlue,
      description: 'Breach of contract, service agreements',
    ),
    Categories(
      name: 'LANDLORD/TENANT',
      icon: tabHome,
      color: appGreen,
      description: 'Security deposits, evictions, repairs',
    ),
    Categories(
      name: 'EMPLOYMENT',
      icon: icSuitCase,
      color: appBlue,
      description: 'Wrongful termination, wage disputes',
    ),
    Categories(
      name: 'DEBT COLLECTION',
      icon: icCard,
      color: appBlue,
      description: 'Unpaid invoices, loans, services',
    ),
    Categories(
      name: 'OTHER',

      // icon: ,
      color: appBlack,
      description: 'Small claims, consumer protection',
    ),
  ];

  List<Categories> get categories => [
    Categories(name: 'Call us'.tr, icons: Icon(Icons.phone)),
    Categories(name: 'Email'.tr, icons: Icon(Icons.mail)),
    Categories(name: 'Live Chat'.tr, icons: Icon(Icons.wechat_rounded)),
    Categories(name: 'Twitter'.tr, icons: Icon(Icons.mail)),
  ];

  @override
  void onInit() {
    super.onInit();
    getMyCases();
    getProfile();
  }

  getMyCases() async {
    startLoading();
    final response = await homeRepo.getMyCases();
    stopLoading();
    if (response != null) {
      myCaseData.value = response;
    }
  }

  Future<void> uploadPdf() async {
    // const int maxFileSize = 10 * 1024 * 1024; // 10 MB in bytes

    var pickedFilesRes = await AppFilePicker.shared.pickFile(
      FileType.image,
      [
        FileExtension.pdf,
        FileExtension.pdf,
        FileExtension.jpeg,
      ], // only PDF allowed
      allowMultiple: false,
    );

    // if (pickedFilesRes != null && pickedFilesRes.isNotEmpty) {
    final file = pickedFilesRes?.first;
    // if (file?.size > maxFileSize) {
    //   debugPrint('File too large: ${file?.size} bytes');
    //   showToast("Please select a PDF smaller than 10 MB");
    //   return;
    // }
    debugPrint('File selected: ${file?.name}');
    pickedFiles.value = pickedFilesRes!;
    // final pdfResponse = await homeRepository.uploadImage(
    //   platformFiles: pickedFilesRes,
    // );
    // if (pdfResponse != null) {
    //   pickedFile.value = pdfResponse;
    // }
    debugPrint('Files uploaded successfully: ${pickedFilesRes.toString()}');
    // }
  }

  getProfile() async {
    startLoading();

    final response = await homeRepo.getProfile();
    if (response != null) {
      stopLoading();
      debugPrint(response.toString());
      // Get.offAllNamed();
      profileData.value = response;
    }

    stopLoading();
  }
}
