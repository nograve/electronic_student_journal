import 'package:electronic_student_journal/feature/home/domain/params/edit_table_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/create_table_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_table_state.dart';
part 'create_table_cubit.freezed.dart';

class CreateTableCubit extends Cubit<CreateTableState> {
  CreateTableCubit({required CreateTableUseCase createTableUseCase})
      : _createTableUseCase = createTableUseCase,
        super(const _Initial());

  final CreateTableUseCase _createTableUseCase;

  Future<void> createTable(EditTableParams params) async {
    emit(const _Loading());
    final response = await _createTableUseCase.call(params);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (_) => emit(const _Success()),
    );
  }
}
