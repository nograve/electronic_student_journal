import 'package:electronic_student_journal/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

///
@freezed
class UserModel with _$UserModel {
  ///
  const factory UserModel({
    required String uid,
    required String email,
    required String role,
    required DateTime registeredAt,
    required DateTime lastAccessed,
    required String name,
    required String surname,
  }) = _UserModel;

  ///
  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  ///
  User toEntity() => User(
        uid: uid,
        email: email,
        role: role,
        registeredAt: registeredAt,
        lastAccessed: lastAccessed,
        name: name,
        surname: surname,
      );
}
