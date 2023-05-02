import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase,
        super(const _Loading());

  final SignInUseCase _signInUseCase;
  final logger = Logger();

  Future<void> signIn(SignInParams params) async {
    emit(const AuthState.loading());
    final response = await _signInUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntity) {
        logger.i(userEntity.toString());
        emit(_Success(userEntity));
      },
    );
  }
}
