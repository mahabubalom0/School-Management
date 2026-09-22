// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudentQuestionModel _$StudentQuestionModelFromJson(Map<String, dynamic> json) {
  return _StudentQuestionModel.fromJson(json);
}

/// @nodoc
mixin _$StudentQuestionModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_ans')
  String? get questionAns => throw _privateConstructorUsedError;
  @JsonKey(name: 'ans_replly', fromJson: _boolFromJson)
  bool get ansReplly => throw _privateConstructorUsedError;

  /// Serializes this StudentQuestionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentQuestionModelCopyWith<StudentQuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentQuestionModelCopyWith<$Res> {
  factory $StudentQuestionModelCopyWith(
    StudentQuestionModel value,
    $Res Function(StudentQuestionModel) then,
  ) = _$StudentQuestionModelCopyWithImpl<$Res, StudentQuestionModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'question') String question,
    @JsonKey(name: 'question_ans') String? questionAns,
    @JsonKey(name: 'ans_replly', fromJson: _boolFromJson) bool ansReplly,
  });
}

/// @nodoc
class _$StudentQuestionModelCopyWithImpl<
  $Res,
  $Val extends StudentQuestionModel
>
    implements $StudentQuestionModelCopyWith<$Res> {
  _$StudentQuestionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? question = null,
    Object? questionAns = freezed,
    Object? ansReplly = null,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            questionAns: freezed == questionAns
                ? _value.questionAns
                : questionAns // ignore: cast_nullable_to_non_nullable
                      as String?,
            ansReplly: null == ansReplly
                ? _value.ansReplly
                : ansReplly // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudentQuestionModelImplCopyWith<$Res>
    implements $StudentQuestionModelCopyWith<$Res> {
  factory _$$StudentQuestionModelImplCopyWith(
    _$StudentQuestionModelImpl value,
    $Res Function(_$StudentQuestionModelImpl) then,
  ) = __$$StudentQuestionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'question') String question,
    @JsonKey(name: 'question_ans') String? questionAns,
    @JsonKey(name: 'ans_replly', fromJson: _boolFromJson) bool ansReplly,
  });
}

/// @nodoc
class __$$StudentQuestionModelImplCopyWithImpl<$Res>
    extends _$StudentQuestionModelCopyWithImpl<$Res, _$StudentQuestionModelImpl>
    implements _$$StudentQuestionModelImplCopyWith<$Res> {
  __$$StudentQuestionModelImplCopyWithImpl(
    _$StudentQuestionModelImpl _value,
    $Res Function(_$StudentQuestionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudentQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? question = null,
    Object? questionAns = freezed,
    Object? ansReplly = null,
  }) {
    return _then(
      _$StudentQuestionModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        questionAns: freezed == questionAns
            ? _value.questionAns
            : questionAns // ignore: cast_nullable_to_non_nullable
                  as String?,
        ansReplly: null == ansReplly
            ? _value.ansReplly
            : ansReplly // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentQuestionModelImpl implements _StudentQuestionModel {
  const _$StudentQuestionModelImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'question') required this.question,
    @JsonKey(name: 'question_ans') this.questionAns,
    @JsonKey(name: 'ans_replly', fromJson: _boolFromJson)
    this.ansReplly = false,
  });

  factory _$StudentQuestionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentQuestionModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'question_ans')
  final String? questionAns;
  @override
  @JsonKey(name: 'ans_replly', fromJson: _boolFromJson)
  final bool ansReplly;

  @override
  String toString() {
    return 'StudentQuestionModel(id: $id, name: $name, question: $question, questionAns: $questionAns, ansReplly: $ansReplly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentQuestionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionAns, questionAns) ||
                other.questionAns == questionAns) &&
            (identical(other.ansReplly, ansReplly) ||
                other.ansReplly == ansReplly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, question, questionAns, ansReplly);

  /// Create a copy of StudentQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentQuestionModelImplCopyWith<_$StudentQuestionModelImpl>
  get copyWith =>
      __$$StudentQuestionModelImplCopyWithImpl<_$StudentQuestionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentQuestionModelImplToJson(this);
  }
}

abstract class _StudentQuestionModel implements StudentQuestionModel {
  const factory _StudentQuestionModel({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'question') required final String question,
    @JsonKey(name: 'question_ans') final String? questionAns,
    @JsonKey(name: 'ans_replly', fromJson: _boolFromJson) final bool ansReplly,
  }) = _$StudentQuestionModelImpl;

  factory _StudentQuestionModel.fromJson(Map<String, dynamic> json) =
      _$StudentQuestionModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'question_ans')
  String? get questionAns;
  @override
  @JsonKey(name: 'ans_replly', fromJson: _boolFromJson)
  bool get ansReplly;

  /// Create a copy of StudentQuestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentQuestionModelImplCopyWith<_$StudentQuestionModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
