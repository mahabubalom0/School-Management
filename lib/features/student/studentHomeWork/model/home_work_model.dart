import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_work_model.freezed.dart';
part 'home_work_model.g.dart';

@freezed
class HomeWorkModel with _$HomeWorkModel {
  factory HomeWorkModel({
    int? id,
    @JsonKey(name: 'class') String? className, // 'class' is a reserved keyword in Dart
    String? section,
    String? subject,
    @JsonKey(name: 'add_homework') String? addHomework,
    @JsonKey(name: 'created_at') DateTime? createAt,
    @JsonKey(name: 'date_line') DateTime? dateLine,
  }) = _HomeWorkModel;

  factory HomeWorkModel.fromJson(Map<String, dynamic> json) =>
      _$HomeWorkModelFromJson(json);
}
