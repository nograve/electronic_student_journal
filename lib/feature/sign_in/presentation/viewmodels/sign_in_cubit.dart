import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/feature/sign_in/domain/usecases/sign_in_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required SignInUseCase signInUseCase,
  })  : _signInUseCase = signInUseCase,
        super(const _Loading());

  final SignInUseCase _signInUseCase;

  Future<void> signIn(SignInParams params) async {
    emit(const _Loading());
    final response = await _signInUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (user) {
        injector<Logger>().i(user.toString());
        emit(_Success(user));
      },
    );
  }
}
