import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/find_students_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class FindStudentsUseCase
    extends AsyncUseCase<List<UserEntity>, FindStudentsParams> {
  FindStudentsUseCase({required FirestoreRepository firestoreRepository})
      : _firestoreRepository = firestoreRepository;

  final FirestoreRepository _firestoreRepository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(
    FindStudentsParams params,
  ) async {
    final response = await _firestoreRepository.findStudents(params);

    return response;
  }
}
