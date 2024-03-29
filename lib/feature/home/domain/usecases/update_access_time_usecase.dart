import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class UpdateAccessTimeUseCase extends AsyncUseCase<void, UserParams> {
  UpdateAccessTimeUseCase({
    required FirestoreRepository firestoreRepository,
  }) : _firestoreRepository = firestoreRepository;

  final FirestoreRepository _firestoreRepository;

  @override
  Future<Either<Failure, void>> call(UserParams params) async {
    final response = await _firestoreRepository.updateAccessTime(params);

    return response;
  }
}
