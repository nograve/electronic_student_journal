// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return _Admin.fromJson(json);
}

/// @nodoc
mixin _$Admin {
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  DateTime get lastAccessed => throw _privateConstructorUsedError;
  DateTime get registeredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminCopyWith<Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCopyWith<$Res> {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) then) =
      _$AdminCopyWithImpl<$Res, Admin>;
  @useResult
  $Res call(
      {String email,
      String role,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class _$AdminCopyWithImpl<$Res, $Val extends Admin>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? role = null,
    Object? lastAccessed = null,
    Object? registeredAt = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_AdminCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$_AdminCopyWith(_$_Admin value, $Res Function(_$_Admin) then) =
      __$$_AdminCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String role,
      DateTime lastAccessed,
      DateTime registeredAt});
}

/// @nodoc
class __$$_AdminCopyWithImpl<$Res> extends _$AdminCopyWithImpl<$Res, _$_Admin>
    implements _$$_AdminCopyWith<$Res> {
  __$$_AdminCopyWithImpl(_$_Admin _value, $Res Function(_$_Admin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? role = null,
    Object? lastAccessed = null,
    Object? registeredAt = null,
  }) {
    return _then(_$_Admin(
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
class _$_Admin extends _Admin with DiagnosticableTreeMixin {
  const _$_Admin(
      {required this.email,
      required this.role,
      required this.lastAccessed,
      required this.registeredAt})
      : super._();

  factory _$_Admin.fromJson(Map<String, dynamic> json) =>
      _$$_AdminFromJson(json);

  @override
  final String email;
  @override
  final String role;
  @override
  final DateTime lastAccessed;
  @override
  final DateTime registeredAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Admin(email: $email, role: $role, lastAccessed: $lastAccessed, registeredAt: $registeredAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Admin'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('lastAccessed', lastAccessed))
      ..add(DiagnosticsProperty('registeredAt', registeredAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Admin &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.lastAccessed, lastAccessed) ||
                other.lastAccessed == lastAccessed) &&
            (identical(other.registeredAt, registeredAt) ||
                other.registeredAt == registeredAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, role, lastAccessed, registeredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
      __$$_AdminCopyWithImpl<_$_Admin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminToJson(
      this,
    );
  }
}

abstract class _Admin extends Admin {
  const factory _Admin(
      {required final String email,
      required final String role,
      required final DateTime lastAccessed,
      required final DateTime registeredAt}) = _$_Admin;
  const _Admin._() : super._();

  factory _Admin.fromJson(Map<String, dynamic> json) = _$_Admin.fromJson;

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
  _$$_AdminCopyWith<_$_Admin> get copyWith =>
      throw _privateConstructorUsedError;
}
