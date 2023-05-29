import 'package:equatable/equatable.dart';

enum UserRole {
  student(role: 'student'),
  teacher(role: 'teacher'),
  admin(role: 'admin'),
  ;

  const UserRole({required this.role});

  final String role;
}

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.email,
    required this.role,
    required this.registeredAt,
    required this.lastAccessed,
    required this.name,
    required this.surname,
  });

  final String uid;

  final String email;

  final String role;

  final DateTime registeredAt;

  final DateTime? lastAccessed;

  final String? name;

  final String? surname;

  @override
  List<Object?> get props => [
        uid,
        email,
        role,
        registeredAt,
        lastAccessed,
        name,
        surname,
      ];
}
