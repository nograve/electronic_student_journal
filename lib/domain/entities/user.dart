///
abstract class User {
  ///
  User({
    required this.id,
    required this.email,
    required this.role,
    required this.lastAccessed,
    required this.registeredAt,
  });

  ///
  final String id;

  ///
  final String email;

  ///
  final String role;

  ///
  final DateTime lastAccessed;

  ///
  final DateTime registeredAt;
}
