import 'package:json_annotation/json_annotation.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/category.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class ProductModel extends Product {
  ProductModel({
    id,
    name,
    category,
    price,
  }) : super(
          id: id,
          name: name,
          category: category,
          price: price,
        );

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
