import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/params/locale_params.dart';

abstract interface class LocaleRepository {
  Future<Either<Failure, String>> setLocale(LocaleParams params);
  Future<Either<Failure, String>> getLocale();
}
