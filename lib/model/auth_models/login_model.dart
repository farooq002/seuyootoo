// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class LoginRequest {
  final String? email;
  final String? password;
  LoginRequest({
    this.email,
    this.password,
  });


  

  LoginRequest copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) => LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequest(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}


class LoginResponse {
  final String? token;
  LoginResponse({this.token});

  LoginResponse copyWith({String? token}) {
    return LoginResponse(token: token ?? this.token);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token};
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(token: $token)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
