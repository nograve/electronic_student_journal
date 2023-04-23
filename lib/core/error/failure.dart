import 'package:equatable/equatable.dart';

///
abstract class Failure extends Equatable {
  ///
  const Failure(this.message);

  ///
  final String message;

  @override
  List<Object> get props => [message];
}

///
class ServerFailure extends Failure {
  ///
  const ServerFailure(super.message);
}

///
class ConnectionFailure extends Failure {
  ///
  const ConnectionFailure(super.message);
}

///
class EmptyDataFailure extends Failure {
  ///
  const EmptyDataFailure(super.message);
}

///
class SomeFailure extends Failure {
  ///
  const SomeFailure(super.message);
}