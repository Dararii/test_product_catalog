import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:testproductcatalog/features/product_catalog/data/models/product_model.dart';

part 'product_list_model.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true, anyMap: true)
class ProductListModel {
  List<ProductModel> products;

  ProductListModel({@required this.products});

  factory ProductListModel.fromJson(Map<dynamic, dynamic> json) =>
      _$ProductListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}
