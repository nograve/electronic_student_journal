import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_params.freezed.dart';

@freezed
class UserParams with _$UserParams {
  const factory UserParams({
    required User user,
  }) = _UserParams;
}
