import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';
import 'package:souyoutoo/repo/home_repo/home_repo_impl.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

class HomeController extends BaseViewController {
  final HomeRepo homeRepo = HomeRepoImpl();
  final caseData = GetAllCaseResp().obs;
  final caseDetail = TakeCasesResponse().obs;

  getAllCases() async {
    startLoading();
    final response = await homeRepo.getCases();
    if (response != null) {
      caseData.value = response;
      stopLoading();
    }
    stopLoading();
  }

  takeCase() async {
    startLoading();
    final request = TakeCaseRequest(caseId: 1);
    final response = await homeRepo.takeCase(request);
    if (response != null) {
      caseDetail.value = response;
      stopLoading();
    }
    stopLoading();
  }
}
