import 'package:electronic_student_journal/feature/home/domain/params/table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/delete_table_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_table_state.dart';
part 'delete_table_cubit.freezed.dart';

class DeleteTableCubit extends Cubit<DeleteTableState> {
  DeleteTableCubit({required DeleteTableUseCase deleteTableUseCase})
      : _deleteTableUseCase = deleteTableUseCase,
        super(const _Initial());

  final DeleteTableUseCase _deleteTableUseCase;

  Future<void> deleteTable(TableParams params) async {
    emit(const _Loading());
    final response = await _deleteTableUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (_) => emit(const _Success()),
    );
  }
}
