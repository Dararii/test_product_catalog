// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map json) {
  return ProductListModel(
    products: (json['products'] as List)
        ?.map((e) => e == null ? null : ProductModel.fromJson(e as Map))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
    };
