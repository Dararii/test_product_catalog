import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class Category with EquatableMixin {
  String id;
  String name;

  Category({@required this.id, @required this.name});

  factory Category.fromJson(Map<dynamic, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object> get props => [id, name];
}
