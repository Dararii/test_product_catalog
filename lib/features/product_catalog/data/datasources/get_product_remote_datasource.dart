import 'dart:convert';

import 'package:testproductcatalog/features/product_catalog/data/models/product_list_model.dart';
import 'package:testproductcatalog/features/product_catalog/data/models/product_model.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/category.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/sort_by_enum.dart';

abstract class GetProductRemoteDataSource {
  Future<ProductListModel> getProducts(
      String name, String categoryId, SortBy sortBy);

  Future<ProductModel> getProductById(String productId);
}

class GetProductRemoteDataSourceImpl implements GetProductRemoteDataSource {
  @override
  Future<ProductModel> getProductById(String productId) {
    /*String token = await Candidate().getToken();
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print('Token : ${token}');
    print(response);*/

    //Dummy Data in server
    ProductModel productInDatabase = ProductModel(
        id: "1",
        name: "Sampo Biore",
        category: Category(id: "1", name: "Sampo"),
        price: 10000);

    //Json data from server
    String jsonData = jsonEncode(productInDatabase);

    //Decode json
    ProductModel retrievedProduct =
        ProductModel.fromJson((jsonDecode(jsonData)));
    return Future.value(retrievedProduct);
  }

  @override
  Future<ProductListModel> getProducts(
      String name, String categoryId, SortBy sortBy) {
    //Dummy data in Server
    List<ProductModel> productInDatabase = List();
    productInDatabase.add(ProductModel(
        id: "1",
        name: "Sampo Biore 1",
        category: Category(id: "1", name: "Sampo"),
        price: 10000));
    productInDatabase.add(ProductModel(
        id: "2",
        name: "Sampo Biore 2",
        category: Category(id: "1", name: "Sampo"),
        price: 11000));
    productInDatabase.add(ProductModel(
        id: "3",
        name: "Sampo Biore 3",
        category: Category(id: "1", name: "Sampo"),
        price: 12000));
    productInDatabase.add(ProductModel(
        id: "4",
        name: "Sampo Biore 4",
        category: Category(id: "1", name: "Sampo"),
        price: 13000));

    ProductListModel productList =
        ProductListModel(products: productInDatabase);

    //Json data from server
    String jsonData = jsonEncode(productList);

    //Decode json
    ProductListModel retrievedProduct =
        ProductListModel.fromJson((jsonDecode(jsonData)));
    return Future.value(retrievedProduct);
  }
}
