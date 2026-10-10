// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_work_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeWorkModel _$HomeWorkModelFromJson(Map<String, dynamic> json) {
  return _HomeWorkModel.fromJson(json);
}

/// @nodoc
mixin _$HomeWorkModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'class')
  String? get className => throw _privateConstructorUsedError; // 'class' is a reserved keyword in Dart
  String? get section => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'add_homework')
  String? get addHomework => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_line')
  DateTime? get dateLine => throw _privateConstructorUsedError;

  /// Serializes this HomeWorkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeWorkModelCopyWith<HomeWorkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeWorkModelCopyWith<$Res> {
  factory $HomeWorkModelCopyWith(
    HomeWorkModel value,
    $Res Function(HomeWorkModel) then,
  ) = _$HomeWorkModelCopyWithImpl<$Res, HomeWorkModel>;
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'class') String? className,
    String? section,
    String? subject,
    @JsonKey(name: 'add_homework') String? addHomework,
    @JsonKey(name: 'created_at') DateTime? createAt,
    @JsonKey(name: 'date_line') DateTime? dateLine,
  });
}

/// @nodoc
class _$HomeWorkModelCopyWithImpl<$Res, $Val extends HomeWorkModel>
    implements $HomeWorkModelCopyWith<$Res> {
  _$HomeWorkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? className = freezed,
    Object? section = freezed,
    Object? subject = freezed,
    Object? addHomework = freezed,
    Object? createAt = freezed,
    Object? dateLine = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            className: freezed == className
                ? _value.className
                : className // ignore: cast_nullable_to_non_nullable
                      as String?,
            section: freezed == section
                ? _value.section
                : section // ignore: cast_nullable_to_non_nullable
                      as String?,
            subject: freezed == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String?,
            addHomework: freezed == addHomework
                ? _value.addHomework
                : addHomework // ignore: cast_nullable_to_non_nullable
                      as String?,
            createAt: freezed == createAt
                ? _value.createAt
                : createAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            dateLine: freezed == dateLine
                ? _value.dateLine
                : dateLine // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeWorkModelImplCopyWith<$Res>
    implements $HomeWorkModelCopyWith<$Res> {
  factory _$$HomeWorkModelImplCopyWith(
    _$HomeWorkModelImpl value,
    $Res Function(_$HomeWorkModelImpl) then,
  ) = __$$HomeWorkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    @JsonKey(name: 'class') String? className,
    String? section,
    String? subject,
    @JsonKey(name: 'add_homework') String? addHomework,
    @JsonKey(name: 'created_at') DateTime? createAt,
    @JsonKey(name: 'date_line') DateTime? dateLine,
  });
}

/// @nodoc
class __$$HomeWorkModelImplCopyWithImpl<$Res>
    extends _$HomeWorkModelCopyWithImpl<$Res, _$HomeWorkModelImpl>
    implements _$$HomeWorkModelImplCopyWith<$Res> {
  __$$HomeWorkModelImplCopyWithImpl(
    _$HomeWorkModelImpl _value,
    $Res Function(_$HomeWorkModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? className = freezed,
    Object? section = freezed,
    Object? subject = freezed,
    Object? addHomework = freezed,
    Object? createAt = freezed,
    Object? dateLine = freezed,
  }) {
    return _then(
      _$HomeWorkModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        className: freezed == className
            ? _value.className
            : className // ignore: cast_nullable_to_non_nullable
                  as String?,
        section: freezed == section
            ? _value.section
            : section // ignore: cast_nullable_to_non_nullable
                  as String?,
        subject: freezed == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String?,
        addHomework: freezed == addHomework
            ? _value.addHomework
            : addHomework // ignore: cast_nullable_to_non_nullable
                  as String?,
        createAt: freezed == createAt
            ? _value.createAt
            : createAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dateLine: freezed == dateLine
            ? _value.dateLine
            : dateLine // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeWorkModelImpl implements _HomeWorkModel {
  _$HomeWorkModelImpl({
    this.id,
    @JsonKey(name: 'class') this.className,
    this.section,
    this.subject,
    @JsonKey(name: 'add_homework') this.addHomework,
    @JsonKey(name: 'created_at') this.createAt,
    @JsonKey(name: 'date_line') this.dateLine,
  });

  factory _$HomeWorkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeWorkModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'class')
  final String? className;
  // 'class' is a reserved keyword in Dart
  @override
  final String? section;
  @override
  final String? subject;
  @override
  @JsonKey(name: 'add_homework')
  final String? addHomework;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createAt;
  @override
  @JsonKey(name: 'date_line')
  final DateTime? dateLine;

  @override
  String toString() {
    return 'HomeWorkModel(id: $id, className: $className, section: $section, subject: $subject, addHomework: $addHomework, createAt: $createAt, dateLine: $dateLine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeWorkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.addHomework, addHomework) ||
                other.addHomework == addHomework) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.dateLine, dateLine) ||
                other.dateLine == dateLine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    className,
    section,
    subject,
    addHomework,
    createAt,
    dateLine,
  );

  /// Create a copy of HomeWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeWorkModelImplCopyWith<_$HomeWorkModelImpl> get copyWith =>
      __$$HomeWorkModelImplCopyWithImpl<_$HomeWorkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeWorkModelImplToJson(this);
  }
}

abstract class _HomeWorkModel implements HomeWorkModel {
  factory _HomeWorkModel({
    final int? id,
    @JsonKey(name: 'class') final String? className,
    final String? section,
    final String? subject,
    @JsonKey(name: 'add_homework') final String? addHomework,
    @JsonKey(name: 'created_at') final DateTime? createAt,
    @JsonKey(name: 'date_line') final DateTime? dateLine,
  }) = _$HomeWorkModelImpl;

  factory _HomeWorkModel.fromJson(Map<String, dynamic> json) =
      _$HomeWorkModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'class')
  String? get className; // 'class' is a reserved keyword in Dart
  @override
  String? get section;
  @override
  String? get subject;
  @override
  @JsonKey(name: 'add_homework')
  String? get addHomework;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createAt;
  @override
  @JsonKey(name: 'date_line')
  DateTime? get dateLine;

  /// Create a copy of HomeWorkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeWorkModelImplCopyWith<_$HomeWorkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
