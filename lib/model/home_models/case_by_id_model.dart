// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CaseByIdResponse {
  final dynamic id;
  final String? title;
  final String? description;
  final dynamic difficulty;
  final dynamic levelRequired;
  final dynamic rewardTokens;
  final dynamic rewardExp;
  final String? createdAt;
  final List<Question>? questions;
  CaseByIdResponse({
    this.id,
    this.title,
    this.description,
    this.difficulty,
    this.levelRequired,
    this.rewardTokens,
    this.rewardExp,
    this.createdAt,
    this.questions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'levelRequired': levelRequired,
      'rewardTokens': rewardTokens,
      'rewardExp': rewardExp,
      'created_at': createdAt,
      'questions': questions?.map((x) => x.toMap()).toList(),
    };
  }

  factory CaseByIdResponse.fromMap(Map<String, dynamic> map) {
    print(map);
    return CaseByIdResponse(
      id: map['id'] as dynamic,
      title: map['title'] as String,
      description: map['description'] as String,
      difficulty: map['difficulty'] as dynamic,
      levelRequired: map['levelRequired'] as dynamic,
      rewardTokens: map['rewardTokens'] as dynamic,
      rewardExp: map['rewardExp'] as dynamic,
      createdAt: map['created_at'] as dynamic,
      questions: List<Question>.from(
        (map['questions'] as List).map<Question>(
          (x) => Question.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseByIdResponse.fromJson(String source) =>
      CaseByIdResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CaseByIdResponse(id: $id, title: $title, description: $description, difficulty: $difficulty, levelRequired: $levelRequired, rewardTokens: $rewardTokens, rewardExp: $rewardExp, createdAt: $createdAt, questions: $questions)';
  }

  @override
  bool operator ==(covariant CaseByIdResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.difficulty == difficulty &&
        other.levelRequired == levelRequired &&
        other.rewardTokens == rewardTokens &&
        other.rewardExp == rewardExp &&
        other.createdAt == createdAt &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        difficulty.hashCode ^
        levelRequired.hashCode ^
        rewardTokens.hashCode ^
        rewardExp.hashCode ^
        createdAt.hashCode ^
        questions.hashCode;
  }
}

class Question {
  final dynamic id;
  final String? questionText;
  final String? evidence;
  final dynamic order;
  final List<dynamic>? choices;
  final dynamic correctAnswerIndex;
  final dynamic timeLimitSeconds;
  Question({
    this.id,
    this.questionText,
    this.evidence,
    this.order,
    this.choices,
    this.correctAnswerIndex,
    this.timeLimitSeconds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question_text': questionText,
      'evidence': evidence,
      'order': order,
      'choices': choices,
      'correct_answer_index': correctAnswerIndex,
      'time_limit_seconds': timeLimitSeconds,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as dynamic,
      questionText: map['question_text'] as String,
      evidence: map['evidence'] as String,
      order: map['order'] as dynamic,
      choices: List<dynamic>.from((map['choices'] as List<dynamic>)),
      correctAnswerIndex: map['correct_answer_index'] as dynamic,
      timeLimitSeconds: map['time_limit_seconds'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Question(id: $id, questionText: $questionText, evidence: $evidence, order: $order, choices: $choices, correctAnswerIndex: $correctAnswerIndex, timeLimitSeconds: $timeLimitSeconds)';
  }

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.questionText == questionText &&
        other.evidence == evidence &&
        other.order == order &&
        listEquals(other.choices, choices) &&
        other.correctAnswerIndex == correctAnswerIndex &&
        other.timeLimitSeconds == timeLimitSeconds;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        questionText.hashCode ^
        evidence.hashCode ^
        order.hashCode ^
        choices.hashCode ^
        correctAnswerIndex.hashCode ^
        timeLimitSeconds.hashCode;
  }
}
