import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_huma_volve/core/error/error_handler.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entities/product.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/repositories/home_repository.dart';

class GetCategoriesProducts {
  final HomeRepository repository;

  GetCategoriesProducts(this.repository);

  Future<Either<Failure, List<Product>>> call({required int categoryId}) {
    return repository.getCategoriesProducts(categoryId: categoryId);
  }
}
