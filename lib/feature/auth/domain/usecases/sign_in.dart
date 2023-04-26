import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/repositories/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

class SignIn extends UseCase<UserEntity, SignInParams> {
  SignIn(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) async =>
      _repository.signIn(params);
}

@freezed
class SignInParams with _$SignInParams {
  const factory SignInParams({
    @Default('') String email,
    @Default('') String password,
  }) = _SignInParams;

  factory SignInParams.fromJson(Map<String, dynamic> json) =>
      _$SignInParamsFromJson(json);
}
