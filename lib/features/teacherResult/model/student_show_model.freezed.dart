// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_show_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudentShowModel _$StudentShowModelFromJson(Map<String, dynamic> json) {
  return _StudentShowModel.fromJson(json);
}

/// @nodoc
mixin _$StudentShowModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  String? get className => throw _privateConstructorUsedError; // 'class' is a reserved keyword in Dart
  dynamic get roll => throw _privateConstructorUsedError;
  String? get section => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get exam => throw _privateConstructorUsedError;
  dynamic get mark => throw _privateConstructorUsedError;

  /// Serializes this StudentShowModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentShowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentShowModelCopyWith<StudentShowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentShowModelCopyWith<$Res> {
  factory $StudentShowModelCopyWith(
    StudentShowModel value,
    $Res Function(StudentShowModel) then,
  ) = _$StudentShowModelCopyWithImpl<$Res, StudentShowModel>;
  @useResult
  $Res call({
    int? id,
    String? name,
    @JsonKey(name: 'class') String? className,
    dynamic roll,
    String? section,
    String? subject,
    String? exam,
    dynamic mark,
  });
}

/// @nodoc
class _$StudentShowModelCopyWithImpl<$Res, $Val extends StudentShowModel>
    implements $StudentShowModelCopyWith<$Res> {
  _$StudentShowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentShowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? className = freezed,
    Object? roll = freezed,
    Object? section = freezed,
    Object? subject = freezed,
    Object? exam = freezed,
    Object? mark = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            className: freezed == className
                ? _value.className
                : className // ignore: cast_nullable_to_non_nullable
                      as String?,
            roll: freezed == roll
                ? _value.roll
                : roll // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            section: freezed == section
                ? _value.section
                : section // ignore: cast_nullable_to_non_nullable
                      as String?,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            exam: freezed == exam
                ? _value.exam
                : exam // ignore: cast_nullable_to_non_nullable
                      as String?,
            mark: freezed == mark
                ? _value.mark
                : mark // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudentShowModelImplCopyWith<$Res>
    implements $StudentShowModelCopyWith<$Res> {
  factory _$$StudentShowModelImplCopyWith(
    _$StudentShowModelImpl value,
    $Res Function(_$StudentShowModelImpl) then,
  ) = __$$StudentShowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    @JsonKey(name: 'class') String? className,
    dynamic roll,
    String? section,
    String? subject,
    String? exam,
    dynamic mark,
  });
}

/// @nodoc
class __$$StudentShowModelImplCopyWithImpl<$Res>
    extends _$StudentShowModelCopyWithImpl<$Res, _$StudentShowModelImpl>
    implements _$$StudentShowModelImplCopyWith<$Res> {
  __$$StudentShowModelImplCopyWithImpl(
    _$StudentShowModelImpl _value,
    $Res Function(_$StudentShowModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudentShowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? className = freezed,
    Object? roll = freezed,
    Object? section = freezed,
    Object? subject = freezed,
    Object? exam = freezed,
    Object? mark = freezed,
  }) {
    return _then(
      _$StudentShowModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        className: freezed == className
            ? _value.className
            : className // ignore: cast_nullable_to_non_nullable
                  as String?,
        roll: freezed == roll
            ? _value.roll
            : roll // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        section: freezed == section
            ? _value.section
            : section // ignore: cast_nullable_to_non_nullable
                  as String?,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        exam: freezed == exam
            ? _value.exam
            : exam // ignore: cast_nullable_to_non_nullable
                  as String?,
        mark: freezed == mark
            ? _value.mark
            : mark // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentShowModelImpl implements _StudentShowModel {
  const _$StudentShowModelImpl({
    this.id,
    this.name,
    @JsonKey(name: 'class') this.className,
    this.roll,
    this.section,
    this.subject,
    this.exam,
    this.mark,
  });

  factory _$StudentShowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentShowModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'class')
  final String? className;
  // 'class' is a reserved keyword in Dart
  @override
  final dynamic roll;
  @override
  final String? section;
  @override
  final String? subject;
  @override
  final String? exam;
  @override
  final dynamic mark;

  @override
  String toString() {
    return 'StudentShowModel(id: $id, name: $name, className: $className, roll: $roll, section: $section, subject: $subject, exam: $exam, mark: $mark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentShowModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.className, className) ||
                other.className == className) &&
            const DeepCollectionEquality().equals(other.roll, roll) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.exam, exam) || other.exam == exam) &&
            const DeepCollectionEquality().equals(other.mark, mark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    className,
    const DeepCollectionEquality().hash(roll),
    section,
    subject,
    exam,
    const DeepCollectionEquality().hash(mark),
  );

  /// Create a copy of StudentShowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentShowModelImplCopyWith<_$StudentShowModelImpl> get copyWith =>
      __$$StudentShowModelImplCopyWithImpl<_$StudentShowModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentShowModelImplToJson(this);
  }
}

abstract class _StudentShowModel implements StudentShowModel {
  const factory _StudentShowModel({
    final int? id,
    final String? name,
    @JsonKey(name: 'class') final String? className,
    final dynamic roll,
    final String? section,
    final String? subject,
    final String? exam,
    final dynamic mark,
  }) = _$StudentShowModelImpl;

  factory _StudentShowModel.fromJson(Map<String, dynamic> json) =
      _$StudentShowModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'class')
  String? get className; // 'class' is a reserved keyword in Dart
  @override
  dynamic get roll;
  @override
  String? get section;
  @override
  String? get subject;
  @override
  String? get exam;
  @override
  dynamic get mark;

  /// Create a copy of StudentShowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentShowModelImplCopyWith<_$StudentShowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
