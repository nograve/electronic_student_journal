import 'package:electronic_student_journal/domain/entities/admin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

///
@freezed
class AdminModel extends Admin with _$AdminModel {
  ///
  const factory AdminModel({
    required String id,
    required String email,
    required String role,
    required DateTime lastAccessed,
    required DateTime registeredAt,
  }) = _AdminModel;

  ///
  factory AdminModel.fromJson(Map<String, Object?> json) =>
      _$AdminModelFromJson(json);

  ///
  Admin toEntity() => Admin(
        id: id,
        email: email,
        role: role,
        lastAccessed: lastAccessed,
        registeredAt: registeredAt,
      );
}
