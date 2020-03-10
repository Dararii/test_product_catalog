import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => null;
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => null;
}

class InvalidBearerTokenFailure extends Failure {
  @override
  List<Object> get props => null;
}

class InvalidProductIdFailure extends Failure {
  @override
  List<Object> get props => null;
}

class InvalidCategoryIdFailure extends Failure {
  @override
  List<Object> get props => null;
}
