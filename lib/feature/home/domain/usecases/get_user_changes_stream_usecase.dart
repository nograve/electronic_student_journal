import 'package:electronic_student_journal/feature/shared/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserChangesStreamUseCase {
  GetUserChangesStreamUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Stream<User?> call() {
    return _authRepository.getUserChangesStream();
  }
}
