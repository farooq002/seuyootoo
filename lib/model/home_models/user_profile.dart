// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetProfileResponse {
  final String? userEmail;
  final String? profileImage;
  final String? platform;
  final dynamic tokens;
  final dynamic level;
  final dynamic exp;
  final dynamic expToNextLevel;
  final String? rank;
  final dynamic streak;
  final dynamic currentCasesGoal;
  final dynamic completedCases;
  final Status? lexStatus;
  GetProfileResponse({
    this.userEmail,
    this.profileImage,
    this.platform,
    this.tokens,
    this.level,
    this.exp,
    this.expToNextLevel,
    this.rank,
    this.streak,
    this.currentCasesGoal,
    this.completedCases,
    this.lexStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userEmail': userEmail,
      'profileImage': profileImage,
      'platform': platform,
      'tokens': tokens,
      'level': level,
      'exp': exp,
      'expToNextLevel': expToNextLevel,
      'rank': rank,
      'streak': streak,
      'currentCasesGoal': currentCasesGoal,
      'completedCases': completedCases,
      'lex_status': lexStatus?.toMap(),
    };
  }

  factory GetProfileResponse.fromMap(Map<String, dynamic> map) {
    return GetProfileResponse(
      userEmail: map['user_email'] != null ? map['user_email'] as String : null,
      profileImage: map['profile_image'] != null
          ? map['profile_image'] as String
          : null,
      platform: map['platform'] != null ? map['platform'] as String : null,
      tokens: map['tokens'] as dynamic,
      level: map['level'] as dynamic,
      exp: map['exp'] as dynamic,
      expToNextLevel: map['exp_to_next_level'] as dynamic,
      rank: map['rank'] != null ? map['rank'] as String : null,
      streak: map['streak'] as dynamic,
      currentCasesGoal: map['current_cases_goal'] as dynamic,
      completedCases: map['completed_cases'] as dynamic,
      lexStatus: map['lex_status'] != null
          ? Status.fromMap(map['lex_status'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetProfileResponse.fromJson(String source) =>
      GetProfileResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetProfileResponse(userEmail: $userEmail, profileImage: $profileImage, platform: $platform, tokens: $tokens, level: $level, exp: $exp, expToNextLevel: $expToNextLevel, rank: $rank, streak: $streak, currentCasesGoal: $currentCasesGoal, completedCases: $completedCases, lex_status: $lexStatus)';
  }

  @override
  bool operator ==(covariant GetProfileResponse other) {
    if (identical(this, other)) return true;

    return other.userEmail == userEmail &&
        other.profileImage == profileImage &&
        other.platform == platform &&
        other.tokens == tokens &&
        other.level == level &&
        other.exp == exp &&
        other.expToNextLevel == expToNextLevel &&
        other.rank == rank &&
        other.streak == streak &&
        other.currentCasesGoal == currentCasesGoal &&
        other.completedCases == completedCases &&
        other.lexStatus == lexStatus;
  }

  @override
  int get hashCode {
    return userEmail.hashCode ^
        profileImage.hashCode ^
        platform.hashCode ^
        tokens.hashCode ^
        level.hashCode ^
        exp.hashCode ^
        expToNextLevel.hashCode ^
        rank.hashCode ^
        streak.hashCode ^
        currentCasesGoal.hashCode ^
        completedCases.hashCode ^
        lexStatus.hashCode;
  }
}

class Status {
  final String? status;
  Status({this.status});

  Status copyWith({String? status}) {
    return Status(status: status ?? this.status);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'status': status};
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) =>
      Status.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Status(status: $status)';

  @override
  bool operator ==(covariant Status other) {
    if (identical(this, other)) return true;

    return other.status == status;
  }

  @override
  int get hashCode => status.hashCode;
}
