import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/update_access_time_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/update_access_time_repository.dart';

class UpdateAccessTimeRepositoryImpl implements UpdateAccessTimeRepository {
  UpdateAccessTimeRepositoryImpl({
    required UpdateAccessTimeRemoteDataSource updateAccessTimeRemoteDataSource,
  }) : _updateAccessTimeRemoteDataSource = updateAccessTimeRemoteDataSource;

  final UpdateAccessTimeRemoteDataSource _updateAccessTimeRemoteDataSource;

  @override
  Future<Either<Failure, void>> updateAccessTime(UserParams params) async {
    final response =
        await _updateAccessTimeRemoteDataSource.updateAccessTime(params);

    return response;
  }
}
