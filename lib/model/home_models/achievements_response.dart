// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AchievementsResponse {
  final List<Achievements>? achievement;
  AchievementsResponse({this.achievement});

  AchievementsResponse copyWith({List<Achievements>? achievement}) {
    return AchievementsResponse(achievement: achievement ?? this.achievement);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'achievement': achievement?.map((x) => x.toMap()).toList(),
    };
  }

  factory AchievementsResponse.fromMap(Map<String, dynamic> map) {
    return AchievementsResponse(
      achievement: map['achievement'] != null
          ? List<Achievements>.from(
              (map['achievement'] as List).map<Achievements?>(
                (x) => Achievements.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AchievementsResponse.fromJson(String source) =>
      AchievementsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AchievementsResponse(achievement: $achievement)';

  @override
  bool operator ==(covariant AchievementsResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.achievement, achievement);
  }

  @override
  int get hashCode => achievement.hashCode;
}

class Achievements {
  final String? name;
  final String? description;
  final String? icon;
  Achievements({this.name, this.description, this.icon});

  Achievements copyWith({String? name, String? description, String? icon}) {
    return Achievements(
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'icon': icon,
    };
  }

  factory Achievements.fromMap(Map<String, dynamic> map) {
    return Achievements(
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievements.fromJson(String source) =>
      Achievements.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Achievements(name: $name, description: $description, icon: $icon)';

  @override
  bool operator ==(covariant Achievements other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ icon.hashCode;
}
