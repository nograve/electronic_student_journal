import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/core/usecase/usecase.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';
import 'package:electronic_student_journal/feature/home/domain/repositories/update_access_time_repository.dart';

class UpdateAccessTimeUseCase extends UseCase<void, UserParams> {
  UpdateAccessTimeUseCase({
    required UpdateAccessTimeRepository updateAccessTimeRepository,
  }) : _updateAccessTimeRepository = updateAccessTimeRepository;

  final UpdateAccessTimeRepository _updateAccessTimeRepository;

  @override
  Future<Either<Failure, void>> call(UserParams params) async {
    final response = await _updateAccessTimeRepository.updateAccessTime(params);

    return response;
  }
}
