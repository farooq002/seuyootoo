// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:souyoutoo/model/auth_models/login_model.dart';

class SignUpResponse {
  final String? message;
  final String? token;
  final UserData? profile;
  SignUpResponse({this.message, this.token, this.profile});

  SignUpResponse copyWith({String? message, String? token, UserData? profile}) {
    return SignUpResponse(
      message: message ?? this.message,
      token: token ?? this.token,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'token': token,
      'profile': profile?.toMap(),
    };
  }

  factory SignUpResponse.fromMap(Map<String, dynamic> map) {
    return SignUpResponse(
      message: map['message'] != null ? map['message'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      profile: map['profile'] != null
          ? UserData.fromMap(map['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpResponse.fromJson(String source) =>
      SignUpResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignUpModel(message: $message, token: $token, profile: $profile)';

  @override
  bool operator ==(covariant SignUpResponse other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.token == token &&
        other.profile == profile;
  }

  @override
  int get hashCode => message.hashCode ^ token.hashCode ^ profile.hashCode;
}

class SignUpRequest {
  final String? email;
  final String? password;
  final String? passwordConfirm;
  final String? username;
  SignUpRequest({
    this.email,
    this.password,
    this.passwordConfirm,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'password_confirm': passwordConfirm,
      'username': username,
    };
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      passwordConfirm: map['password_confirm'] != null
          ? map['password_confirm'] as String
          : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpRequest(email: $email, password: $password, password_confirm: $passwordConfirm, username: $username)';
  }

  @override
  bool operator ==(covariant SignUpRequest other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.passwordConfirm == passwordConfirm &&
        other.username == username;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        passwordConfirm.hashCode ^
        username.hashCode;
  }
}
