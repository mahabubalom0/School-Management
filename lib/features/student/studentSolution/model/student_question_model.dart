import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_question_model.freezed.dart';
part 'student_question_model.g.dart';

bool _boolFromJson(dynamic value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true';
  }
  return false;
}

@freezed
class StudentQuestionModel with _$StudentQuestionModel {
  const factory StudentQuestionModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'question_ans') String? questionAns,
    @JsonKey(name: 'ans_replly', fromJson: _boolFromJson) @Default(false) bool ansReplly,
  }) = _StudentQuestionModel;

  factory StudentQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$StudentQuestionModelFromJson(json);
}
