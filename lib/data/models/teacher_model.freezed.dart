// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) {
  return _TeacherModel.fromJson(json);
}

/// @nodoc
mixin _$TeacherModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  DateTime get lastAccessed => throw _privateConstructorUsedError;
  DateTime get registeredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherModelCopyWith<TeacherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherModelCopyWith<$Res> {
  factory $TeacherModelCopyWith(
          TeacherModel value, $Res Function(TeacherModel) then) =
      _$TeacherModelCopyWithImpl<$Res, TeacherModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String role,
      String name,
      String surname,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class _$TeacherModelCopyWithImpl<$Res, $Val extends TeacherModel>
    implements $TeacherModelCopyWith<$Res> {
  _$TeacherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? name = null,
    Object? surname = null,
    Object? lastAccessed = null,
    Object? registeredAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessed: null == lastAccessed
          ? _value.lastAccessed
          : lastAccessed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeacherModelCopyWith<$Res>
    implements $TeacherModelCopyWith<$Res> {
  factory _$$_TeacherModelCopyWith(
          _$_TeacherModel value, $Res Function(_$_TeacherModel) then) =
      __$$_TeacherModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String role,
      String name,
      String surname,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class __$$_TeacherModelCopyWithImpl<$Res>
    extends _$TeacherModelCopyWithImpl<$Res, _$_TeacherModel>
    implements _$$_TeacherModelCopyWith<$Res> {
  __$$_TeacherModelCopyWithImpl(
      _$_TeacherModel _value, $Res Function(_$_TeacherModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? name = null,
    Object? surname = null,
    Object? lastAccessed = null,
    Object? registeredAt = null,
  }) {
    return _then(_$_TeacherModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      lastAccessed: null == lastAccessed
          ? _value.lastAccessed
          : lastAccessed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registeredAt: null == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeacherModel implements _TeacherModel {
  const _$_TeacherModel(
      {required this.id,
      required this.email,
      required this.role,
      required this.name,
      required this.surname,
      required this.lastAccessed,
      required this.registeredAt});

  factory _$_TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$$_TeacherModelFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String role;
  @override
  final String name;
  @override
  final String surname;
  @override
  final DateTime lastAccessed;
  @override
  final DateTime registeredAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeacherModelCopyWith<_$_TeacherModel> get copyWith =>
      __$$_TeacherModelCopyWithImpl<_$_TeacherModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeacherModelToJson(
      this,
    );
  }
}

abstract class _TeacherModel implements TeacherModel {
  const factory _TeacherModel(
      {required final String id,
      required final String email,
      required final String role,
      required final String name,
      required final String surname,
      required final DateTime lastAccessed,
      required final DateTime registeredAt}) = _$_TeacherModel;

  factory _TeacherModel.fromJson(Map<String, dynamic> json) =
      _$_TeacherModel.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get role;
  @override
  String get name;
  @override
  String get surname;
  @override
  DateTime get lastAccessed;
  @override
  DateTime get registeredAt;
  @override
  @JsonKey(ignore: true)
  _$$_TeacherModelCopyWith<_$_TeacherModel> get copyWith =>
      throw _privateConstructorUsedError;
}
