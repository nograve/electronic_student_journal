import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class AsyncUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class SyncUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
