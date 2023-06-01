import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/user_repository.dart';

class GetUserDataUsecase extends UseCase<UserEntity, UserParams> {
  GetUserDataUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) async {
    final response = await _userRepository.getUserData(params.user);

    return response;
  }
}
