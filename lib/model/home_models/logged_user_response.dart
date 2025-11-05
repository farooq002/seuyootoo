// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoggedUserCasesResponses {
  final List<MainUserCases>? progress;
  LoggedUserCasesResponses({this.progress});

  LoggedUserCasesResponses copyWith({List<MainUserCases>? progress}) {
    return LoggedUserCasesResponses(progress: progress ?? this.progress);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress?.map((x) => x.toMap()).toList(),
    };
  }

  factory LoggedUserCasesResponses.fromMap(Map<String, dynamic> map) {
    return LoggedUserCasesResponses(
      progress: map['progress'] != null
          ? List<MainUserCases>.from(
              (map['progress'] as List).map<MainUserCases?>(
                (x) => MainUserCases.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserCasesResponses.fromJson(String source) =>
      LoggedUserCasesResponses.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'LoggedUserCasesResponses(progress: $progress)';

  @override
  bool operator ==(covariant LoggedUserCasesResponses other) {
    if (identical(this, other)) return true;

    return listEquals(other.progress, progress);
  }

  @override
  int get hashCode => progress.hashCode;
}

class MainUserCases {
  final dynamic id;
  final String? title;
  final String? description;
  final dynamic difficulty;
  final dynamic levelRequired;
  final dynamic rewardTokens;
  final dynamic rewardExp;
  final String? createdAt;
  final dynamic questionsCount;
  final bool? completed;
  final String? completedAt;
  MainUserCases({
    this.id,
    this.title,
    this.description,
    this.difficulty,
    this.levelRequired,
    this.rewardTokens,
    this.rewardExp,
    this.createdAt,
    this.questionsCount,
    this.completed,
    this.completedAt,
  });

  MainUserCases copyWith({
    dynamic id,
    String? title,
    String? description,
    dynamic difficulty,
    dynamic levelRequired,
    dynamic rewardTokens,
    dynamic rewardExp,
    String? createdAt,
    dynamic questionsCount,
    bool? completed,
    String? completedAt,
  }) {
    return MainUserCases(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      levelRequired: levelRequired ?? this.levelRequired,
      rewardTokens: rewardTokens ?? this.rewardTokens,
      rewardExp: rewardExp ?? this.rewardExp,
      createdAt: createdAt ?? this.createdAt,
      questionsCount: questionsCount ?? this.questionsCount,
      completed: completed ?? this.completed,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'levelRequired': levelRequired,
      'rewardTokens': rewardTokens,
      'rewardExp': rewardExp,
      'createdAt': createdAt,
      'questionsCount': questionsCount,
      'completed': completed,
      'completedAt': completedAt,
    };
  }

  factory MainUserCases.fromMap(Map<String, dynamic> map) {
    return MainUserCases(
      id: map['id'] != null ? map['id'] as dynamic : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      difficulty: map['difficulty'] != null
          ? map['difficulty'] as dynamic
          : null,
      levelRequired: map['levelRequired'] != null
          ? map['levelRequired'] as dynamic
          : null,
      rewardTokens: map['rewardTokens'] != null
          ? map['rewardTokens'] as dynamic
          : null,
      rewardExp: map['rewardExp'] != null ? map['rewardExp'] as dynamic : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      questionsCount: map['questionsCount'] != null
          ? map['questionsCount'] as dynamic
          : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
      completedAt: map['completedAt'] != null
          ? map['completedAt'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainUserCases.fromJson(String source) =>
      MainUserCases.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainUserCases(id: $id, title: $title, description: $description, difficulty: $difficulty, levelRequired: $levelRequired, rewardTokens: $rewardTokens, rewardExp: $rewardExp, createdAt: $createdAt, questionsCount: $questionsCount, completed: $completed, completedAt: $completedAt)';
  }

  @override
  bool operator ==(covariant MainUserCases other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.difficulty == difficulty &&
        other.levelRequired == levelRequired &&
        other.rewardTokens == rewardTokens &&
        other.rewardExp == rewardExp &&
        other.createdAt == createdAt &&
        other.questionsCount == questionsCount &&
        other.completed == completed &&
        other.completedAt == completedAt;
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
        questionsCount.hashCode ^
        completed.hashCode ^
        completedAt.hashCode;
  }
}
