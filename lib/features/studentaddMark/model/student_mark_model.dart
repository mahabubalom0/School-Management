import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_mark_model.freezed.dart';
part 'student_mark_model.g.dart';

@freezed
class StudentMarkModel with _$StudentMarkModel {
  const factory StudentMarkModel({
    required String id,
    required String name,
    required String rollNumber,
    @JsonKey(name: 'class') required String className, // `class` is a reserved keyword in Dart
    required String section,
    required String subject,
    required String exam,
    required String mark, // Changed to final implicitly by Freezed
  }) = _StudentMarkModel;

  factory StudentMarkModel.fromJson(Map<String, dynamic> json) =>
      _$StudentMarkModelFromJson(json);
}
