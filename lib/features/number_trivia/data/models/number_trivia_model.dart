import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:testproductcatalog/features/number_trivia/domain/entities/number_trivia.dart';

part 'number_trivia_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(
          text: text,
          number: number,
        );

  factory NumberTriviaModel.fromJson(Map<dynamic, dynamic> json) =>
      _$NumberTriviaModelFromJson(json);

  Map<String, dynamic> toJson() => _$NumberTriviaModelToJson(this);
}
