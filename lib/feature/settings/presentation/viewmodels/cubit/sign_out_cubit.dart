import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/settings/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_state.dart';
part 'sign_out_cubit.freezed.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required SignOutUseCase signOutUseCase})
      : _signOutUseCase = signOutUseCase,
        super(const _Initial());

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    final response = await _signOutUseCase.call(NoParams());

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (success) => emit(const _Success()),
    );
  }
}
