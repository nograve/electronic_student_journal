import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class TimestampNullableConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampNullableConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String email,
    required String role,
    @TimestampConverter() required DateTime registeredAt,
    @TimestampNullableConverter() required DateTime? lastAccessed,
    required String? name,
    required String? surname,
    required String? university,
    required String? group,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(
        email: email,
        role: role,
        registeredAt: registeredAt,
        lastAccessed: lastAccessed,
        name: name,
        surname: surname,
        university: university,
        group: group,
      );
}
