import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/complete_case_response.dart';

abstract base class TrailRepo {
  Future<GetAllCaseResp?> getCases();
  Future<CaseByIdResponse?> getCaseByID(id);
  Future<CompleteCaseResponse?> completeCase(CompletenessRequest req);
}
