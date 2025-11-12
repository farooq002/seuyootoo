// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AchievementsResponse {
  final List<Achievements>? achievements;
  AchievementsResponse({this.achievements});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'achievements': achievements?.map((x) => x.toMap()).toList(),
    };
  }

  factory AchievementsResponse.fromMap(Map<String, dynamic> map) {
    return AchievementsResponse(
      achievements: map['achievements'] != null
          ? List<Achievements>.from(
              (map['achievements'] as List).map<Achievements?>(
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
  String toString() => 'AchievementsResponse(achievement: $achievements)';

  @override
  bool operator ==(covariant AchievementsResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.achievements, achievements);
  }

  @override
  int get hashCode => achievements.hashCode;
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
