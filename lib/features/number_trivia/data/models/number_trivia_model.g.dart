// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_trivia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberTriviaModel _$NumberTriviaModelFromJson(Map json) {
  return NumberTriviaModel(
    text: json['text'] as String,
    number: json['number'] as int,
  );
}

Map<String, dynamic> _$NumberTriviaModelToJson(NumberTriviaModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'number': instance.number,
    };
