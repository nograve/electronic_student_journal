import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/user_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/entities/user_entity.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserRemoteDataSource userRemoteDataSource})
      : _userRemoteDataSource = userRemoteDataSource;

  final UserRemoteDataSource _userRemoteDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUserData(User user) async {
    final response = await _userRemoteDataSource.getUserData(user);

    return response.fold(
      Left.new,
      (userModel) => Right(userModel.toEntity()),
    );
  }
}
