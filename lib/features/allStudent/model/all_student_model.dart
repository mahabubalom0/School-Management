import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_student_model.freezed.dart';
part 'all_student_model.g.dart';

@freezed
class AllStudentModel with _$AllStudentModel {
  const factory AllStudentModel({
    @JsonKey(name: 'student_id') String? studentId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'class') String? studentClass,
    @JsonKey(name: 'father_name') String? fatherName,
    @JsonKey(name: 'mother_name') String? motherName,
    @JsonKey(name: 'date_birth') String? dateBirth,
    @JsonKey(name: 'religion') String? religion,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'guardin_number') String? guardinNumber,
    @JsonKey(name: 'student_number') String? studentNumber,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'email') String? email,
  }) = _AllStudentModel;

  factory AllStudentModel.fromJson(Map<String, dynamic> json) =>
      _$AllStudentModelFromJson(json);
}
