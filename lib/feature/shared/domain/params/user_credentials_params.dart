import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_params.freezed.dart';

@freezed
class UserCredentialsParams with _$UserCredentialsParams {
  const factory UserCredentialsParams({
    required String email,
    required String password,
  }) = _UserCredentialsParams;
}
