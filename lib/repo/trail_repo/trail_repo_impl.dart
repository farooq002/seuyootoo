import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/complete_case_response.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/remote/network_request.dart';
import 'package:souyoutoo/remote/network_service.dart';
import 'package:souyoutoo/repo/trail_repo/trail_repo.dart';

base class TrailRepoImp extends TrailRepo {
  @override
  Future<CaseByIdResponse?> getCaseByID(id) async {
    dynamic result;
    final request = NetworkRequest(
      path: "${NetworkService.getCaseByID}/$id/",
      // path: NetworkService.getCaseByID,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<CaseByIdResponse>(
      request,
      CaseByIdResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
      },
      orElse: () {
        print('Error');
      },
    );
    return result;
  }

  @override
  Future<GetAllCaseResp?> getCases() async {
    dynamic result;
    final request = NetworkRequest(
      path: NetworkService.getCases,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<GetAllCaseResp>(
      request,
      GetAllCaseResp.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }

  @override
  Future<CompleteCaseResponse?> completeCase(CompletenessRequest req) async {
    dynamic result;
    final request = NetworkRequest(
      path: NetworkService.completeCase,
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json(req.toMap()),
    );
    final response = await NetworkService.shared.execute<CompleteCaseResponse>(
      request,
      CompleteCaseResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }

  @override
  Future<TakeCasesResponse?>? takeCase(id) async {
    dynamic result;
    final request = NetworkRequest(
      path: '${NetworkService.takeCase}/',
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json({'case_id': id}),
    );
    final response = await NetworkService.shared.execute<TakeCasesResponse>(
      request,
      TakeCasesResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }
}
