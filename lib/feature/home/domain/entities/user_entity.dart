import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserRole {
  UserRole._();

  static const String student = 'student';
  static const String teacher = 'teacher';
  static const String admin = 'admin';
}

class UserEntity extends Equatable {
  const UserEntity({
    required this.email,
    required this.role,
    required this.registeredAt,
    required this.lastAccessed,
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.university,
    required this.group,
  });

  final String email;

  final String role;

  final DateTime registeredAt;

  final DateTime? lastAccessed;

  final String? surname;

  final String? name;

  final String? patronymic;

  final String? university;

  final String? group;

  UserModel toModel() => UserModel(
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

  @override
  List<Object?> get props => [
        email,
        role,
        registeredAt,
        lastAccessed,
        surname,
        name,
        patronymic,
        university,
        group,
      ];
}
