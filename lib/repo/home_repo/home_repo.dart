import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/achievements_response.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/get_user_achievements.dart';
import 'package:souyoutoo/model/home_models/give_achievement_response.dart';
import 'package:souyoutoo/model/home_models/logged_user_response.dart';
import 'package:souyoutoo/model/home_models/progress_model.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/model/home_models/user_profile.dart';
import 'package:souyoutoo/remote/network_response.dart';

abstract base class HomeRepo {
  Future<GetProfileResponse?>? getProfile();
  Future<NetworkResponse<ProgressResponse>?> getProgress();
  Future<GetAllCaseResp>? getCases();
  Future<NetworkResponse<CaseByIdResponse>?> getCaseByID();
  Future<NetworkResponse<LoggedUserCasesResponses>?> getMyCases();
  Future<TakeCasesResponse?>? takeCase(TakeCaseRequest req);
  Future<AchievementsResponse?> achievements();
  Future<NetworkResponse<GiveAchievementResponse>?> giveAchievement(
    GiveAchievementRequest req,
  );
  Future<NetworkResponse<GetUserAchievements>?> myAchievements();
}
