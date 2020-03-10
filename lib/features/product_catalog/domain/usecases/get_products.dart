import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:testproductcatalog/core/error/failure.dart';
import 'package:testproductcatalog/core/usecases/usecase.dart';
import 'package:testproductcatalog/features/product_catalog/domain/entities/product.dart';
import 'package:testproductcatalog/features/product_catalog/domain/repositories/catalog_repository.dart';
import 'package:testproductcatalog/features/product_catalog/domain/usecases/sort_by_enum.dart';

class GetProducts extends UseCase<List<Product>, Params> {
  final CatalogRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<Product>>> execute({
    @required name,
    @required categoryId,
    @required sortBy,
  }) async {
    return await repository.getProducts(name, categoryId, sortBy);
  }

  @override
  Future<Either<Failure, List<Product>>> call(Params params) async {
    return await repository.getProducts(
        params.name, params.categoryId, params.sortBy);
  }
}

class Params extends Equatable {
  final String name;
  final String categoryId;
  final SortBy sortBy;

  Params({
    @required this.name,
    @required this.categoryId,
    @required this.sortBy,
  });

  @override
  List<Object> get props => [name, categoryId, sortBy];
}
