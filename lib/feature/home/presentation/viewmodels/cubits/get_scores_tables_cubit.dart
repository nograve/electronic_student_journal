import 'package:electronic_student_journal/feature/home/domain/entities/scores_table_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_model_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_scores_tables_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_scores_tables_state.dart';
part 'get_scores_tables_cubit.freezed.dart';

class GetScoresTablesCubit extends Cubit<GetScoresTablesState> {
  GetScoresTablesCubit({required GetScoresTablesUseCase getScoresTablesUseCase})
      : _getScoresTablesUseCase = getScoresTablesUseCase,
        super(const _Initial());

  final GetScoresTablesUseCase _getScoresTablesUseCase;

  Future<void> getScoresTables(UserEntity user) async {
    emit(const _Loading());
    final response = await _getScoresTablesUseCase
        .call(UserModelParams(user: user.toModel()));

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (tables) => emit(_Success(tables)),
    );
  }
}
