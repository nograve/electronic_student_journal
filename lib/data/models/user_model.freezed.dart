// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  DateTime? get registeredAt => throw _privateConstructorUsedError;
  DateTime? get lastAccessed => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String role,
      DateTime? registeredAt,
      DateTime? lastAccessed,
      String? name,
      String? surname});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? role = null,
    Object? registeredAt = freezed,
    Object? lastAccessed = freezed,
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastAccessed: freezed == lastAccessed
          ? _value.lastAccessed
          : lastAccessed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String role,
      DateTime? registeredAt,
      DateTime? lastAccessed,
      String? name,
      String? surname});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? role = null,
    Object? registeredAt = freezed,
    Object? lastAccessed = freezed,
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_$_UserModel(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      registeredAt: freezed == registeredAt
          ? _value.registeredAt
          : registeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastAccessed: freezed == lastAccessed
          ? _value.lastAccessed
          : lastAccessed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel with DiagnosticableTreeMixin implements _UserModel {
  const _$_UserModel(
      {required this.uid,
      required this.email,
      required this.role,
      required this.registeredAt,
      required this.lastAccessed,
      required this.name,
      required this.surname});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String role;
  @override
  final DateTime? registeredAt;
  @override
  final DateTime? lastAccessed;
  @override
  final String? name;
  @override
  final String? surname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(uid: $uid, email: $email, role: $role, registeredAt: $registeredAt, lastAccessed: $lastAccessed, name: $name, surname: $surname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('registeredAt', registeredAt))
      ..add(DiagnosticsProperty('lastAccessed', lastAccessed))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('surname', surname));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt) &&
            (identical(other.lastAccessed, lastAccessed) ||
                other.lastAccessed == lastAccessed) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, email, role, registeredAt, lastAccessed, name, surname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String uid,
      required final String email,
      required final String role,
      required final DateTime? registeredAt,
      required final DateTime? lastAccessed,
      required final String? name,
      required final String? surname}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get role;
  @override
  DateTime? get registeredAt;
  @override
  DateTime? get lastAccessed;
  @override
  String? get name;
  @override
  String? get surname;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
