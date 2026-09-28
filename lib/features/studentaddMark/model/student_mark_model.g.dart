// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentMarkModelImpl _$$StudentMarkModelImplFromJson(
  Map<String, dynamic> json,
) => _$StudentMarkModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  rollNumber: json['roll'] as String,
  className: json['class'] as String,
  section: json['section'] as String,
  subject: json['subject'] as String,
  exam: json['exam'] as String,
  mark: json['mark'] as String,
);

Map<String, dynamic> _$$StudentMarkModelImplToJson(
  _$StudentMarkModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'roll': instance.rollNumber,
  'class': instance.className,
  'section': instance.section,
  'subject': instance.subject,
  'exam': instance.exam,
  'mark': instance.mark,
};
