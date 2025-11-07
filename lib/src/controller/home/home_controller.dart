import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/logged_user_response.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

class HomeController extends BaseViewController {
  final HomeRepo homeRepo = HomeRepoImpl();
  final myCaseData = LoggedUserCasesResponses().obs;

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
