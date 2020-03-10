import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:testproductcatalog/core/error/exception.dart';
import 'package:testproductcatalog/core/error/failure.dart';
import 'package:testproductcatalog/core/platform/network_info.dart';
import 'package:testproductcatalog/features/product_catalog/data/datasources/get_product_remote_datasource.dart';
import 'package:testproductcatalog/features/product_catalog/data/models/product_list_model.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';
import 'package:testproductcatalog/features/product_catalog/domain/repositories/catalog_repository.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/sort_by_enum.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final GetProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CatalogRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Product>> getProductById(String productId) async {
    return await _getProductById(productId);
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      String name, String category, SortBy sortBy) async {
    return await _getProducts(name, category, sortBy);
  }

  Future<Either<Failure, Product>> _getProductById(String productId) async {
    if (await networkInfo.isConnected) {
      try {
        Product p = await remoteDataSource.getProductById(productId);
        return Right(p);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }

  Future<Either<Failure, List<Product>>> _getProducts(
      String name, String category, SortBy sortBy) async {
    if (await networkInfo.isConnected) {
      try {
        ProductListModel p =
            await remoteDataSource.getProducts(name, category, sortBy);
        return Right(p.products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
