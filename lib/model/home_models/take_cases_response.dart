// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TakeCasesResponse {
  final String? message;
  final CaseData? caseData;
  final bool? completed;
  TakeCasesResponse({this.message, this.caseData, this.completed});

  TakeCasesResponse copyWith({
    String? message,
    CaseData? caseData,
    bool? completed,
  }) {
    return TakeCasesResponse(
      message: message ?? this.message,
      caseData: caseData ?? this.caseData,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'caseData': caseData?.toMap(),
      'completed': completed,
    };
  }

  factory TakeCasesResponse.fromMap(Map<String, dynamic> map) {
    return TakeCasesResponse(
      message: map['message'] != null ? map['message'] as String : null,
      caseData: map['caseData'] != null
          ? CaseData.fromMap(map['caseData'] as Map<String, dynamic>)
          : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TakeCasesResponse.fromJson(String source) =>
      TakeCasesResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TakeCasesResponse(message: $message, caseData: $caseData, completed: $completed)';

  @override
  bool operator ==(covariant TakeCasesResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.caseData == caseData &&
        other.completed == completed;
  }

  @override
  int get hashCode => message.hashCode ^ caseData.hashCode ^ completed.hashCode;
}

class CaseData {
  final int? id;
  final String? title;
  final String? description;
  final int? difficulty;
  final int? levelRequired;
  final int? rewardTokens;
  final int? rewardExp;
  final String? createdAt;
  final int? questionsCount;
  CaseData({
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

  CaseData copyWith({
    int? id,
    String? title,
    String? description,
    int? difficulty,
    int? levelRequired,
    int? rewardTokens,
    int? rewardExp,
    String? createdAt,
    int? questionsCount,
  }) {
    return CaseData(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      levelRequired: levelRequired ?? this.levelRequired,
      rewardTokens: rewardTokens ?? this.rewardTokens,
      rewardExp: rewardExp ?? this.rewardExp,
      createdAt: createdAt ?? this.createdAt,
      questionsCount: questionsCount ?? this.questionsCount,
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
    };
  }

  factory CaseData.fromMap(Map<String, dynamic> map) {
    return CaseData(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      difficulty: map['difficulty'] != null ? map['difficulty'] as int : null,
      levelRequired: map['levelRequired'] != null
          ? map['levelRequired'] as int
          : null,
      rewardTokens: map['rewardTokens'] != null
          ? map['rewardTokens'] as int
          : null,
      rewardExp: map['rewardExp'] != null ? map['rewardExp'] as int : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      questionsCount: map['questionsCount'] != null
          ? map['questionsCount'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseData.fromJson(String source) =>
      CaseData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CaseData(id: $id, title: $title, description: $description, difficulty: $difficulty, levelRequired: $levelRequired, rewardTokens: $rewardTokens, rewardExp: $rewardExp, createdAt: $createdAt, questionsCount: $questionsCount)';
  }

  @override
  bool operator ==(covariant CaseData other) {
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

class TakeCaseRequest {
  final int? caseId;
  TakeCaseRequest({this.caseId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'case_id': caseId};
  }

  factory TakeCaseRequest.fromMap(Map<String, dynamic> map) {
    return TakeCaseRequest(
      caseId: map['case_id'] != null ? map['case_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TakeCaseRequest.fromJson(String source) =>
      TakeCaseRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TakeCaseRequest(case_id: $caseId)';

  @override
  bool operator ==(covariant TakeCaseRequest other) {
    if (identical(this, other)) return true;

    return other.caseId == caseId;
  }

  @override
  int get hashCode => caseId.hashCode;
}
