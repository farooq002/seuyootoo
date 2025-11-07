import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/achievements_response.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/get_user_achievements.dart';
import 'package:souyoutoo/model/home_models/give_achievement_response.dart';
import 'package:souyoutoo/model/home_models/logged_user_response.dart';
import 'package:souyoutoo/model/home_models/progress_model.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/model/home_models/user_profile.dart';
import 'package:souyoutoo/remote/network_request.dart';
import 'package:souyoutoo/remote/network_response.dart';
import 'package:souyoutoo/remote/network_service.dart';
import 'package:souyoutoo/repo/home_repo/home_repo.dart';

base class HomeRepoImpl extends HomeRepo {
  @override
  Future<NetworkResponse<CaseByIdResponse>?> getCaseByID() async {
    final request = NetworkRequest(
      // path: "${NetworkService.getCaseByID}/$id",
      path: NetworkService.getCaseByID,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<CaseByIdResponse>(
      request,
      CaseByIdResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return response;
  }

  @override
  Future<GetAllCaseResp>? getCases() async {
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
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }

  Future<NetworkResponse<LoggedUserCasesResponses>?> getMyCases() async {
    final request = NetworkRequest(
      path: NetworkService.getMyCases,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared
        .execute<LoggedUserCasesResponses>(
          request,
          LoggedUserCasesResponses.fromMap,
        );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return response;
  }

  @override
  Future<GetProfileResponse?>? getProfile() async {
    dynamic result;
    final request = NetworkRequest(
      path: NetworkService.getProfile,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<GetProfileResponse>(
      request,
      GetProfileResponse.fromMap,
    );

    response?.maybeWhen(
      ok: (data) {
        result = data;
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }

  Future<NetworkResponse<ProgressResponse>?> getProgress() async {
    final request = NetworkRequest(
      path: NetworkService.getProgress,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<ProgressResponse>(
      request,
      ProgressResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return response;
  }

  @override
  Future<AchievementsResponse?> achievements() async {
    dynamic result;
    final request = NetworkRequest(
      path: NetworkService.achievements,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<AchievementsResponse>(
      request,
      AchievementsResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }

  @override
  Future<NetworkResponse<GiveAchievementResponse>?> giveAchievement(
    GiveAchievementRequest req,
  ) async {
    final request = NetworkRequest(
      path: NetworkService.takeCase,
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json(req.toMap()),
    );
    final response = await NetworkService.shared
        .execute<GiveAchievementResponse>(
          request,
          GiveAchievementResponse.fromMap,
        );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return response;
  }

  @override
  Future<NetworkResponse<GetUserAchievements>?> myAchievements() async {
    final request = NetworkRequest(
      path: NetworkService.achievements,
      type: NetworkRequestType.GET,
    );
    final response = await NetworkService.shared.execute<GetUserAchievements>(
      request,
      GetUserAchievements.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return response;
  }

  @override
  Future<TakeCasesResponse?>? takeCase(TakeCaseRequest req) async {
    dynamic result;
    final request = NetworkRequest(
      path: NetworkService.takeCase,
      type: NetworkRequestType.POST,
      data: NetworkRequestBody.json(req.toMap()),
    );
    final response = await NetworkService.shared.execute<TakeCasesResponse>(
      request,
      TakeCasesResponse.fromMap,
    );
    response?.maybeWhen(
      ok: (data) {
        result = data;
        print('Hurry Success');
      },
      orElse: () {
        print('Error');
      },
    );

    return result;
  }
}
