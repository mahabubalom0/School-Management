// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllStudentModelImpl _$$AllStudentModelImplFromJson(
  Map<String, dynamic> json,
) => _$AllStudentModelImpl(
  studentId: json['student_id'] as String?,
  name: json['name'] as String?,
  gender: json['gender'] as String?,
  studentClass: json['class'] as String?,
  fatherName: json['father_name'] as String?,
  motherName: json['mother_name'] as String?,
  dateBirth: json['date_birth'] as String?,
  religion: json['religion'] as String?,
  bloodGroup: json['blood_group'] as String?,
  guardinNumber: json['guardin_number'] as String?,
  studentNumber: json['student_number'] as String?,
  address: json['address'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$$AllStudentModelImplToJson(
  _$AllStudentModelImpl instance,
) => <String, dynamic>{
  'student_id': instance.studentId,
  'name': instance.name,
  'gender': instance.gender,
  'class': instance.studentClass,
  'father_name': instance.fatherName,
  'mother_name': instance.motherName,
  'date_birth': instance.dateBirth,
  'religion': instance.religion,
  'blood_group': instance.bloodGroup,
  'guardin_number': instance.guardinNumber,
  'student_number': instance.studentNumber,
  'address': instance.address,
  'email': instance.email,
};
