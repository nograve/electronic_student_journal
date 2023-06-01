import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:electronic_student_journal/core/error/failure.dart';
import 'package:electronic_student_journal/feature/home/data/datasources/update_access_time_remote_data_source.dart';
import 'package:electronic_student_journal/feature/home/domain/params/user_params.dart';

class UpdateAccessTimeRemoteDataSourceImpl
    implements UpdateAccessTimeRemoteDataSource {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, void>> updateAccessTime(UserParams params) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(params.user.uid)
          .update({'lastAccessed': DateTime.now()});
      return const Right(null);
    } catch (e) {
      return Left(SomeFailure(e.toString()));
    }
  }
}
