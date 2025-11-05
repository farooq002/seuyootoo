// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompleteCaseResponse {
  final String? message;
  CompleteCaseResponse({this.message});

  CompleteCaseResponse copyWith({String? message}) {
    return CompleteCaseResponse(message: message ?? this.message);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'message': message};
  }

  factory CompleteCaseResponse.fromMap(Map<String, dynamic> map) {
    return CompleteCaseResponse(
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompleteCaseResponse.fromJson(String source) =>
      CompleteCaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CompleteCaseResponse(message: $message)';

  @override
  bool operator ==(covariant CompleteCaseResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class CompletenessRequest {
  final int? caseId;
  CompletenessRequest({this.caseId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'case_id': caseId};
  }

  factory CompletenessRequest.fromMap(Map<String, dynamic> map) {
    return CompletenessRequest(
      caseId: map['case_id'] != null ? map['case_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompletenessRequest.fromJson(String source) =>
      CompletenessRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CompletenessRequest(case_id: $caseId)';

  @override
  bool operator ==(covariant CompletenessRequest other) {
    if (identical(this, other)) return true;

    return other.caseId == caseId;
  }

  @override
  int get hashCode => caseId.hashCode;
}
