// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogInParams _$LogInParamsFromJson(Map<String, dynamic> json) {
  return _LogInParams.fromJson(json);
}

/// @nodoc
mixin _$LogInParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogInParamsCopyWith<LogInParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInParamsCopyWith<$Res> {
  factory $LogInParamsCopyWith(
          LogInParams value, $Res Function(LogInParams) then) =
      _$LogInParamsCopyWithImpl<$Res, LogInParams>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LogInParamsCopyWithImpl<$Res, $Val extends LogInParams>
    implements $LogInParamsCopyWith<$Res> {
  _$LogInParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LogInParamsCopyWith<$Res>
    implements $LogInParamsCopyWith<$Res> {
  factory _$$_LogInParamsCopyWith(
          _$_LogInParams value, $Res Function(_$_LogInParams) then) =
      __$$_LogInParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LogInParamsCopyWithImpl<$Res>
    extends _$LogInParamsCopyWithImpl<$Res, _$_LogInParams>
    implements _$$_LogInParamsCopyWith<$Res> {
  __$$_LogInParamsCopyWithImpl(
      _$_LogInParams _value, $Res Function(_$_LogInParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LogInParams(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LogInParams implements _LogInParams {
  const _$_LogInParams({this.email = '', this.password = ''});

  factory _$_LogInParams.fromJson(Map<String, dynamic> json) =>
      _$$_LogInParamsFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'LogInParams(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LogInParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LogInParamsCopyWith<_$_LogInParams> get copyWith =>
      __$$_LogInParamsCopyWithImpl<_$_LogInParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogInParamsToJson(
      this,
    );
  }
}

abstract class _LogInParams implements LogInParams {
  const factory _LogInParams({final String email, final String password}) =
      _$_LogInParams;

  factory _LogInParams.fromJson(Map<String, dynamic> json) =
      _$_LogInParams.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LogInParamsCopyWith<_$_LogInParams> get copyWith =>
      throw _privateConstructorUsedError;
}
