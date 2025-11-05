// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class LoginRequest {
  final String? email;
  final String? password;
  LoginRequest({this.email, this.password});

  LoginRequest copyWith({String? email, String? password}) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'password': password};
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) =>
      LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequest(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class LoginResponse {
  final String? token;
  final UserData? profile;
  LoginResponse({this.token, this.profile});

  LoginResponse copyWith({String? token, UserData? profile}) {
    return LoginResponse(
      token: token ?? this.token,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'profile': profile?.toMap()};
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] != null ? map['token'] as String : null,
      profile: map['profile'] != null
          ? UserData.fromMap(map['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(token: $token, profile: $profile)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.token == token && other.profile == profile;
  }

  @override
  int get hashCode => token.hashCode ^ profile.hashCode;
}

class UserData {
  final String? email;
  final String? username;
  final dynamic level;
  final dynamic exp;
  final String? rank;
  final dynamic tokens;
  final dynamic streak;
  final dynamic cases_completed;
  UserData({
    this.email,
    this.username,
    this.level,
    this.exp,
    this.rank,
    this.tokens,
    this.streak,
    this.cases_completed,
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
      'cases_completed': cases_completed,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      level: map['level'] as dynamic,
      exp: map['exp'] as dynamic,
      rank: map['rank'] != null ? map['rank'] as String : null,
      tokens: map['tokens'] as dynamic,
      streak: map['streak'] as dynamic,
      cases_completed: map['cases_completed'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(email: $email, username: $username, level: $level, exp: $exp, rank: $rank, tokens: $tokens, streak: $streak, cases_completed: $cases_completed)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.level == level &&
        other.exp == exp &&
        other.rank == rank &&
        other.tokens == tokens &&
        other.streak == streak &&
        other.cases_completed == cases_completed;
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
        cases_completed.hashCode;
  }
}
