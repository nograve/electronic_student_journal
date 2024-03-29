import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/register_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/register_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({
    required RegisterRemoteDataSource registerRemoteDataSource,
  }) : _registerRemoteDataSource = registerRemoteDataSource;

  final RegisterRemoteDataSource _registerRemoteDataSource;

  @override
  Future<Either<Failure, void>> registerUser(
    RegisterParams params,
  ) async {
    final response = await _registerRemoteDataSource.registerUser(params);

    return response;
  }
}
