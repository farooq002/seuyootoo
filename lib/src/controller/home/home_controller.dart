import 'package:get/get.dart';
import 'package:souyoutoo/model/category_model.dart';
import 'package:souyoutoo/model/home_models/logged_user_response.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';
import 'package:souyoutoo/utils/image_constant.dart';

class HomeController extends BaseViewController {
  final HomeRepo homeRepo = HomeRepoImpl();
  final myCaseData = LoggedUserCasesResponses().obs;
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

  @override
  void onInit() {
    super.onInit();
    getMyCases();
  }

  getMyCases() async {
    startLoading();
    final response = await homeRepo.getMyCases();
    stopLoading();
    if (response != null) {
      myCaseData.value = response;
    }
  }
}
