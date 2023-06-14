import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/locale_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/locale_repository.dart';

class SetLocaleUseCase extends AsyncUseCase<void, LocaleParams> {
  SetLocaleUseCase({required LocaleRepository localeRepository})
      : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<Either<Failure, String>> call(LocaleParams params) async {
    final response = await _localeRepository.setLocale(params);

    return response;
  }
}
