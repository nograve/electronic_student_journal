import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/users_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_users_data_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_users_data_cubit_dart_cubit.freezed.dart';
part 'get_users_data_cubit_dart_state.dart';

class GetUsersDataCubit extends Cubit<GetUsersDataState> {
  GetUsersDataCubit({required GetUsersDataUseCase getUsersDataUseCase})
      : _getUsersDataUseCase = getUsersDataUseCase,
        super(const _Initial());

  final GetUsersDataUseCase _getUsersDataUseCase;

  Future<void> getUsersData(List<String> uids) async {
    emit(const _Loading());
    final response = await _getUsersDataUseCase.call(UsersParams(uids: uids));

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (userEntities) => emit(_Success(userEntities)),
    );
  }
}
