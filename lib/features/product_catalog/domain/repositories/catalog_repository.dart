import 'package:dartz/dartz.dart';
import 'package:testproductcatalog/core/error/failure.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/sort_by_enum.dart';

abstract class CatalogRepository {
  Future<Either<Failure, List<Product>>> getProducts(
      String name, String category, SortBy sortBy);

  Future<Either<Failure, Product>> getProductById(String productId);
}
