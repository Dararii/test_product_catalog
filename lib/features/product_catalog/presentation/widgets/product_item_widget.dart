import 'package:flutter/material.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    Key key,
    @required this.p,
  }) : super(key: key);

  final Product p;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(p.id),
          Text(p.name),
          Text("Category: " + p.category.id + " - " + p.category.name),
          Text(p.price.toString()),
        ],
      ),
    );
  }
}
