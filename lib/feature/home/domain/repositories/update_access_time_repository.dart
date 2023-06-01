import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';

abstract interface class UpdateAccessTimeRepository {
  Future<Either<Failure, void>> updateAccessTime(UserParams params);
}
