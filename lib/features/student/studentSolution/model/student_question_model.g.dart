// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentQuestionModelImpl _$$StudentQuestionModelImplFromJson(
  Map<String, dynamic> json,
) => _$StudentQuestionModelImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  question: json['question'] as String,
  questionAns: json['question_ans'] as String?,
  ansReplly: json['ans_replly'] == null
      ? false
      : _boolFromJson(json['ans_replly']),
);

Map<String, dynamic> _$$StudentQuestionModelImplToJson(
  _$StudentQuestionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'question': instance.question,
  'question_ans': instance.questionAns,
  'ans_replly': instance.ansReplly,
};
