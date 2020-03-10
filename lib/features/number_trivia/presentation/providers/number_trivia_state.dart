import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:testproductcatalog/features/number_trivia/domain/entities/number_trivia.dart';

@immutable
abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]);
}

class Empty extends NumberTriviaState {
  @override
  List<Object> get props => null;
}

class Loading extends NumberTriviaState {
  @override
  List<Object> get props => null;
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia}) : super([trivia]);

  @override
  List<Object> get props => null;
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message}) : super([message]);

  @override
  List<Object> get props => null;
}
