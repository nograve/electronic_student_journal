import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required String role,
    required DateTime? registeredAt,
    required DateTime? lastAccessed,
    required String? name,
    required String? surname,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        uid: uid,
        email: email,
        role: role,
        registeredAt: registeredAt,
        lastAccessed: lastAccessed,
        name: name,
        surname: surname,
      );
}
