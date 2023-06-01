import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/register_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';

class RegisterUserUsecase extends UseCase<void, RegisterParams> {
  RegisterUserUsecase({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository;

  final RegisterRepository _registerRepository;

  @override
  Future<Either<Failure, void>> call(RegisterParams params) {
    final response = _registerRepository.registerUser(params);

    return response;
  }
}
