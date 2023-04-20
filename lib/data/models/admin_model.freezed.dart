// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return _AdminModel.fromJson(json);
}

/// @nodoc
mixin _$AdminModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  DateTime get lastAccessed => throw _privateConstructorUsedError;
  DateTime get registeredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminModelCopyWith<AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminModelCopyWith<$Res> {
  factory $AdminModelCopyWith(
          AdminModel value, $Res Function(AdminModel) then) =
      _$AdminModelCopyWithImpl<$Res, AdminModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String role,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class _$AdminModelCopyWithImpl<$Res, $Val extends AdminModel>
    implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_AdminModelCopyWith<$Res>
    implements $AdminModelCopyWith<$Res> {
  factory _$$_AdminModelCopyWith(
          _$_AdminModel value, $Res Function(_$_AdminModel) then) =
      __$$_AdminModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String role,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class __$$_AdminModelCopyWithImpl<$Res>
    extends _$AdminModelCopyWithImpl<$Res, _$_AdminModel>
    implements _$$_AdminModelCopyWith<$Res> {
  __$$_AdminModelCopyWithImpl(
      _$_AdminModel _value, $Res Function(_$_AdminModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? lastAccessed = null,
    Object? registeredAt = null,
  }) {
    return _then(_$_AdminModel(
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
class _$_AdminModel implements _AdminModel {
  const _$_AdminModel(
      {required this.id,
      required this.email,
      required this.role,
      required this.lastAccessed,
      required this.registeredAt});

  factory _$_AdminModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdminModelFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String role;
  @override
  final DateTime lastAccessed;
  @override
  final DateTime registeredAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminModelCopyWith<_$_AdminModel> get copyWith =>
      __$$_AdminModelCopyWithImpl<_$_AdminModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminModelToJson(
      this,
    );
  }
}

abstract class _AdminModel implements AdminModel {
  const factory _AdminModel(
      {required final String id,
      required final String email,
      required final String role,
      required final DateTime lastAccessed,
      required final DateTime registeredAt}) = _$_AdminModel;

  factory _AdminModel.fromJson(Map<String, dynamic> json) =
      _$_AdminModel.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get role;
  @override
  DateTime get lastAccessed;
  @override
  DateTime get registeredAt;
  @override
  @JsonKey(ignore: true)
  _$$_AdminModelCopyWith<_$_AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}
