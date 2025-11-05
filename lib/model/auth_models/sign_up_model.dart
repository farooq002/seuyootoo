// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  final String? message;
  final String? username;
  final String? email;
  SignUpModel({this.message, this.username, this.email});

  SignUpModel copyWith({String? message, String? username, String? email}) {
    return SignUpModel(
      message: message ?? this.message,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'username': username,
      'email': email,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      message: map['message'] != null ? map['message'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SignUpModel(message: $message, username: $username, email: $email)';

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.username == username &&
        other.email == email;
  }

  @override
  int get hashCode => message.hashCode ^ username.hashCode ^ email.hashCode;
}
