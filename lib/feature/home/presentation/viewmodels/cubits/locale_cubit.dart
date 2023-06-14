import 'package:electronic_student_journal/core/app/di/injector.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/locale_params.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/get_locale_usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/usecases/set_locale_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit({
    required GetLocaleUseCase getLocaleUseCase,
    required SetLocaleUseCase setLocaleUseCase,
  })  : _getLocaleUseCase = getLocaleUseCase,
        _setLocaleUseCase = setLocaleUseCase,
        super(const _Initial());

  final GetLocaleUseCase _getLocaleUseCase;
  final SetLocaleUseCase _setLocaleUseCase;
  final _logger = injector<Logger>();

  Future<void> loadLocale() async {
    emit(const _Loading());
    final response = await _getLocaleUseCase.call(NoParams());
    _logger.w(response);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (locale) => emit(_Loaded(locale)),
    );
  }

  Future<void> saveLocale(LocaleParams params) async {
    emit(const _Loading());
    final response = await _setLocaleUseCase.call(params);
    _logger.w(response);

    response.fold(
      (failure) => emit(_Failure(failure.message)),
      (locale) => emit(_Saved(locale)),
    );
  }
}
