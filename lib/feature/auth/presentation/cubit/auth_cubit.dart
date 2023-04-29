import 'package:electronic_student_journal/feature/auth/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/auth/domain/usecases/post_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required PostSignIn postSignIn})
      : _postSignIn = postSignIn,
        super(const _Loading());

  final PostSignIn _postSignIn;

  Future<void> signIn(SignInParams params) async {
    emit(const AuthState.loading());
    final response = await _postSignIn.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntity) {
        print(userEntity);
        emit(_Success(userEntity));
      },
    );
  }
}
