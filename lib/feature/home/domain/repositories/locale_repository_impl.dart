import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/exception.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/params/locale_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/locale_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<Either<Failure, String>> getLocale() async {
    try {
      final prefs = await _prefs;
      final locale = prefs.getString('locale');
      if (locale == null) {
        throw EmptyLocaleException();
      }
      return Right(locale);
    } on EmptyLocaleException {
      return const Left(EmptyLocaleFailure('No locale found.'));
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> setLocale(LocaleParams params) async {
    try {
      final prefs = await _prefs;
      await prefs.setString('locale', params.locale);
      return Right(params.locale);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
