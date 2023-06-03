import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_student_journal/feature/home/data/converters/timestamp_converter.dart';
import 'package:electronic_student_journal/feature/home/data/converters/timestamp_nullable_converter.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required String role,
    @TimestampConverter() required DateTime registeredAt,
    @TimestampNullableConverter() DateTime? lastAccessed,
    String? surname,
    String? name,
    String? patronymic,
    String? university,
    String? group,
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
        surname: surname,
        name: name,
        patronymic: patronymic,
        university: university,
        group: group,
      );
}
