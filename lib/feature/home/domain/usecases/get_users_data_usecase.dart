import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/users_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/firestore_repository.dart';

class GetUsersDataUseCase extends AsyncUseCase<List<UserEntity>, UsersParams> {
  GetUsersDataUseCase({required FirestoreRepository firestoreRepository})
      : _firestoreRepository = firestoreRepository;

  final FirestoreRepository _firestoreRepository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(
    UsersParams params,
  ) async {
    final response = await _firestoreRepository.getUsersData(params);

    return response;
  }
}
