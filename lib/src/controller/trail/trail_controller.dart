import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/repo/trail_repo/trail_repo.dart';
import 'package:souyoutoo/repo/trail_repo/trail_repo_impl.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';

class TrailController extends BaseViewController{
  final TrailRepo trailRepo = TrailRepoImp();

final caseData = GetAllCaseResp().obs;
final caseDetail = CaseByIdResponse().obs;


  @override
  void onInit() {
    super.onInit();
    getAllCases();
  }
   getAllCases() async {
    startLoading();
    final response = await trailRepo.getCases();
    stopLoading();
    if (response != null) {
      caseData.value = response;
    }
  }

   getCaseById(caseId) async {
    startLoading();
    final response = await trailRepo.getCaseByID(caseId);
    stopLoading();
    if (response != null) {
      caseDetail.value = response;
      Get.toNamed(questionRoute, arguments: {'caseId': caseId});
    }
    
  }
}