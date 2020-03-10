import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:testproductcatalog/core/error/failure.dart';
import 'package:testproductcatalog/core/usecases/usecase.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';
import 'package:testproductcatalog/features/product_catalog/domain/repositories/catalog_repository.dart';

class GetProductById extends UseCase<Product, Params> {
  final CatalogRepository repository;

  GetProductById(this.repository);

  Future<Either<Failure, Product>> execute({
    @required productId,
  }) async {
    return await repository.getProductById(productId);
  }

  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.getProductById(params.productId);
  }
}

class Params extends Equatable {
  final String productId;

  Params({
    @required this.productId,
  });

  @override
  List<Object> get props => [productId];
}
