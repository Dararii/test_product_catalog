// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map json) {
  return ProductModel(
    id: json['id'],
    name: json['name'],
    category: Category.fromJson(json['category']),
    price: json['price'],
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category?.toJson(),
      'price': instance.price,
    };
