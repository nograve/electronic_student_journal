import 'package:electronic_student_journal/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

///
class Admin extends Equatable implements User {
  ///
  const Admin({
    required this.id,
    required this.email,
    required this.role,
    required this.lastAccessed,
    required this.registeredAt,
  });

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
        id,
        email,
        role,
        lastAccessed,
        registeredAt,
      ];
}
