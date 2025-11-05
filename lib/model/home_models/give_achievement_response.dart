// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GiveAchievementResponse {
  final String? message;
  GiveAchievementResponse({this.message});

  GiveAchievementResponse copyWith({String? message}) {
    return GiveAchievementResponse(message: message ?? this.message);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'message': message};
  }

  factory GiveAchievementResponse.fromMap(Map<String, dynamic> map) {
    return GiveAchievementResponse(
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GiveAchievementResponse.fromJson(String source) =>
      GiveAchievementResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'GiveAchievementResponse(message: $message)';

  @override
  bool operator ==(covariant GiveAchievementResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class GiveAchievementRequest {
  final int? achievementId;
  GiveAchievementRequest({this.achievementId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'achievement_id': achievementId};
  }

  factory GiveAchievementRequest.fromMap(Map<String, dynamic> map) {
    return GiveAchievementRequest(
      achievementId: map['achievement_id'] != null
          ? map['achievement_id'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GiveAchievementRequest.fromJson(String source) =>
      GiveAchievementRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'GiveAchievementRequest(achievement_id: $achievementId)';

  @override
  bool operator ==(covariant GiveAchievementRequest other) {
    if (identical(this, other)) return true;

    return other.achievementId == achievementId;
  }

  @override
  int get hashCode => achievementId.hashCode;
}
