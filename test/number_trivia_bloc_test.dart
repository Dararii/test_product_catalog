import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:testproductcatalog/core/util/input_converter.dart';
import 'package:testproductcatalog/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:testproductcatalog/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:testproductcatalog/features/number_trivia/presentation/providers/number_trivia_bloc.dart';

class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concrete: mockGetConcreteNumberTrivia,
      random: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });
}
