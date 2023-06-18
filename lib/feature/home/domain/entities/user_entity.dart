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
    required this.uid,
    required this.email,
    required this.role,
    required this.registeredAt,
    this.lastAccessed,
    this.surname,
    this.name,
    this.patronymic,
    this.university,
    this.group,
    this.fullName,
  });

  final String uid;

  final String email;

  final String role;

  final DateTime registeredAt;

  final DateTime? lastAccessed;

  final String? surname;

  final String? name;

  final String? patronymic;

  final String? university;

  final String? group;

  final String? fullName;

  UserModel toModel() => UserModel(
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
        fullName: fullName,
      );

  String get fullNameWithInitials => '$surname ${name![0]}. ${patronymic![0]}.';

  @override
  List<Object?> get props => [
        uid,
        email,
        role,
        registeredAt,
        lastAccessed,
        surname,
        name,
        patronymic,
        university,
        group,
        fullName,
      ];
}
