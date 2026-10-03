import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_show_model.freezed.dart';
part 'student_show_model.g.dart';

@freezed
class StudentShowModel with _$StudentShowModel {
  const factory StudentShowModel({
    int? id,
    String? name,
    @JsonKey(name: 'class')
    String? className, // 'class' is a reserved keyword in Dart
    String? roll,
    String? section,
    String? subject,
    String? exam,
    String? mark,
  }) = _StudentShowModel;

  factory StudentShowModel.fromJson(Map<String, dynamic> json) =>
      _$StudentShowModelFromJson(json);
}
