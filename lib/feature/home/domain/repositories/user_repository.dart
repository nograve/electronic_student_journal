import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserEntity>> getUserData(User user);
}
