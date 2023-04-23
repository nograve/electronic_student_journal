import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';

///
// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  ///
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}
