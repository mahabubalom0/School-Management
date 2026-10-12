// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_work_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeWorkModelImpl _$$HomeWorkModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeWorkModelImpl(
      id: (json['id'] as num?)?.toInt(),
      className: json['class'] as String?,
      section: json['section'] as String?,
      subject: json['subject'] as String?,
      addHomework: json['addHomework'] as String?,
      createAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      dateLine: json['date_line'] == null
          ? null
          : DateTime.parse(json['date_line'] as String),
    );

Map<String, dynamic> _$$HomeWorkModelImplToJson(_$HomeWorkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'class': instance.className,
      'section': instance.section,
      'subject': instance.subject,
      'addHomework': instance.addHomework,
      'created_at': instance.createAt?.toIso8601String(),
      'date_line': instance.dateLine?.toIso8601String(),
    };
