import 'package:equatable/equatable.dart';

class ScoresTableEntity extends Equatable {
  const ScoresTableEntity({
    required this.name,
    required this.createdAt,
    required this.ownerUid,
    required this.uid,
  });

  final String name;
  final DateTime createdAt;
  final String ownerUid;
  final String uid;

  @override
  List<Object?> get props => [name, createdAt, ownerUid];
}
