import 'package:electronic_student_journal/domain/entities/user.dart';

////
abstract class Person extends User {
  ///
  Person({
    required this.name,
    required this.surname,
    required super.id,
    required super.email,
    required super.role,
    required super.lastAccessed,
    required super.registeredAt,
  });

  ///
  final String name;

  ///
  final String surname;
}
