import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/locale_repository.dart';

class GetLocaleUseCase extends AsyncUseCase<String, NoParams> {
  GetLocaleUseCase({required LocaleRepository localeRepository})
      : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    final response = await _localeRepository.getLocale();

    return response;
  }
}
