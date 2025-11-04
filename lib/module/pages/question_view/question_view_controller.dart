import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:souyoutoo/routes/routes_name.dart';
import 'package:souyoutoo/utils/colors_name.dart';

class QuestionViewController extends GetxController {
  final currentQuestionIndex = 0.obs;
  final RxList<Color> progressColors = List.generate(
    5,
    (_) => Colors.white,
  ).obs;
  final RxList<Color> optionColors = <Color>[].obs;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      question:
          "According to the Fair Labor Standards Act(FLSA), which of the following best describes when overtime pay is required for non-exempt employees?",
      options: [
        "Only when working more than 8 hours in a single day",
        "When working more than 40 hours in a workweek",
        "Only during weekends and holidays",
        "When specifically requested by the employee",
      ],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: "Which language does Flutter use?",
      options: ["Java", "Swift", "Dart", "Kotlin"],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: "Who developed Flutter?",
      options: ["Apple", "Microsoft", "Google", "Amazon"],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: "Which widget is used for layouts in Flutter?",
      options: ["Container", "Row", "Column", "All of the above"],
      correctIndex: 3,
    ),
    QuizQuestion(
      question: "What is GetX used for?",
      options: [
        "State management",
        "Navigation",
        "Dependency injection",
        "All of the above",
      ],
      correctIndex: 3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    initOptionColors();
  }

  void initOptionColors() {
    final question = questions[currentQuestionIndex.value];
    optionColors.value = List.generate(
      question.options.length,
      (_) => appWhite,
    );
  }

  void selectAnswer(int index) async {
    final question = questions[currentQuestionIndex.value];
    final correctIndex = question.correctIndex;

    // Step 1: Highlight selected in grey
    optionColors[index] = appGray;
    optionColors.refresh();

    await Future.delayed(const Duration(milliseconds: 400));

    // Step 2: Show green/red result
    if (index == correctIndex) {
      optionColors[index] = appGreen;
      progressColors[currentQuestionIndex.value] = appGreen;
    } else {
      optionColors[index] = appRed;
      progressColors[currentQuestionIndex.value] = appRed;
      optionColors[correctIndex] = appGreen;
    }
    optionColors.refresh();

    await Future.delayed(const Duration(milliseconds: 800));
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      initOptionColors();
    } else {
      Get.offAndToNamed(verdictRoute);
    }
  }

  Color getProgressColor(int index) {
    if (index == currentQuestionIndex.value) {
      return appBlue;
    }
    return progressColors[index];
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}
