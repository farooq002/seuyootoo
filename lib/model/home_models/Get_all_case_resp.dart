// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetAllCaseResp {
  final List<CasesModel>? cases;
  GetAllCaseResp({this.cases});

  GetAllCaseResp copyWith({List<CasesModel>? progress}) {
    return GetAllCaseResp(cases: progress ?? this.cases);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'cases': cases?.map((x) => x.toMap()).toList()};
  }

  factory GetAllCaseResp.fromMap(Map<String, dynamic> map) {
    return GetAllCaseResp(
      cases: map['cases'] != null
          ? List<CasesModel>.from(
              (map['cases'] as List).map<CasesModel?>(
                (x) => CasesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllCaseResp.fromJson(String source) =>
      GetAllCaseResp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetAllCaseResp(cases: $cases)';

  @override
  bool operator ==(covariant GetAllCaseResp other) {
    if (identical(this, other)) return true;

    return listEquals(other.cases, cases);
  }

  @override
  int get hashCode => cases.hashCode;
}

class CasesModel {
  final dynamic id;
  final String? title;
  final String? description;
  final dynamic difficulty;
  final dynamic levelRequired;
  final dynamic rewardTokens;
  final dynamic rewardExp;
  final String? createdAt;
  final dynamic questionsCount;
  CasesModel({
    this.id,
    this.title,
    this.description,
    this.difficulty,
    this.levelRequired,
    this.rewardTokens,
    this.rewardExp,
    this.createdAt,
    this.questionsCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'level_required': levelRequired,
      'reward_tokens': rewardTokens,
      'reward_exp': rewardExp,
      'created_at': createdAt,
      'questions_count': questionsCount,
    };
  }

  factory CasesModel.fromMap(Map<String, dynamic> map) {
    return CasesModel(
      id: map['id'] as dynamic,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      difficulty: map['difficulty'] as dynamic,
      levelRequired: map['level_required'] as dynamic,
      rewardTokens: map['reward_tokens'] as dynamic,
      rewardExp: map['reward_exp'] as dynamic,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      questionsCount: map['questions_count'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory CasesModel.fromJson(String source) =>
      CasesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CasesModel(id: $id, title: $title, description: $description, difficulty: $difficulty, level_required: $levelRequired, reward_tokens: $rewardTokens, reward_exp: $rewardExp, created_at: $createdAt, questions_count: $questionsCount)';
  }

  @override
  bool operator ==(covariant CasesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.difficulty == difficulty &&
        other.levelRequired == levelRequired &&
        other.rewardTokens == rewardTokens &&
        other.rewardExp == rewardExp &&
        other.createdAt == createdAt &&
        other.questionsCount == questionsCount;
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
        questionsCount.hashCode;
  }
}
