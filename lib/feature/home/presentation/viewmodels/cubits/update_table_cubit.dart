import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/update_table_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_table_state.dart';
part 'update_table_cubit.freezed.dart';

class UpdateTableCubit extends Cubit<UpdateTableState> {
  UpdateTableCubit({required UpdateTableUseCase updateTableUseCase})
      : _updateTableUseCase = updateTableUseCase,
        super(const _Initial());

  final UpdateTableUseCase _updateTableUseCase;

  Future<void> updateTable(EditTableParams params) async {
    emit(const _Loading());
    final response = await _updateTableUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (_) => emit(const _Success()),
    );
  }
}
