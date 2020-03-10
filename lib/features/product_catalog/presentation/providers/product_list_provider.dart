import 'package:flutter/foundation.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';

class ProductListProvider extends ChangeNotifier {
  List<Product> _products;

  void updateData(List<Product> products) {
    _products = products;
    notifyListeners();
    print("product list provider data updated");
  }

  List<Product> get products {
    return _products;
  }
}
