import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/data/failure.dart';
import 'package:electronic_student_journal/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/domain/repositories/auth_repository.dart';
import 'package:electronic_student_journal/domain/usecases/usecase/usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in.freezed.dart';
part 'log_in.g.dart';

///
class LogIn extends UseCase<UserEntity, LogInParams> {
  ///
  LogIn(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(LogInParams params) =>
      _repository.signIn(params);
}

///
@freezed
class LogInParams with _$LogInParams {
  ///
  const factory LogInParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LogInParams;

  ///
  factory LogInParams.fromJson(Map<String, dynamic> json) =>
      _$LogInParamsFromJson(json);
}
