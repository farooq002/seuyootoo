import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souyoutoo/model/home_models/Get_all_case_resp.dart';
import 'package:souyoutoo/model/home_models/case_by_id_model.dart';
import 'package:souyoutoo/model/home_models/complete_case_response.dart';
import 'package:souyoutoo/model/home_models/take_cases_response.dart';
import 'package:souyoutoo/repo/trail_repo/trail_repo.dart';
import 'package:souyoutoo/repo/trail_repo/trail_repo_impl.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/src/base/base_view_controller.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class TrailController extends BaseViewController {
  final TrailRepo trailRepo = TrailRepoImp();

  final caseData = GetAllCaseResp().obs;
  final caseDetail = CaseByIdResponse().obs;
  final caseCompleteRes = CompleteCaseResponse().obs;
  final takeCaseResponse = TakeCasesResponse().obs;
  final currentQuestIndex = 0.obs;
  final currentTime = 0.obs;
  Timer? timer;

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
      currentQuestIndex.value = 0;
      caseDetail.value = response;
      for (var question in caseDetail.value.questions ?? []) {
        question.type.value = QuestionType.notdefined;
      }
      updateTimerForCurrentQuestion();
      Get.toNamed(questionRoute, arguments: {'caseId': caseId});
    }
  }

  takeCase(caseId) async {
    startLoading();
    final response = await trailRepo.takeCase(caseId);
    stopLoading();
    if (response != null) {
      currentQuestIndex.value = 0;
      takeCaseResponse.value = response;
      return true;
    }
    return false;
  }

  completeCase(caseId) async {
    startLoading();
    var req = CompletenessRequest(caseId: caseId);
    final response = await trailRepo.completeCase(req);
    stopLoading();
    if (response != null) {
      caseCompleteRes.value = response;
      Get.offAndToNamed(verdictRoute);
    }
  }

  Color optionColor(int questionIndex, int optionIndex) {
    final question = caseDetail.value.questions?[questionIndex];
    if (question == null) return Colors.grey;
    if (question.type.value == QuestionType.notdefined) {
      return appPurple;
    }
    if (optionIndex == question.correctAnswerIndex) {
      return Colors.green;
    }
    if (question.type.value == QuestionType.wrong &&
        optionIndex != question.correctAnswerIndex) {
      return Colors.red;
    }
    return appPurple;
  }

  goToNextQuest(selectedIndex) {
    if (caseDetail
            .value
            .questions?[currentQuestIndex.value]
            .correctAnswerIndex ==
        selectedIndex) {
      caseDetail.value.questions?[currentQuestIndex.value].type.value =
          QuestionType.correct;
    } else {
      caseDetail.value.questions?[currentQuestIndex.value].type.value =
          QuestionType.wrong;
    }

    Future.delayed(Durations.medium2 + Durations.long2, () async {
      if ((caseDetail.value.questions?.length ?? 0) - 1 >
          currentQuestIndex.value) {
        currentQuestIndex.value += 1;
        updateTimerForCurrentQuestion();
      } else {
        await completeCase(caseDetail.value.id);
      }
    });
  }

  String formatTime(int totalSeconds) {
    if (totalSeconds <= 0) return '0:00';
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void updateTimerForCurrentQuestion() {
    final question = caseDetail.value.questions?[currentQuestIndex.value];
    if (question != null) {
      currentTime.value = question.timeLimitSeconds ?? 0;
      startTimer();
    }
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTime.value > 0) {
        currentTime.value--;
      } else {
        timer.cancel();
        goToNextQuest(-1);
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
