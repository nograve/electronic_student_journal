import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_user_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_data_state.dart';
part 'get_user_data_cubit.freezed.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required GetUserDataUsecase getUserDataUsecase})
      : _getUserDataUsecase = getUserDataUsecase,
        super(const _Initial());

  final GetUserDataUsecase _getUserDataUsecase;

  Future<void> getUserData(String uid) async {
    emit(const _Loading());
    final response = await _getUserDataUsecase.call(UserParams(uid: uid));

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntity) => emit(_Success(userEntity)),
    );
  }
}
