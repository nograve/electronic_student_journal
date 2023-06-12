import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_params.freezed.dart';

@freezed
class UsersParams with _$UsersParams {
  const factory UsersParams({
    required List<String> uids,
  }) = _UsersParams;
}
