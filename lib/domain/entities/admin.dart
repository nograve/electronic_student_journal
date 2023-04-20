import 'package:electronic_student_journal/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

///
class Admin extends User with EquatableMixin {
  ///
  Admin({
    required super.id,
    required super.email,
    required super.role,
    required super.lastAccessed,
    required super.registeredAt,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        role,
        lastAccessed,
        registeredAt,
      ];
}
