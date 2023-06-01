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
    required this.name,
    required this.surname,
    required this.university,
    required this.group,
  });

  final String email;

  final String role;

  final DateTime registeredAt;

  final DateTime? lastAccessed;

  final String? name;

  final String? surname;

  final String? university;

  final String? group;

  UserModel toModel() => UserModel(
        email: email,
        role: role,
        registeredAt: registeredAt,
        lastAccessed: lastAccessed,
        name: name,
        surname: surname,
        university: university,
        group: group,
      );

  @override
  List<Object?> get props => [
        email,
        role,
        registeredAt,
        lastAccessed,
        name,
        surname,
        university,
        group,
      ];
}
