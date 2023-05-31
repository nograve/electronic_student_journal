import 'package:electronic_student_journal/feature/home/domain/usecases/register_user_usecase.dart';
import 'package:electronic_student_journal/feature/shared/domain/params/user_credentials_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_user_state.dart';
part 'register_user_cubit.freezed.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit({required RegisterUserUsecase registerUserUsecase})
      : _registerUserUsecase = registerUserUsecase,
        super(const _Initial());

  final RegisterUserUsecase _registerUserUsecase;

  Future<void> registerUser(String email, String password) async {
    emit(const _Loading());
    final response = await _registerUserUsecase
        .call(UserCredentialsParams(email: email, password: password));

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (success) => emit(const _Success()),
    );
  }
}
