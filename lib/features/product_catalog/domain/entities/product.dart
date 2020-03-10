import 'package:equatable/equatable.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/category.dart';

class Product with EquatableMixin {
  String id;
  String name;
  Category category;
  int price;

  Product({
    this.id,
    this.name,
    this.category,
    this.price,
  });

  @override
  List<Object> get props => [id, name, category, price];
}
