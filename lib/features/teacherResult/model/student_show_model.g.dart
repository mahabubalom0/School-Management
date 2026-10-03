// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentShowModelImpl _$$StudentShowModelImplFromJson(
  Map<String, dynamic> json,
) => _$StudentShowModelImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  className: json['class'] as String?,
  roll: json['roll'] as String?,
  section: json['section'] as String?,
  subject: json['subject'] as String?,
  exam: json['exam'] as String?,
  mark: json['mark'] as String?,
);

Map<String, dynamic> _$$StudentShowModelImplToJson(
  _$StudentShowModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'class': instance.className,
  'roll': instance.roll,
  'section': instance.section,
  'subject': instance.subject,
  'exam': instance.exam,
  'mark': instance.mark,
};
