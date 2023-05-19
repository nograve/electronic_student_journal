import 'package:equatable/equatable.dart';

abstract base class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

base class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

base class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

base class EmptyDataFailure extends Failure {
  const EmptyDataFailure(super.message);
}

base class SomeFailure extends Failure {
  const SomeFailure(super.message);
}
