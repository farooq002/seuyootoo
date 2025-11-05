// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetUserAchievements {
  final List<Achievement>? achievements;
  GetUserAchievements({this.achievements});

  GetUserAchievements copyWith({List<Achievement>? achievements}) {
    return GetUserAchievements(achievements: achievements ?? this.achievements);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'achievements': achievements?.map((x) => x.toMap()).toList(),
    };
  }

  factory GetUserAchievements.fromMap(Map<String, dynamic> map) {
    return GetUserAchievements(
      achievements: map['achievements'] != null
          ? List<Achievement>.from(
              (map['achievements'] as List).map<Achievement?>(
                (x) => Achievement.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUserAchievements.fromJson(String source) =>
      GetUserAchievements.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetUserAchievements(achievements: $achievements)';

  @override
  bool operator ==(covariant GetUserAchievements other) {
    if (identical(this, other)) return true;

    return listEquals(other.achievements, achievements);
  }

  @override
  int get hashCode => achievements.hashCode;
}

class Achievement {
  final int? id;
  final String? name;
  final String? description;
  final String? icon;
  Achievement({this.id, this.name, this.description, this.icon});

  Achievement copyWith({
    int? id,
    String? name,
    String? description,
    String? icon,
  }) {
    return Achievement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Achievement.fromJson(String source) =>
      Achievement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Achievement(id: $id, name: $name, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant Achievement other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
