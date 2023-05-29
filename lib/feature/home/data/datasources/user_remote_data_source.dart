import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class UserRemoteDataSource {
  Future<Either<Failure, UserModel>> getUserData(User user);
}
