// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_mark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudentMarkModel _$StudentMarkModelFromJson(Map<String, dynamic> json) {
  return _StudentMarkModel.fromJson(json);
}

/// @nodoc
mixin _$StudentMarkModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get rollNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  String get className => throw _privateConstructorUsedError; // `class` is a reserved keyword in Dart
  String get section => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get exam => throw _privateConstructorUsedError;
  String get mark => throw _privateConstructorUsedError;

  /// Serializes this StudentMarkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentMarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentMarkModelCopyWith<StudentMarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentMarkModelCopyWith<$Res> {
  factory $StudentMarkModelCopyWith(
    StudentMarkModel value,
    $Res Function(StudentMarkModel) then,
  ) = _$StudentMarkModelCopyWithImpl<$Res, StudentMarkModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String rollNumber,
    @JsonKey(name: 'class') String className,
    String section,
    String subject,
    String exam,
    String mark,
  });
}

/// @nodoc
class _$StudentMarkModelCopyWithImpl<$Res, $Val extends StudentMarkModel>
    implements $StudentMarkModelCopyWith<$Res> {
  _$StudentMarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentMarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rollNumber = null,
    Object? className = null,
    Object? section = null,
    Object? subject = null,
    Object? exam = null,
    Object? mark = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            rollNumber: null == rollNumber
                ? _value.rollNumber
                : rollNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            className: null == className
                ? _value.className
                : className // ignore: cast_nullable_to_non_nullable
                      as String,
            section: null == section
                ? _value.section
                : section // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: null == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String,
            exam: null == exam
                ? _value.exam
                : exam // ignore: cast_nullable_to_non_nullable
                      as String,
            mark: null == mark
                ? _value.mark
                : mark // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudentMarkModelImplCopyWith<$Res>
    implements $StudentMarkModelCopyWith<$Res> {
  factory _$$StudentMarkModelImplCopyWith(
    _$StudentMarkModelImpl value,
    $Res Function(_$StudentMarkModelImpl) then,
  ) = __$$StudentMarkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String rollNumber,
    @JsonKey(name: 'class') String className,
    String section,
    String subject,
    String exam,
    String mark,
  });
}

/// @nodoc
class __$$StudentMarkModelImplCopyWithImpl<$Res>
    extends _$StudentMarkModelCopyWithImpl<$Res, _$StudentMarkModelImpl>
    implements _$$StudentMarkModelImplCopyWith<$Res> {
  __$$StudentMarkModelImplCopyWithImpl(
    _$StudentMarkModelImpl _value,
    $Res Function(_$StudentMarkModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudentMarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rollNumber = null,
    Object? className = null,
    Object? section = null,
    Object? subject = null,
    Object? exam = null,
    Object? mark = null,
  }) {
    return _then(
      _$StudentMarkModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        rollNumber: null == rollNumber
            ? _value.rollNumber
            : rollNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        className: null == className
            ? _value.className
            : className // ignore: cast_nullable_to_non_nullable
                  as String,
        section: null == section
            ? _value.section
            : section // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: null == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String,
        exam: null == exam
            ? _value.exam
            : exam // ignore: cast_nullable_to_non_nullable
                  as String,
        mark: null == mark
            ? _value.mark
            : mark // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentMarkModelImpl implements _StudentMarkModel {
  const _$StudentMarkModelImpl({
    required this.id,
    required this.name,
    required this.rollNumber,
    @JsonKey(name: 'class') required this.className,
    required this.section,
    required this.subject,
    required this.exam,
    required this.mark,
  });

  factory _$StudentMarkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentMarkModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String rollNumber;
  @override
  @JsonKey(name: 'class')
  final String className;
  // `class` is a reserved keyword in Dart
  @override
  final String section;
  @override
  final String subject;
  @override
  final String exam;
  @override
  final String mark;

  @override
  String toString() {
    return 'StudentMarkModel(id: $id, name: $name, roll: $rollNumber, class: $className, section: $section, subject: $subject, exam: $exam, mark: $mark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentMarkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rollNumber, rollNumber) ||
                other.rollNumber == rollNumber) &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.mark, mark) || other.mark == mark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    rollNumber,
    className,
    section,
    subject,
    exam,
    mark,
  );

  /// Create a copy of StudentMarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentMarkModelImplCopyWith<_$StudentMarkModelImpl> get copyWith =>
      __$$StudentMarkModelImplCopyWithImpl<_$StudentMarkModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentMarkModelImplToJson(this);
  }
}

abstract class _StudentMarkModel implements StudentMarkModel {
  const factory _StudentMarkModel({
    required final String id,
    required final String name,
    required final String rollNumber,
    @JsonKey(name: 'class') required final String className,
    required final String section,
    required final String subject,
    required final String exam,
    required final String mark,
  }) = _$StudentMarkModelImpl;

  factory _StudentMarkModel.fromJson(Map<String, dynamic> json) =
      _$StudentMarkModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get rollNumber;
  @override
  @JsonKey(name: 'class')
  String get className; // `class` is a reserved keyword in Dart
  @override
  String get section;
  @override
  String get subject;
  @override
  String get exam;
  @override
  String get mark;

  /// Create a copy of StudentMarkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentMarkModelImplCopyWith<_$StudentMarkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
