import 'package:electronic_student_journal/domain/entities/person.dart';
import 'package:equatable/equatable.dart';

///
class Teacher extends Person with EquatableMixin {
  ///
  Teacher({
    required super.name,
    required super.surname,
    required super.id,
    required super.email,
    required super.role,
    required super.lastAccessed,
    required super.registeredAt,
  });

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
