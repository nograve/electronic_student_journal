import 'package:electronic_student_journal/domain/entities/person.dart';
import 'package:equatable/equatable.dart';

///
class Teacher extends Equatable implements Person {
  ///
  const Teacher({
    required this.name,
    required this.surname,
    required this.id,
    required this.email,
    required this.role,
    required this.lastAccessed,
    required this.registeredAt,
  });

  @override
  final String name;

  @override
  final String surname;

  @override
  final String id;

  @override
  final String email;

  @override
  final String role;

  @override
  final DateTime lastAccessed;

  @override
  final DateTime registeredAt;

  @override
  List<Object?> get props => [
        name,
        surname,
        id,
        email,
        role,
        lastAccessed,
        registeredAt,
      ];
}
