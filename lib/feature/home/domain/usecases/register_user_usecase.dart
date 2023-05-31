import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';

class RegisterUserUsecase extends UseCase<void, UserCredentialsParams> {
  RegisterUserUsecase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  final RegisterRepository _registerRepository;

  @override
  Future<Either<Failure, void>> call(UserCredentialsParams params) {
    final response = _registerRepository.registerUser(params);

    return response;
  }
}
