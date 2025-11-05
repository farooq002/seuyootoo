// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProgressResponse {
  final List<Progress>? progress;
  ProgressResponse({this.progress});

  ProgressResponse copyWith({List<Progress>? progress}) {
    return ProgressResponse(progress: progress ?? this.progress);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'progress': progress?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProgressResponse.fromMap(Map<String, dynamic> map) {
    return ProgressResponse(
      progress: map['progress'] != null
          ? List<Progress>.from(
              (map['progress'] as List).map<Progress?>(
                (x) => Progress.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgressResponse.fromJson(String source) =>
      ProgressResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProgressResponse(progress: $progress)';

  @override
  bool operator ==(covariant ProgressResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.progress, progress);
  }

  @override
  int get hashCode => progress.hashCode;
}

class Progress {
  final String? mobileCaseTitle;
  final String? completed;
  final String? startedAt;
  final String? completedAt;
  Progress({
    this.mobileCaseTitle,
    this.completed,
    this.startedAt,
    this.completedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobile_case_title': mobileCaseTitle,
      'completed': completed,
      'started_at': startedAt,
      'completed_at': completedAt,
    };
  }

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      mobileCaseTitle: map['mobile_case_title'] != null
          ? map['mobile_case_title'] as String
          : null,
      completed: map['completed'] != null ? map['completed'] as String : null,
      startedAt: map['started_at'] != null ? map['started_at'] as String : null,
      completedAt: map['completed_at'] != null
          ? map['completed_at'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Progress.fromJson(String source) =>
      Progress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Progress(mobile_case_title: $mobileCaseTitle, completed: $completed, started_at: $startedAt, completed_at: $completedAt)';
  }

  @override
  bool operator ==(covariant Progress other) {
    if (identical(this, other)) return true;

    return other.mobileCaseTitle == mobileCaseTitle &&
        other.completed == completed &&
        other.startedAt == startedAt &&
        other.completedAt == completedAt;
  }

  @override
  int get hashCode {
    return mobileCaseTitle.hashCode ^
        completed.hashCode ^
        startedAt.hashCode ^
        completedAt.hashCode;
  }
}
