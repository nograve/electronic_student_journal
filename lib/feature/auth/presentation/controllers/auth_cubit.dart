import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_in_usecase.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
    required IsSignedInUsecase isSignedInUsecase,
  })  : _signInUseCase = signInUseCase,
        _signOutUseCase = signOutUseCase,
        _isSignedInUseCase = isSignedInUsecase,
        super(const _Loading());

  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;
  final IsSignedInUsecase _isSignedInUseCase;

  final _logger = Logger();

  Future<void> signIn(SignInParams params) async {
    emit(const _Loading());
    final response = await _signInUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntity) {
        _logger.i(userEntity.toString());
        emit(_Success(userEntity));
      },
    );
  }

  Future<void> signOut(NoParams params) async {
    emit(const _Loading());
    final response = await _signOutUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (_) {
        _logger.i('Signed out.');
        emit(const _Success(null));
      },
    );
  }

  Future<void> isSignedIn(NoParams params) async {
    emit(const _Loading());
    final response = await _isSignedInUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntity) => emit(_Success(userEntity)),
    );
  }
}
