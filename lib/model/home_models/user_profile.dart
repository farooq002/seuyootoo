// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserProfile {
  final String? email;
  final String? username;
  final dynamic level;
  final dynamic exp;
  final String? rank;
  final dynamic tokens;
  final dynamic streak;
  final dynamic current_cases_goal;
  UserProfile({
    this.email,
    this.username,
    required this.level,
    required this.exp,
    this.rank,
    required this.tokens,
    required this.streak,
    required this.current_cases_goal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'level': level,
      'exp': exp,
      'rank': rank,
      'tokens': tokens,
      'streak': streak,
      'current_cases_goal': current_cases_goal,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      level: map['level'] as dynamic,
      exp: map['exp'] as dynamic,
      rank: map['rank'] != null ? map['rank'] as String : null,
      tokens: map['tokens'] as dynamic,
      streak: map['streak'] as dynamic,
      current_cases_goal: map['current_cases_goal'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfile(email: $email, username: $username, level: $level, exp: $exp, rank: $rank, tokens: $tokens, streak: $streak, current_cases_goal: $current_cases_goal)';
  }

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.level == level &&
        other.exp == exp &&
        other.rank == rank &&
        other.tokens == tokens &&
        other.streak == streak &&
        other.current_cases_goal == current_cases_goal;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        username.hashCode ^
        level.hashCode ^
        exp.hashCode ^
        rank.hashCode ^
        tokens.hashCode ^
        streak.hashCode ^
        current_cases_goal.hashCode;
  }
}
